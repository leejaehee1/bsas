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

    @GetMapping("/api/hotspots")
    public List<Hotspot> getHotspots() {
        System.out.println("******Hotspot list");
        return activityService.readHotspots();
    }

    @GetMapping("/api/hotspots/{id}")
    public Hotspot getHotspot(@PathVariable("id") int id) {
        System.out.println("******Hotspot: " + id);
        return activityService.readHotspot(id);
    }

    @PostMapping("/api/hotspots")
    public Hotspot createHotspot(@RequestBody Hotspot hotspot) {
        System.out.println("******Create Hotspot");
        return activityService.createHotspot(hotspot);
    }

    @PutMapping("/api/hotspots/{id}")
    public Hotspot updateHotspot(@RequestBody Hotspot hotspot) {
        System.out.println("******Update Hotspot");
        return activityService.updateHotspot(hotspot);
    }

    @DeleteMapping("/api/hotspots/{id}")
    public String DeleteHotspot(@PathVariable("id") int id) {
        System.out.println("******Delete Hotspot");
        activityService.deleteHotspot(id);
        System.out.println("******Delete Hotspot complete");
        return "delete id" + id;
    }
}