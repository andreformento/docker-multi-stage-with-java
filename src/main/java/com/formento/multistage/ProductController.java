package com.formento.multistage;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;

import static java.util.UUID.randomUUID;

@RestController
@RequestMapping("/products")
public class ProductController {

    @GetMapping
    public Flux<Product> getAll() {
        return Flux.just(
                new Product(randomUUID().toString(), "Product 1"),
                new Product(randomUUID().toString(), "Product 2")
        );
    }

}
