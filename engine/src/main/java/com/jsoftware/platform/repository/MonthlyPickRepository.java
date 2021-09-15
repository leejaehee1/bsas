package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.MonthlyPick;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MonthlyPickRepository {
    List<MonthlyPick> readMonthlyPicks();
}