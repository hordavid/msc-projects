package com.horvath.david.advanced.java.robots.config;

import java.util.ArrayList;
import java.util.List;

public class RobotFactoryConfiguration {

    private int numRobots;
    List<Integer> minProducts;
    List<Integer> maxProducts;

    public RobotFactoryConfiguration() {
        numRobots = 0;
        minProducts = new ArrayList<>();
        maxProducts = new ArrayList<>();
    }

    public int getNumRobots() {
        return numRobots;
    }

    public void setNumRobots(int numRobots) {
        this.numRobots = numRobots;
    }

    public List<Integer> getMinProducts() {
        return minProducts;
    }

    public void setMinProducts(List<Integer> minProducts) {
        this.minProducts = minProducts;
    }

    public List<Integer> getMaxProducts() {
        return maxProducts;
    }

    public void setMaxProducts(List<Integer> maxProducts) {
        this.maxProducts = maxProducts;
    }

    @Override
    public String toString() {
        return "RobotFactoryConfiguration={" +
                "numRobots: " + numRobots +
                ", minProducts: " + minProducts +
                ", maxProducts: " + maxProducts +
                '}';
    }
}
