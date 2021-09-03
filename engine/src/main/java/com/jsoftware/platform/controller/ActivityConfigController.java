package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.Board;
import com.jsoftware.platform.model.Center;
import com.jsoftware.platform.model.Hospital;
import com.jsoftware.platform.model.User;
import com.jsoftware.platform.service.ActivityConfigService;
import com.jsoftware.platform.service.BoardService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

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
    public User addUser(@RequestBody User user) {
        return activityConfigService.createUser(user);
    }
//
//    @PostMapping("/api/hospitals")
//    public Hospital addHospital(@RequestBody Hospital hospital) {
//        return activityConfigService.createHospital(hospital);
//    }
//
//    @PostMapping("/api/centers")
//    public Center addCenter(@RequestBody Center center) {
//        return activityConfigService.createCenter(center);
//    }

    // user, hospital, center put
//    @PutMapping("/api/users/{id}")
//    public User putUser(@PathVariable("id") Long id, @RequestBody User user) {
//        return activityConfigService.updateUser(user);
//    }
//
//    @PutMapping("/api/hospitals/{id}")
//    public Hospital putHospital(@PathVariable("id") Long id, @RequestBody Hospital hospital) {
//        return activityConfigService.updateHospital(hospital);
//    }
//
//    @PutMapping("/api/centers/{id}")
//    public Center putCenter(@PathVariable("id") Long id, @RequestBody Center center) {
//        return activityConfigService.updateCenter(center);
//    }

    // user, hospital, center delete
//    @PutMapping("/api/users/{id}")
//    public User deleteUser(@PathVariable("id") Long id) {
//        return activityConfigService.deleteUser();
//    }
//
//    @PutMapping("/api/hospitals/{id}")
//    public Hospital deleteHospital(@PathVariable("id") Long id) {
//        return activityConfigService.deleteHospital();
//    }
//
//    @PutMapping("/api/centers/{id}")
//    public Center deleteCenter(@PathVariable("id") Long id) {
//        return activityConfigService.deleteCenter();
//    }
}