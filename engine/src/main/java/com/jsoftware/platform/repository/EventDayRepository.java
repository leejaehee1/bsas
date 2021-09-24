package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.EventDay;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EventDayRepository {
    List<EventDay> readEventDays();

    EventDay readEventDay(int id);

    void createEventDay(EventDay eventDay);

    void updateEventDay(EventDay eventDay);

    void deleteEventDay(int id);
}