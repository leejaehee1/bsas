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
import org.springframework.web.bind.annotation.ResponseBody;
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
        System.out.printf("aaaa");
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


//    @GetMapping("/api/users/{id}")
//    public User readUser(@PathVariable("id") String id) {
//        System.out.println(id);
//        int variable = Integer.parseInt(id);
//        System.out.println(variable);
//        User userTest = activityConfigService.readUser(variable);
//        System.out.println(userTest);
//        return userTest;
//    }

    // user, hospital, center read one
    @GetMapping("/api/users/{id}")
    public User readUser(@PathVariable("id") int id) {
        System.out.println(id);
        return activityConfigService.readUser(id);
    }

    @GetMapping("/api/hospitals/{id}")
    public Hospital readHospital(@PathVariable("id") int id) {
        System.out.println(id);
        return activityConfigService.readHospital(id);
    }

    @GetMapping("/api/centers/{id}")
    public Center readCenter(@PathVariable("id") int id) {
        System.out.println(id);
        return activityConfigService.readCenter(id);
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
    public User putUser(@PathVariable("id") int id, @RequestBody User user) {
        return activityConfigService.updateUser(user);
    }

    @PutMapping("/api/hospitals/{id}")
    public Hospital putHospital(@PathVariable("id") int id, @RequestBody Hospital hospital) {
        return activityConfigService.updateHospital(hospital);
    }

    @PutMapping("/api/centers/{id}")
    public Center putCenter(@PathVariable("id") int id, @RequestBody Center center) {
        return activityConfigService.updateCenter(center);
    }

    // user, hospital, center delete
    @DeleteMapping("/api/users/{id}")
    public void deleteUser(@PathVariable int id, @RequestBody User user) {
        activityConfigService.deleteUser(user);
    }

    @DeleteMapping("/api/hospitals/{id}")
    public void deleteHospital(@PathVariable int id, @RequestBody Hospital hospital) {
        activityConfigService.deleteHospital(hospital);
    }

    @DeleteMapping("/api/centers/{id}")
    public void deleteCenter(@PathVariable int id, @RequestBody Center center) {
        activityConfigService.deleteCenter(center);
    }

    // ----------------test
//    @DeleteMapping("/api/users/{id}")
//    public void deleteUser(@PathVariable long id, @RequestBody User user) {
//        activityConfigService.deleteUser(user);
//    }
// -------------------------------------------------------------------------------------------o
}