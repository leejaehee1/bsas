package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.TodaysHeadline;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TodaysHeadlineRepository {
    List<TodaysHeadline> readTodaysHeadlines();
}