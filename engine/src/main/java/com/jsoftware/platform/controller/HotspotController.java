package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.Hotspot;
import com.jsoftware.platform.service.HotspotService;

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
public class HotspotController {

    private HotspotService activityService;

    @GetMapping("/api/hotspot")
    public List<Hotspot> getHotspots() {
        System.out.println("******GET1 register");
        return activityService.readHotspots();
    }

    @GetMapping("/api/hotspot/{id}")
    public Hotspot getHotspot(@PathVariable("id") int id) {
        System.out.println(id);
        return activityService.readHotspot(id);
    }

    @PostMapping("/api/hotspot")
    public Hotspot createHotspot(@RequestBody Hotspot hotspot) {
        return activityService.createHotspot(hotspot);
    }

    @PutMapping("/api/hotspot/{id}")
    public Hotspot updateHotspot(@RequestBody Hotspot hotspot) {
        return activityService.updateHotspot(hotspot);
    }

    @DeleteMapping("/api/hotspot/{id}")
    public void DeleteHotspot(@PathVariable("id") int id) {
        activityService.deleteHotspot(id);
    }
}