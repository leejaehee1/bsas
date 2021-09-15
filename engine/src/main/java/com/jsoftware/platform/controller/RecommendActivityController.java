package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.RecommendActivity;
import com.jsoftware.platform.service.RecommendActivityService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class RecommendActivityController {

    private RecommendActivityService activityService;

    // test
    @GetMapping("/api/recommendActivity")
    public List<RecommendActivity> getRecommendActivity() {
        System.out.println("******GET1 register");
        return activityService.readRecommendActivities();
    }
}