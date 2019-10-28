package com.newlearn.facemd.controller;

import com.newlearn.facemd.domain.Role;
import com.newlearn.facemd.domain.User;
import com.newlearn.facemd.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Model model) {
        User userFromDb = userRepository.findByUsername(user.getUsername());
        String alert = "Input your date:";
        if(userFromDb != null) {
            model.addAttribute("message", "User already exist!");
            return "registration";
        }
        else{
            user.setActive(true);
            user.setRoles(Collections.singleton(Role.USER));
            userRepository.save(user);
            return "redirect:/login";
        }
    }
}
