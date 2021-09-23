package com.jsoftware.platform.service;

import com.jsoftware.platform.model.RecommendHotspot;
import com.jsoftware.platform.repository.RecommendHotspotRepositoryImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RecommendHotspotService {

    final RecommendHotspotRepositoryImpl repository;

    public RecommendHotspotService(RecommendHotspotRepositoryImpl repository) {
        this.repository = repository;
    }

    @Transactional
    public List<RecommendHotspot> readRecommendHotspots() {
        return repository.readRecommendHotspots();
    }

    @Transactional
    public RecommendHotspot readRecommendHotspot(int id) {
        return repository.readRecommendHotspot(id);
    }

    @Transactional
    public RecommendHotspot createRecommendHotspot(RecommendHotspot recommendHotspot) {
        repository.createRecommendHotspot(recommendHotspot);
        return recommendHotspot;
    }

}
