package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.Center;
import com.jsoftware.platform.model.Hospital;
import com.jsoftware.platform.model.User;
import com.jsoftware.platform.repository.ActivityConfigRepository;
import com.jsoftware.platform.service.ActivityConfigService;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import static org.springframework.http.ResponseEntity.ok;

import java.util.List;

@RestController
public class ActivityConfigController {

    final ActivityConfigService activityConfigService;
    final ActivityConfigRepository activityConfigRepository;

    public ActivityConfigController(ActivityConfigService activityConfigService, ActivityConfigRepository activityConfigRepository) {

        this.activityConfigService = activityConfigService;
        this.activityConfigRepository = activityConfigRepository;
    }

    // user, hospital, center read all

    // 리스트로 all 불러와서 리스트로 리턴함
    // 연관된 Service, A~C~Mapper, Repository, RepositoryImpl 확인할 것

    @GetMapping("/api/users")
    public List<User> getUsers() {
        System.out.printf("User list ------");
        return activityConfigService.readUsers();
    }

    @GetMapping("/api/hospitals")
    public List<Hospital> getHospitals() {
        System.out.printf("Hospital list ------");
        return activityConfigService.readHospitals();
    }

    @GetMapping("/api/centers")
    public List<Center> getCenters() {
        System.out.printf("Center list ------");
        return activityConfigService.readCenters();
    }


    // user, hospital, center read one

    // id 값으로 하나씩 불러오기
    // @PathVariable는 해당 url 뒤로 /슬러시 및 ""안 값을 넘기는데,
    // @RequestParam은 해당 url 뒤로 /가 아니라 ? 뒤로 값을 넣는다.
    // Restfull api에서 id 값으로 호출할 때에는,
    // id 값을 호출하여 url에 맞춰서 binding하는 @PathVariable 쓰는 게 맞다.

    @GetMapping("/api/users/{id}")
    public User readUser(@PathVariable("id") int id) {
        System.out.println("User" + id);
        return activityConfigService.readUser(id);
    }

    @GetMapping("/api/hospitals/{id}")
    public Hospital readHospital(@PathVariable("id") int id) {
        System.out.println("Hospital" + id);
        return activityConfigService.readHospital(id);
    }

    @GetMapping("/api/centers/{id}")
    public Center readCenter(@PathVariable("id") int id) {
        System.out.println("Center" + id);
        return activityConfigService.readCenter(id);
    }

    // user, hospital, center post

    // @RequestBody: front->back으로 요청한 Json 데이터를 바로 매핑하기 위한 것
    // @ResponseBody: back->front로 Json 값을 응답할 수 있게 해줌

    @PostMapping("/api/users")
    public User createUser(@RequestBody User user) {
        System.out.println("Create User");
        return activityConfigService.createUser(user);
    }

    @PostMapping("/api/hospitals")
    public Hospital createHospital(@RequestBody Hospital hospital) {
        System.out.println("Create Hospital");
        return activityConfigService.createHospital(hospital);
    }

    @PostMapping("/api/centers")
    public Center createCenter(@RequestBody Center center) {
        System.out.println("Create Center");
        return activityConfigService.createCenter(center);
    }

    // user, hospital, center put

    @PutMapping("/api/users/{id}")
    public User putUser(/*@PathVariable("id") int id, */@RequestBody User user) {
//        user.setId(id);
        //TODO 프론트엔드에서 user 객체에 id를 세팅해서 받아야 함.
        System.out.println("Modify User");
        return activityConfigService.updateUser(user);
    }

    // CRUD
    // C create insert post
    // R read   select get
    // U update update put
    // D delete delete delete

    @PutMapping("/api/hospitals/{id}")
    public Hospital putHospital(/*@PathVariable("id") int id, */@RequestBody Hospital hospital) {
//        hospital.setId(id);
        System.out.println("Modify Hospital");
        return activityConfigService.updateHospital(hospital);
    }

    @PutMapping("/api/centers/{id}")
    public Center putCenter(/*@PathVariable("id") int id, */@RequestBody Center center) {
//        center.setId(id);
        System.out.println("Modify Center");
        return activityConfigService.updateCenter(center);
    }

    // user, hospital, center delete
    // delete 작동 확인

    @DeleteMapping("/api/users/{id}")
    public String deleteUser(@PathVariable("id") int id) {
        System.out.println("delete User" + id);
        activityConfigService.deleteUser(id);
        System.out.println(id + "delete User complete");
        return "delete id" + id;
        // TODO return 코드 정의 필요 : 리턴이 문제 없다 하면 0, 또는 delete id로 리턴해서 화면에 찍어줄 수 있도록(알람)
    }


    @DeleteMapping("/api/hospitals/{id}")
    public String deleteHospital(@PathVariable int id) {
        System.out.println("delete Hospital" + id);
        activityConfigService.deleteHospital(id);
        System.out.println(id + "delete Hospital complete");
        return "delete id" + id;
    }

    @DeleteMapping("/api/centers/{id}")
    public String deleteCenter(@PathVariable int id) {
        System.out.println("delete Hospital" + id);
        activityConfigService.deleteCenter(id);
        System.out.println(id + "delete Hospital complete");
        return "delete id" + id;
    }
}