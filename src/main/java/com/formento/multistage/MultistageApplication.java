package com.formento.multistage;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.context.annotation.Bean;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.annotation.JsonAutoDetect;

@SpringBootApplication
public class MultistageApplication {

	public static void main(String[] args) {
		SpringApplication.run(MultistageApplication.class, args);
	}

    @Bean
    public Jackson2ObjectMapperBuilderCustomizer jacksonCustomizer(){
        return builder ->
                builder.visibility(PropertyAccessor.FIELD, JsonAutoDetect.Visibility.ANY); // enable record serialization
    }

}
