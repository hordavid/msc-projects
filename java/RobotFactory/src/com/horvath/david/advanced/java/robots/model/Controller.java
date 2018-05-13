package com.horvath.david.advanced.java.robots.model;

import com.horvath.david.advanced.java.robots.config.RobotFactoryConfiguration;
import com.horvath.david.advanced.java.robots.enums.Phase;
import com.horvath.david.advanced.java.robots.model.product.util.ProductUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;
import java.util.function.Supplier;
import java.util.logging.Logger;

public class Controller extends Thread {

    private final static Logger log = Logger.getLogger(Controller.class.getName());

    private RobotFactoryConfiguration configuration;
    private List<Robot> robots;
    private int minWait;
    private int maxWait;

    public Controller(RobotFactoryConfiguration configuration, int minWait, int maxWait) {
        this.configuration = configuration;
        this.minWait = minWait;
        this.maxWait = maxWait;
        this.robots = new ArrayList<>();
    }

    public List<Robot> getRobots() {
        return robots;
    }

    public void setRobots(List<Robot> robots) {
        this.robots = robots;
    }

    @Override
    public void run() {
        log.info(String.format("Controller initiated and oversees %d robots.", robots.size()));

        while (isAllRobotRunning.get()) {
            robots.stream()
                    .forEach(robot -> {
                        if (isChangePhase(robot)) {
                            Phase phase = robot.getPhase();

                            switch (phase) {
                                case START:
                                    robot.setCrafter(ProductUtil.craftProduct2);
                                    break;
                                case PROCESS:
                                    robot.setCrafter(ProductUtil.craftProduct3);
                                    break;
                                case FINISH:
                                    robot.setExecute(false);
                                default:
                                    robot.setCrafter(ProductUtil.craftProduct1);
                            }

                            Phase newPhase = phase.nextPhase();
                            robot.setPhase(newPhase);

                        } else {
                            craftProduct(robot);
                        }
                    });
            sleep();
        }

        joinRobots();

        log.info("Controller stop running.");
    }

    private void joinRobots() {
        try {
            for (Robot robot : robots) {
                robot.join();
            }
        } catch (InterruptedException e) {
            log.severe("Error during joinning robots. " + e);
        }
    }

    private Phase changePhase(Phase phase) {
        return Phase.values()[(phase.ordinal() + 1) % Phase.values().length];
    }

    private void sleep() {
        try {
            Thread.sleep(calcSleepMilis.get());
        } catch (InterruptedException e) {
            log.severe("Controller interrupted.");
        }
    }

    private boolean isChangePhase(Robot robot) {
        if (robot.getPhase().equals(Phase.START) && robot.getProduct1List().size() >= configuration.getMaxProducts().get(0)) {
            return true;
        } else if (robot.getPhase().equals(Phase.PROCESS) && robot.getProduct2List().size() >= configuration.getMaxProducts().get(1)) {
            return true;
        } else if (robot.getPhase().equals(Phase.FINISH) && robot.getProduct3List().size() >= configuration.getMaxProducts().get(2)) {
            return true;
        }
        return false;
    }

    private void craftProduct(Robot robot) {
        robot.addProducts(ProductUtil.getProducts1.apply(robot.getIndex()));
        robot.addProducts(ProductUtil.getProducts2.apply(robot.getIndex()));
        robot.addProducts(ProductUtil.getProducts3.apply(robot.getIndex()));
    }

    private Supplier<Integer> calcSleepMilis = () -> ThreadLocalRandom.current().nextInt(minWait, maxWait);

    private Supplier<Boolean> isAllRobotRunning = () -> robots.stream().allMatch(robot -> robot.isExecute());

}
