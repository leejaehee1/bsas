package com.jsoftware.platform.service;

import com.jsoftware.platform.model.EventDay;
import com.jsoftware.platform.repository.EventDayRepositoryImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EventDayService {

    final EventDayRepositoryImpl repository;

    public EventDayService(EventDayRepositoryImpl repository) {
        this.repository = repository;
    }

    @Transactional
    public List<EventDay> readEventDays() {
        return repository.readEventDays();
    }

    @Transactional
    public EventDay readEventDay(int id) {
        return repository.readEventDay(id);
    }

    @Transactional
    public EventDay createEventDay(EventDay eventDay) {
        repository.createEventDay(eventDay);
        return eventDay;
    }

    @Transactional
    public EventDay updateEventDay(EventDay eventDay) {
        repository.updateEventDay(eventDay);
        return eventDay;
    }

    @Transactional
    public String deleteEventDay(int id) {
        repository.deleteEventDay(id);
        return "id" +id;
    }
}
