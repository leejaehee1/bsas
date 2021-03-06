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

    private HotspotService Service;

    @GetMapping("/api/hotspots")
    public List<Hotspot> getHotspots() {
        System.out.println("******Hotspot list");
        return Service.readHotspots();
    }

    @GetMapping("/api/hotspots/{id}")
    public Hotspot getHotspot(@PathVariable("id") int id) {
        System.out.println("******Hotspot: " + id);
        return Service.readHotspot(id);
    }

    @PostMapping("/api/hotspots")
    public Hotspot createHotspot(@RequestBody Hotspot hotspot) {
        System.out.println("******Create Hotspot");
        return Service.createHotspot(hotspot);
    }

    @PutMapping("/api/hotspots/{id}")
    public Hotspot updateHotspot(@PathVariable("id") int id, @RequestBody Hotspot hotspot) {
        hotspot.setId(id);
        System.out.println("******Update Hotspot");
        return Service.updateHotspot(hotspot);
    }

    @DeleteMapping("/api/hotspots/{id}")
    public String DeleteHotspot(@PathVariable("id") int id) {
        System.out.println("******Delete Hotspot");
        Service.deleteHotspot(id);
        System.out.println("******Delete Hotspot complete");
        return "delete id" + id;
    }
}