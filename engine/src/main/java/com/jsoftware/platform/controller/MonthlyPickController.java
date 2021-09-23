package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.MonthlyPick;
import com.jsoftware.platform.service.MonthlyPickService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class MonthlyPickController {

    private MonthlyPickService Service;

    @GetMapping("/api/monthlyPick")
    public List<MonthlyPick> getMonthlyPicks() {
        System.out.println("******GET1 register");
        return Service.readMonthlyPicks();
    }

    @GetMapping("/api/monthlyPick/{id}")
    public MonthlyPick getMonthlyPick(@PathVariable("id") Long id) {
        System.out.println(id);
        return Service.readMonthlyPick(id);
    }

    @PostMapping("/api/monthlyPick")
    public MonthlyPick createMonthlyPick(@RequestBody MonthlyPick monthlyPick) {
        return Service.createMonthlyPick(monthlyPick);
    }
}