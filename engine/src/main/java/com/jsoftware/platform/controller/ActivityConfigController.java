package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.Center;
import com.jsoftware.platform.model.Hospital;
import com.jsoftware.platform.model.User;
import com.jsoftware.platform.service.ActivityConfigService;
import com.jsoftware.platform.service.BoardService;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

@RestController
public class ActivityConfigController {

    final BoardService service;

    final ActivityConfigService activityConfigService;

    public ActivityConfigController(BoardService service, ActivityConfigService activityConfigService) {
        this.service = service;
        this.activityConfigService = activityConfigService;
    }

    // user, hospital, center read
    @GetMapping("/api/users")
    public List<User> getUsers() {
        return activityConfigService.readUsers();
    }
    @GetMapping("/api/hospitals")
    public List<Hospital> getHospitals() {
        return activityConfigService.readHospitals();
    }

    @GetMapping("/api/centers")
    public List<Center> getCenters() {
        return activityConfigService.readCenters();
    }

    // user, hospital, center post
    @PostMapping("/api/users")
    public User createUser(@RequestBody User user) {
        return activityConfigService.createUser(user);
    }

    @PostMapping("/api/hospitals")
    public Hospital createHospital(@RequestBody Hospital hospital) {
        return activityConfigService.createHospital(hospital);
    }

    @PostMapping("/api/centers")
    public Center createCenter(@RequestBody Center center) {
        return activityConfigService.createCenter(center);
    }

    // user, hospital, center put
    @PutMapping("/api/users/{id}")
    public User putUser(@PathVariable("id") Long id, @RequestBody User user) {
        return activityConfigService.updateUser(user);
    }

    @PutMapping("/api/hospitals/{id}")
    public Hospital putHospital(@PathVariable("id") Long id, @RequestBody Hospital hospital) {
        return activityConfigService.updateHospital(hospital);
    }

    @PutMapping("/api/centers/{id}")
    public Center putCenter(@PathVariable("id") Long id, @RequestBody Center center) {
        return activityConfigService.updateCenter(center);
    }

    // user, hospital, center delete
    @DeleteMapping("/api/users/{id}")
    public void deleteUser(@PathVariable long id, @RequestBody User user) {
        activityConfigService.deleteUser(user);
    }

    @DeleteMapping("/api/hospitals/{id}")
    public void deleteHospital(@PathVariable long id, @RequestBody Hospital hospital) {
        activityConfigService.deleteHospital(hospital);
    }

    @DeleteMapping("/api/centers/{id}")
    public void deleteCenter(@PathVariable long id, @RequestBody Center center) {
        activityConfigService.deleteCenter(center);
    }

    // ----------------test
    // 9월 6일 현재 /api/test/user list와 post, delete는 가능하나, readUser 불가능 상황
//    @GetMapping("/api/users")
//    public List<User> readUsers() {
//        return activityConfigService.readUsers();
//    }
//
//    @GetMapping("/api/users/{id}")
//    public User readUser(@PathVariable long id, @RequestBody User user) {
//        return activityConfigService.readUser(user);
//    }
//
//    @PostMapping("/api/users")
//    public User createUser(@RequestBdy User user) {
//        return activityConfigService.createUser(user);
//    }
//
//    @PutMapping("/api/users/{id}")
//    public void updateUser(@PathVariable long id, @RequestBody User user) {
//        activityConfigService.updateUser(user);
//    }
//
//    @DeleteMapping("/api/users/{id}")
//    public void deleteUser(@PathVariable long id, @RequestBody User user) {
//        activityConfigService.deleteUser(user);
//    }
// -------------------------------------------------------------------------------------------o
}