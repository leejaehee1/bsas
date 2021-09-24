package com.jsoftware.platform.service;

import com.jsoftware.platform.model.EventDay;
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

    @Transactional
    public MonthlyPick readMonthlyPick(int id) {
        return repository.readMonthlyPick(id);
    }

    @Transactional
    public MonthlyPick createMonthlyPick(MonthlyPick monthlyPick) {
        repository.createMonthlyPick(monthlyPick);
        return monthlyPick;
    }

    @Transactional
    public MonthlyPick updateMonthlyPick(MonthlyPick monthlyPick) {
        repository.updateMonthlyPick(monthlyPick);
        return monthlyPick;
    }

    @Transactional
    public void deleteMonthlyPick(int id) {
        repository.deleteMonthlyPick(id);
    }

}
