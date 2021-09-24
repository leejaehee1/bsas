package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.TodaysHeadline;
import com.jsoftware.platform.service.TodaysHeadlineService;

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
public class TodaysHeadlineController {

    private TodaysHeadlineService Service;

    @GetMapping("/api/todaysHeadline")
    public List<TodaysHeadline> getTodaysHeadlines() {
        System.out.println("******GET1 register");
        return Service.readTodaysHeadlines();
    }

    @GetMapping("/api/todaysHeadline/{id}")
    public TodaysHeadline getTodaysHeadline(@PathVariable("id") int id) {
        System.out.println(id);
        return Service.readTodaysHeadline(id);
    }

    @PostMapping("/api/todaysHeadline")
    public TodaysHeadline createTodaysHeadline(@RequestBody TodaysHeadline todaysHeadline) {
        return Service.createTodaysHeadline(todaysHeadline);
    }

    @PutMapping("/api/todaysHeadline/{id}")
    public TodaysHeadline updateTodaysHeadline(@RequestBody TodaysHeadline todaysHeadline) {
        return Service.updateTodaysHeadline(todaysHeadline);
    }

    @DeleteMapping("/api/todaysHeadline/{id}")
    public void DeleteTodaysHeadline(@PathVariable("id") int id) {
        Service.deleteTodaysHeadline(id);
    }
}