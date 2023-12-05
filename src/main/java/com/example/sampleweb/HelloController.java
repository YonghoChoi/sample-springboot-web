package com.example.sampleweb;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
public class HelloController {

    @RequestMapping("/hello")
    public String index() {
        try{
            String hostname = InetAddress.getLocalHost().getHostName();
            String hostAddr = InetAddress.getLocalHost().getHostAddress();
            return "Hello, This server is " + hostname + "(" + hostAddr + ")";
        }
        catch( UnknownHostException e ){
            e.printStackTrace();
        }
        return "Greetings from Spring Boot!";
    }
}