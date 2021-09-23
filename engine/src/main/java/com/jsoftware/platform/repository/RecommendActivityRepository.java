package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.RecommendActivity;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RecommendActivityRepository {
    List<RecommendActivity> readRecommendActivities();

    RecommendActivity readRecommendActivity(Long id);

    void createRecommendActivity(RecommendActivity recommendActivity);
}