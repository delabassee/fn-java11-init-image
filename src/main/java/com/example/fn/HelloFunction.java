package com.example.fn;

import java.util.Properties;

public class HelloFunction {

    public String handleRequest(String input) {

        var name = (input == null || input.isEmpty()) ? "world"  : input;

        return "Hello, " + name + " | Java " + java.lang.Runtime.version() + " " + System.getProperties().getProperty("java.vendor") + " " + System.getProperties().getProperty("os.version") ;

    }
}