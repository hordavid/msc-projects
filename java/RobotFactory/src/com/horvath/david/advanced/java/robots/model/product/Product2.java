package com.horvath.david.advanced.java.robots.model.product;

public class Product2 extends Product {

    private boolean isActive;

    public Product2() {
        super("Product2");
        this.isActive = false;
    }

    public Product2(String name) {
        super(name);
        this.isActive = false;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }
}
