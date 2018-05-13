package com.horvath.david.advanced.java.robots.model.product;

public abstract class Product {

    protected String name;

    public Product() {
        this.name = "Product";
    }

    public Product(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }
}
