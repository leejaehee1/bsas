package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.RecommendActivity;
import com.jsoftware.platform.model.RecommendHotspot;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RecommendHotspotRepository {
    List<RecommendHotspot> readRecommendHotspots();

    RecommendHotspot readRecommendHotspot(int id);

    void createRecommendHotspot(RecommendHotspot recommendHotspot);

    void updateRecommendHotspot(RecommendHotspot recommendHotspot);

    void deleteRecommendHotspot(int id);
}