package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.EventDay;
import com.jsoftware.platform.model.RecommendActivity;
import com.jsoftware.platform.service.RecommendActivityService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class RecommendActivityController {

    private RecommendActivityService activityService;

    @GetMapping("/api/recommendActivity")
    public List<RecommendActivity> getRecommendActivity() {
        System.out.println("******GET1 register");
        return activityService.readRecommendActivities();
    }

    @GetMapping("/api/recommendActivity/{id}")
    public RecommendActivity getRecommendActivity(@PathVariable("id") int id) {
        System.out.println(id);
        return activityService.readRecommendActivity(id);
    }

    @PostMapping("/api/recommendActivity")
    public RecommendActivity createRecommendActivity(@RequestBody RecommendActivity recommendActivity) {
        return activityService.createRecommendActivity(recommendActivity);
    }
}