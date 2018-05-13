package com.horvath.david.advanced.java.robots;

import com.horvath.david.advanced.java.robots.config.ConfigurationReader;
import com.horvath.david.advanced.java.robots.config.RobotFactoryConfiguration;
import com.horvath.david.advanced.java.robots.enums.Phase;
import com.horvath.david.advanced.java.robots.model.Controller;
import com.horvath.david.advanced.java.robots.model.Robot;
import com.horvath.david.advanced.java.robots.model.product.util.ProductUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import java.util.stream.IntStream;


public class RobotFactory {

    private final static Logger log = Logger.getLogger(RobotFactory.class.getName());

    private List<Robot> robots;
    private RobotFactoryConfiguration configuration;

    private RobotFactory(String configFileName) {
        configuration = ConfigurationReader.readFile(configFileName);

        if (configuration != null) {
            log.info(String.format("Read %s successfully.", configFileName));

            robots = new ArrayList<>(configuration.getNumRobots());

            log.info("RobotFactory initiated.");
        } else {
            log.severe("Error during initialize RobotFactory the program terminated.");
            System.exit(1);
        }
    }

    public List<Robot> getRobots() {
        return robots;
    }

    public RobotFactoryConfiguration getConfiguration() {
        return configuration;
    }

    public static void main(String[] args) {
        log.info("Robot Factory main start.");

        String config = "config.txt";

        if (args.length > 0) {
            config = args[0];
        }

        RobotFactory factory = new RobotFactory(config);


        Map<Phase, List<Integer>> limits = new HashMap<>() {{
           put(Phase.START, List.of(0,4,2));
           put(Phase.PROCESS, List.of(5,0,5));
           put(Phase.FINISH, List.of(2,2,0));
        }};

        log.info("Robot workers start.");
        IntStream.range(0, factory.getConfiguration().getNumRobots())
                .mapToObj(i -> {
                    Robot robot = new Robot(i, limits, factory.getConfiguration().getMinProducts());
                    robot.setCrafter(ProductUtil.craftProduct1);
                    robot.setProduct1List(ProductUtil.getProducts1.apply(factory.getConfiguration().getMinProducts().get(0)));
                    robot.setProduct2List(ProductUtil.getProducts2.apply(factory.getConfiguration().getMinProducts().get(1)));
                    robot.setProduct3List(ProductUtil.getProducts3.apply(factory.getConfiguration().getMinProducts().get(2)));
                    return robot;
                })
                .peek(Robot::start)
                .forEach(robot -> factory.getRobots().add(robot));

        Controller controller = new Controller(factory.getConfiguration(), 1000, 1030);
        controller.setRobots(factory.getRobots());

        log.info("Start controller.");
        controller.start();

        try {
            controller.join();
        } catch (InterruptedException e) {
            log.severe("Error during joinning controller. " + e);
        }

        log.info("All robot stop working.");


        log.info("Robot Factory main terminate...");
    }

}
