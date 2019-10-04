package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class httpController {
    @RequestMapping("/test")
    public String a1(){
        System.out.println("123");
        return "123";
    }
}
