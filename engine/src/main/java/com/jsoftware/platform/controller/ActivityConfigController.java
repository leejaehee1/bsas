package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.Center;
import com.jsoftware.platform.model.Hospital;
import com.jsoftware.platform.model.User;
import com.jsoftware.platform.service.ActivityConfigService;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ActivityConfigController {

    final ActivityConfigService activityConfigService;

    public ActivityConfigController(ActivityConfigService activityConfigService) {

        this.activityConfigService = activityConfigService;
    }

    // user, hospital, center read all

    // 리스트로 all 불러와서 리스트로 리턴함
    // 연관된 Service, A~C~Mapper, Repository, RepositoryImpl 확인할 것

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

    // id 값으로 하나씩 불러오기
    // @PathVariable는 해당 url 뒤로 /슬러시 및 ""안 값을 넘기는데,
    // @RequestParam은 해당 url 뒤로 /가 아니라 ? 뒤로 값을 넣는다.
    // Restfull api에서 값을 호출할 때에는,
    // 값을 호출하여 url에 맞춰서 binding하는 @PathVariable 쓰는 게 맞다.

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

    // @RequestBody: front->back으로 요청한 Json 데이터를 바로 매핑하기 위한 것
    // @ResponseBody: back->front로 Json 값을 응답할 수 있게 해줌

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
    public User deleteUser(@PathVariable int id, User user) {
        return activityConfigService.deleteUser(user);
    }

    @DeleteMapping("/api/hospitals/{id}")
    public Hospital deleteHospital(@PathVariable int id, Hospital hospital) {
        return activityConfigService.deleteHospital(hospital);
    }

    @DeleteMapping("/api/centers/{id}")
    public Center deleteCenter(@PathVariable int id, Center center) {
        return activityConfigService.deleteCenter(center);
    }

    // ----------------test
//    @DeleteMapping("/api/users/{id}")
//    public void deleteUser(@PathVariable long id, @RequestBody User user) {
//        activityConfigService.deleteUser(user);
//    }
// -------------------------------------------------------------------------------------------o
}