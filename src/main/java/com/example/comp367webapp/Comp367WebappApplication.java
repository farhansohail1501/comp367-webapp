package com.example.comp367webapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalTime;

@SpringBootApplication
public class Comp367WebappApplication {

    public static void main(String[] args) {
        SpringApplication.run(Comp367WebappApplication.class, args);
    }

    @RestController
    public static class Comp367Controller {

        @GetMapping("/")
        public String welcome() {
            String greeting = getGreetingMessage();
            return greeting;
        }

        private String getGreetingMessage() {
            LocalTime currentTime = LocalTime.now();
            int hour = currentTime.getHour();

            if (hour >= 0 && hour < 12) {
                return "Good morning, Welcome to COMP367";
            } else if (hour >= 12 && hour < 18) {
                return "Good afternoon, Welcome to COMP367";
            } else {
                return "Good evening, Welcome to COMP367";
            }
        }
    }
}
