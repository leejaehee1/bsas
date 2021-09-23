package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.RecommendHotspot;
import com.jsoftware.platform.service.RecommendHotspotService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class RecommendHotspotController {

    private RecommendHotspotService activityService;

    @GetMapping("/api/recommendHotspot")
    public List<RecommendHotspot> getRecommendHotspot() {
        System.out.println("******GET1 register");
        return activityService.readRecommendHotspots();
    }

    @GetMapping("/api/recommendHotspot/{id}")
    public RecommendHotspot getRecommendHotspot(@PathVariable("id") String id) {
        System.out.println(id);
        return activityService.readRecommendHotspot(id);
    }

    @PostMapping("/api/recommendHotspot")
    public RecommendHotspot createRecommendHotspot(@RequestBody RecommendHotspot recommendHotspot) {
        return activityService.createRecommendHotspot(recommendHotspot);
    }
}