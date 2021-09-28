package com.jsoftware.platform.service;

import com.jsoftware.platform.model.RecommendActivity;
import com.jsoftware.platform.repository.RecommendActivityRepositoryImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RecommendActivityService {

    final RecommendActivityRepositoryImpl repository;

    public RecommendActivityService(RecommendActivityRepositoryImpl repository) {
        this.repository = repository;
    }

    @Transactional
    public List<RecommendActivity> readRecommendActivities() {
        return repository.readRecommendActivities();
    }

    @Transactional
    public RecommendActivity readRecommendActivity(int id) {
        return repository.readRecommendActivity(id);
    }

    @Transactional
    public RecommendActivity createRecommendActivity(RecommendActivity recommendActivity) {
        repository.createRecommendActivity(recommendActivity);
        return recommendActivity;
    }

    @Transactional
    public RecommendActivity updateRecommendActivity(RecommendActivity recommendActivity) {
        repository.updateRecommendActivity(recommendActivity);
        return recommendActivity;
    }

    @Transactional
    public String deleteRecommendActivity(int id) {
        repository.deleteRecommendActivity(id);
        return "id" +id;
    }

}
