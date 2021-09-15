package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.TodaysHeadline;
import com.jsoftware.platform.service.TodaysHeadlineService;

import org.springframework.web.bind.annotation.GetMapping;
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
}