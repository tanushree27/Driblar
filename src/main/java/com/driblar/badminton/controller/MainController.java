package com.driblar.badminton.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/")
@Controller
public class MainController {

    @RequestMapping(method = RequestMethod.GET)
    public String printHelloWorld (ModelMap model) {
        model.addAttribute("message", "hello Tashu");
        return "hello";
    }
}
