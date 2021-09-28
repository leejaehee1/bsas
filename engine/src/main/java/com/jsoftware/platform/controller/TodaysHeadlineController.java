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
        System.out.println("****** TodaysHeadline list");
        return Service.readTodaysHeadlines();
    }

    @GetMapping("/api/todaysHeadline/{id}")
    public TodaysHeadline getTodaysHeadline(@PathVariable("id") int id) {
        System.out.println("****** TodaysHeadline: " + id);
        return Service.readTodaysHeadline(id);
    }

    @PostMapping("/api/todaysHeadline")
    public TodaysHeadline createTodaysHeadline(@RequestBody TodaysHeadline todaysHeadline) {
        System.out.println("******Create TodaysHeadline");
        return Service.createTodaysHeadline(todaysHeadline);
    }

    @PutMapping("/api/todaysHeadline/{id}")
    public TodaysHeadline updateTodaysHeadline(@PathVariable("id") int id, @RequestBody TodaysHeadline todaysHeadline) {
        todaysHeadline.setId(id);
        System.out.println("******Update TodaysHeadline");
        return Service.updateTodaysHeadline(todaysHeadline);
    }

    @DeleteMapping("/api/todaysHeadline/{id}")
    public String DeleteTodaysHeadline(@PathVariable("id") int id) {
        System.out.println("******Delete TodaysHeadline" + id);
        Service.deleteTodaysHeadline(id);
        System.out.println("******Delete TodaysHeadline complete");
        return "delete id" + id;
    }
}