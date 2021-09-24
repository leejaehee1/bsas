package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.RecommendHotspot;
import com.jsoftware.platform.model.TodaysHeadline;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TodaysHeadlineRepository {
    List<TodaysHeadline> readTodaysHeadlines();

    TodaysHeadline readTodaysHeadline(int id);

    void createTodaysHeadline(TodaysHeadline todaysHeadline);

    void updateTodaysHeadline(TodaysHeadline todaysHeadline);

    void deleteTodaysHeadline(int id);
}