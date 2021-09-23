package com.jsoftware.platform.service;

import com.jsoftware.platform.model.TodaysHeadline;
import com.jsoftware.platform.repository.TodaysHeadlineRepositoryImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TodaysHeadlineService {

    final TodaysHeadlineRepositoryImpl repository;

    public TodaysHeadlineService(TodaysHeadlineRepositoryImpl repository) {
        this.repository = repository;
    }

    @Transactional
    public List<TodaysHeadline> readTodaysHeadlines() {
        return repository.readTodaysHeadlines();
    }

    @Transactional
    public TodaysHeadline readTodaysHeadline(Long id) {
        return repository.readTodaysHeadline(id);
    }

    @Transactional
    public TodaysHeadline createTodaysHeadline(TodaysHeadline todaysHeadline) {
        repository.createTodaysHeadline(todaysHeadline);
        return todaysHeadline;
    }

}
