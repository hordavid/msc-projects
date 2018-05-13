package com.horvath.david.advanced.java.robots.model.product.util;

import com.horvath.david.advanced.java.robots.model.product.Product;
import com.horvath.david.advanced.java.robots.model.product.Product1;
import com.horvath.david.advanced.java.robots.model.product.Product2;
import com.horvath.david.advanced.java.robots.model.product.Product3;

import java.util.List;
import java.util.function.BiFunction;
import java.util.function.Function;
import java.util.function.Supplier;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class ProductUtil {

    public static Supplier<Product> product1Supplier = () -> new Product1();

    public static Function<Integer, List<Product>> getProducts1 = n -> Stream.generate(product1Supplier).limit(n).collect(Collectors.toList());

    public static BiFunction<List<Product>, List<Product>, Product> craftProduct1 = (products2, products3) -> product1Supplier.get();

    public static Supplier<Product> product2Supplier = () -> new Product2();

    public static Function<Integer, List<Product>> getProducts2 = n -> Stream.generate(product2Supplier).limit(n).collect(Collectors.toList());

    public static BiFunction<List<Product>, List<Product>, Product> craftProduct2 = (products1, products3) -> product2Supplier.get();

    public static Supplier<Product> product3Supplier = () -> new Product3();

    public static Function<Integer, List<Product>> getProducts3 = n -> Stream.generate(product3Supplier).limit(n).collect(Collectors.toList());

    public static BiFunction<List<Product>, List<Product>, Product> craftProduct3 = (products1, products2) -> product3Supplier.get();

}

