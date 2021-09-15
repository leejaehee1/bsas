package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.RecommendHotspot;
import com.jsoftware.platform.service.RecommendHotspotService;

import org.springframework.web.bind.annotation.GetMapping;
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
}