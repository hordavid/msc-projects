package com.horvath.david.advanced.java.robots.model.product;

public class Product1 extends Product {

    private long id;

    public Product1() {
        super("Product1");
        this.id = 0L;
    }

    public Product1(String name) {
        super(name);
        this.id = 0L;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
