package com.newlearn.facemd.controller;

import com.newlearn.facemd.domain.User;
import com.newlearn.facemd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RegistrationController {

    @Autowired
    UserService userService;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Model model) {

        if(!userService.addUser(user)) {
            model.addAttribute("message", "User already exist!");
            return "registration";
        }
        else{
            userService.addUser(user);
            return "redirect:/login";
        }
    }

    @GetMapping("/activate/{code}")
        public String activate(@PathVariable String code, Model model){
            boolean isActivated = userService.activateUser(code);
            if (isActivated)
                model.addAttribute("message", "User successfully activated");
            else model.addAttribute("message", "Activation failed");
        return "login";
        }
}
