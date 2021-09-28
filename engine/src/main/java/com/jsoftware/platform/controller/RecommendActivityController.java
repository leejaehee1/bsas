package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.RecommendActivity;
import com.jsoftware.platform.service.RecommendActivityService;

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
public class RecommendActivityController {

    private RecommendActivityService activityService;

    @GetMapping("/api/recommendActivity")
    public List<RecommendActivity> getRecommendActivity() {
        System.out.println("****** RecommendActivity list");
        return activityService.readRecommendActivities();
    }

    @GetMapping("/api/recommendActivity/{id}")
    public RecommendActivity getRecommendActivity(@PathVariable("id") int id) {
        System.out.println("****** RecommendActivity: " + id);
        return activityService.readRecommendActivity(id);
    }

    @PostMapping("/api/recommendActivity")
    public RecommendActivity createRecommendActivity(@RequestBody RecommendActivity recommendActivity) {
        System.out.println("******Create RecommendActivity");
        return activityService.createRecommendActivity(recommendActivity);
    }

    @PutMapping("/api/recommendActivity/{id}")
    public RecommendActivity updateRecommendActivity(@PathVariable("id") int id, @RequestBody RecommendActivity recommendActivity) {
        recommendActivity.setId(id);
        System.out.println("******Update RecommendActivity");
        return activityService.updateRecommendActivity(recommendActivity);
    }

    @DeleteMapping("/api/recommendActivity/{id}")
    public String DeleteRecommendActivity(@PathVariable("id") int id) {
        System.out.println("******Delete RecommendActivity");
        activityService.deleteRecommendActivity(id);
        System.out.println("******Delete Hotspot RecommendActivity");
        return "delete id" + id;
    }
}