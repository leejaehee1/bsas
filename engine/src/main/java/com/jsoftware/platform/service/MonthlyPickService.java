package com.jsoftware.platform.service;

import com.jsoftware.platform.model.MonthlyPick;
import com.jsoftware.platform.repository.MonthlyPickRepositoryImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MonthlyPickService {

    final MonthlyPickRepositoryImpl repository;

    public MonthlyPickService(MonthlyPickRepositoryImpl repository) {
        this.repository = repository;
    }

    @Transactional
    public List<MonthlyPick> readMonthlyPicks() {
        return repository.readMonthlyPicks();
    }

}
