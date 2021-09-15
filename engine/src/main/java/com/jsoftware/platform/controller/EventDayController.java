package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.EventDay;
import com.jsoftware.platform.service.EventDayService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class EventDayController {

    private EventDayService Service;

    @GetMapping("/api/eventDay")
    public List<EventDay> getEventDays() {
        System.out.println("******GET1 register");
        return Service.readEventDays();
    }
}