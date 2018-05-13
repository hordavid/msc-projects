package com.horvath.david.advanced.java.robots.enums;


public enum Phase {
    START(100, 130),
    PROCESS(100, 110),
    FINISH(100, 130);

    int minRobotWait;
    int maxRobotWait;

    Phase(int minRobotWait, int maxRobotWait) {
        this.minRobotWait = minRobotWait;
        this.maxRobotWait = maxRobotWait;
    }

    public int getMinRobotWait() {
        return minRobotWait;
    }

    public int getMaxRobotWait() {
        return maxRobotWait;
    }


    public Phase nextPhase() {
        return this.equals(START) ? PROCESS : this.equals(PROCESS) ? FINISH : FINISH;
    }
}
