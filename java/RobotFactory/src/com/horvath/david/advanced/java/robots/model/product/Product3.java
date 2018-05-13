package com.horvath.david.advanced.java.robots.model.product;

public class Product3 extends Product {

    private short weight;

    public Product3() {
        super("Product3");
        this.weight = 10;
    }

    public Product3(String name) {
        super(name);
        this.weight = 10;
    }

    public short getWeight() {
        return weight;
    }

    public void setWeight(short weight) {
        this.weight = weight;
    }
}
