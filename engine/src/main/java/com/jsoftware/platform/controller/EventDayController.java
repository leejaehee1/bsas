package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.EventDay;
import com.jsoftware.platform.service.EventDayService;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class EventDayController {

    /*이미지 배너 형식: 1~5개를 좌우 스크롤로 보여줌
            -> 이미지를 전달할 수 있는 방법
            -> static resource 구조 형식
            -> css, js, img 등 resources 이하 권한 없이 접근 할 수 있는 url 작성

            -> MVC
            -> 느낌상 WebConfig에서 설정 해줘야 할 것 같고,
            -> 검색해보니 Devtools로 실시간 반영하는 게 있음. 유용할까?
            -> Controller, WebConfig, application.yml 등만 수정하게 될 것 같음
            */

    // static 이하 폴더에 있는 파일들은 직접 불러오기는 됨
    // http://localhost:18080/mint.PNG
    // http://localhost:18080/mint.html
    // http://localhost:18080/hello.html

    //http://[서버]:18080/static/mint.PNG

    /* 주석
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
        System.out.println("****** delete EventDay" + id);
        Service.deleteEventDay(id);
        System.out.println("delete EventDay complete ****** ");
        return "delete id" + id;
    }*/
}