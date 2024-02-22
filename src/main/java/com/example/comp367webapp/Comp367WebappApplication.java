package com.example.comp367webapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class Comp367WebappApplication {

    public static void main(String[] args) {
        SpringApplication.run(Comp367WebappApplication.class, args);
    }

    @RestController
    public static class Comp367Controller {

        @GetMapping("/")
        public String welcome() {
            return "Welcome to COMP367";
        }
    }
}
