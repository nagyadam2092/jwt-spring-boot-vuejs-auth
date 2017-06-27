package org.nagyadam2092.tripchecker.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by adam on 2017.06.27..
 */
@RestController
public class AppController {
    @GetMapping(value = "/app")
    public String index() {
        return "index";
    }
}
