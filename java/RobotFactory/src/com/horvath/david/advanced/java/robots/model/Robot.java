package com.horvath.david.advanced.java.robots.model;

import com.horvath.david.advanced.java.robots.enums.Phase;
import com.horvath.david.advanced.java.robots.model.product.Product;
import com.horvath.david.advanced.java.robots.model.product.Product1;
import com.horvath.david.advanced.java.robots.model.product.Product2;
import com.horvath.david.advanced.java.robots.model.product.util.ProductUtil;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;
import java.util.function.BiFunction;
import java.util.function.IntSupplier;
import java.util.logging.Logger;

public class Robot extends Thread {

    private final static Logger log = Logger.getLogger(Robot.class.getName());

    private int index;
    private String name;
    private Phase phase;
    private boolean execute;

    private Map<Phase, List<Integer>> limits;

    private List<Product> product1List;
    private List<Product> product2List;
    private List<Product> product3List;

    private BiFunction<List<Product>, List<Product>, Product> crafter;

    public Robot(int index, Map<Phase, List<Integer>> limits, List<Integer> initProducts) {
        this.index = index + 1;
        this.name = String.format("CL4P-TP-%s robot unit", this.index);
        this.limits = limits;
        this.phase = Phase.START;
        this.execute = true;

        this.product1List = ProductUtil.getProducts1.apply(initProducts.get(0));
        this.product2List = ProductUtil.getProducts2.apply(initProducts.get(1));
        this.product3List = ProductUtil.getProducts3.apply(initProducts.get(2));
    }

    @Override
    public void run() {
        log.info(String.format("%s created whit phase %s.", this, phase));

        while (execute) {
            log.info(String.format("%s running in %s phase.", this, phase));

            craftProduct();
            log.info(String.format("%s prod1=%s prod2=%s prod3=%s", this, product1List.size(), product2List.size(), product3List.size()));

            sleep();
        }

        log.info(String.format("%s stop running.", this));
    }

    private void sleep() {
        try {
            Thread.sleep(calcSleepMilis.getAsInt());
        } catch (InterruptedException e) {
            log.severe(String.format("% interrupted.", this));
        }
    }

    private IntSupplier calcSleepMilis = () ->
            ThreadLocalRandom.current().nextInt(phase.getMinRobotWait(), phase.getMaxRobotWait());

    public int getIndex() {
        return index;
    }

    public Phase getPhase() {
        return phase;
    }

    public void setPhase(Phase phase) {
        if (phase.equals(Phase.FINISH) && this.phase.equals(Phase.FINISH)) {
            setExecute(false);
        }
        this.phase = phase;
    }

    public boolean isExecute() {
        return execute;
    }

    public void setExecute(boolean execute) {
        this.execute = execute;
    }

    public List<Product> getProduct1List() {
        return product1List;
    }

    public void setProduct1List(List<Product> product1List) {
        this.product1List = product1List;
    }

    public List<Product> getProduct2List() {
        return product2List;
    }

    public void setProduct2List(List<Product> product2List) {
        this.product2List = product2List;
    }

    public List<Product> getProduct3List() {
        return product3List;
    }

    public void setProduct3List(List<Product> product3List) {
        this.product3List = product3List;
    }

    public BiFunction<List<Product>, List<Product>, Product> getCrafter() {
        return crafter;
    }

    public void setCrafter(BiFunction<List<Product>, List<Product>, Product> crafter) {
        this.crafter = crafter;
    }

    public void addProduct(Product product) {
        if (product instanceof Product1) {
            product1List.add(product);
        } else if (product instanceof Product2) {
            product2List.add(product);
        } else {
            product3List.add(product);
        }
    }

    public void addProducts(List<Product> products) {
        products.forEach(this::addProduct);
    }

    private void craftProduct() {
        int prod1Num = limits.get(phase).get(0);
        int prod2Num = limits.get(phase).get(1);
        int prod3Num = limits.get(phase).get(2);

        if (phase.equals(Phase.START) && product2List.size() >= prod2Num && product3List.size() >= prod3Num) {
            List<Product> prod2 = product2List.subList(0, prod2Num);
            product2List.removeAll(prod2);
            List<Product> prod3 = product3List.subList(0, prod3Num);
            product3List.removeAll(prod3);

            addProduct(crafter.apply(prod2, prod3));

        } else if (phase.equals(Phase.PROCESS) && product1List.size() >= prod1Num && product3List.size() >= prod3Num) {
            List<Product> prod1 = product1List.subList(0, prod1Num);
            product1List.removeAll(prod1);
            List<Product> prod3 = product3List.subList(0, prod3Num);
            product3List.removeAll(prod3);

            addProduct(crafter.apply(prod1, prod3));

        } else if (phase.equals(Phase.FINISH) && product1List.size() >= prod1Num && product2List.size() >= prod2Num) {
            List<Product> prod1 = product1List.subList(0, prod1Num);
            product1List.removeAll(prod1);
            List<Product> prod2 = product2List.subList(0, prod2Num);
            product2List.removeAll(prod2);

            addProduct(crafter.apply(prod1, prod2));
        }
    }

    @Override
    public String toString() {
        return name;
    }
}
