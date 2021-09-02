package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.Board;
import com.jsoftware.platform.model.User;
import com.jsoftware.platform.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class UserTestController {

    @GetMapping("/test")
    public String getUser(Model model) {
        User user = new User("kkaok", "테스트", "web");
        model.addAttribute("user", user);
        return "test";
    }

}

