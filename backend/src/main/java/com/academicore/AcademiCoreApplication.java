package com.academicore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan(basePackages = "com.academicore")
@EnableJpaRepositories(basePackages = "com.academicore")
public class AcademiCoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(AcademiCoreApplication.class, args);
    }
}
