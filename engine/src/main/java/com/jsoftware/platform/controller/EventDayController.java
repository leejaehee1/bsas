package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.EventDay;
import com.jsoftware.platform.service.EventDayService;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class EventDayController {

    private EventDayService Service;

    @GetMapping("/api/eventDay")
    public List<EventDay> getEventDays() {
        System.out.println("****** EventDay list");
        return Service.readEventDays();
    }

    @GetMapping("/api/eventDay/{id}")
    public EventDay getEventDay(@PathVariable("id") int id) {
        System.out.println("****** getById EventDay" + id);
        return Service.readEventDay(id);
    }

    @PostMapping("/api/eventDay")
    public EventDay createEventDay(@RequestBody EventDay eventDay) {
        System.out.println("****** Create EventDay");
        return Service.createEventDay(eventDay);
    }

    @PutMapping("/api/eventDay/{id}")
    public EventDay updateEventDay(@PathVariable("id") int id, @RequestBody EventDay eventDay) {
        eventDay.setId(id);
        System.out.println("****** Modify EventDay");
        return Service.updateEventDay(eventDay);
    }

    @DeleteMapping("/api/eventDay/{id}")
    public String DeleteEventDay(@PathVariable("id") int id) {
        System.out.println("delete EventDay" + id);
        Service.deleteEventDay(id);
        System.out.println(id + "delete EventDay complete ****** ");
        return "delete id" + id;
    }
}