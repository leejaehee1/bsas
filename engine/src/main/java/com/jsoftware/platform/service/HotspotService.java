package com.jsoftware.platform.service;

import com.jsoftware.platform.model.Hotspot;
import com.jsoftware.platform.repository.HotspotRepositoryImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class HotspotService {

    final HotspotRepositoryImpl repository;

    public HotspotService(HotspotRepositoryImpl repository) {
        this.repository = repository;
    }

    @Transactional
    public List<Hotspot> readHotspots() {
        return repository.readHotspots();
    }

    @Transactional
    public Hotspot readHotspot(int id) {
        return repository.readHotspot(id);
    }

    @Transactional
    public Hotspot createHotspot(Hotspot hotspot) {
        repository.createHotspot(hotspot);
        return hotspot;
    }

    @Transactional
    public Hotspot updateHotspot(Hotspot hotspot) {
        repository.updateHotspot(hotspot);
        return hotspot;
    }

    @Transactional
    public void deleteHotspot(int id) {
        repository.deleteHotspot(id);
    }

}
