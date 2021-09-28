package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.MonthlyPick;
import com.jsoftware.platform.service.MonthlyPickService;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
        System.out.println("****** MonthlyPick list");
        return Service.readMonthlyPicks();
    }

    @GetMapping("/api/monthlyPick/{id}")
    public MonthlyPick getMonthlyPick(@PathVariable("id") int id) {
        System.out.println("****** MonthlyPick: " + id);
        return Service.readMonthlyPick(id);
    }

    @PostMapping("/api/monthlyPick")
    public MonthlyPick createMonthlyPick(@RequestBody MonthlyPick monthlyPick) {
        System.out.println("******Create MonthlyPick");
        return Service.createMonthlyPick(monthlyPick);
    }

    @PutMapping("/api/monthlyPick/{id}")
    public MonthlyPick updateMonthlyPick(@PathVariable("id") int id, @RequestBody MonthlyPick monthlyPick) {
        monthlyPick.setId(id);
        System.out.println("******Update MonthlyPick");
        return Service.updateMonthlyPick(monthlyPick);
    }

    @DeleteMapping("/api/monthlyPick/{id}")
    public String DeleteMonthlyPick(@PathVariable("id") int id) {
        System.out.println("******Delete Hotspot");
        Service.deleteMonthlyPick(id);
        System.out.println("******Delete Hotspot complete");
        return "delete id" + id;
    }
}