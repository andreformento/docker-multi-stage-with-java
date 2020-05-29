package com.formento.multistage;

public class Product {

    private final String id;
    private final String title;

    public Product(String id, String title) {
        this.id = id;
        this.title = title;
    }

    public String getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }
}
