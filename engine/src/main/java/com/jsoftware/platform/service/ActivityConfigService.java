package com.jsoftware.platform.service;

import com.jsoftware.platform.model.Center;
import com.jsoftware.platform.model.Hospital;
import com.jsoftware.platform.model.User;
import com.jsoftware.platform.repository.ActivityConfigRepositoryImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ActivityConfigService {

    final ActivityConfigRepositoryImpl repository;

    public ActivityConfigService(ActivityConfigRepositoryImpl repository) {
        this.repository = repository;
    }

    // 지인 등록
    @Transactional
    public User readUser(User user) {
        return repository.selectUserById(user);
    }

    @Transactional
    public List<User> readUsers() {
        return repository.selectAllUsers();
    }

    @Transactional
    public User createUser(User user) {
        repository.insertUser(user);
        return user;
    }

    @Transactional
    public User updateUser(User user) {
        repository.updateUser(user);
        return user;
    }

    @Transactional
    public void deleteUser(User user) {
        repository.deleteUser(user);
    }

    // 병원 등록
    @Transactional
    public Hospital readHospital(Hospital hospital) {
        return repository.selectHospitalById(hospital);
    }

    @Transactional
    public List<Hospital> readHospitals() {
        return repository.selectAllHospitals();
    }

    @Transactional
    public Hospital createHospital(Hospital hospital) {
        repository.insertHospital(hospital);
        return hospital;
    }

    @Transactional
    public Hospital updateHospital(Hospital hospital) {
        repository.updateHospital(hospital);
        return hospital;
    }

    @Transactional
    public void deleteHospital(Hospital hospital) {
        repository.deleteHospital(hospital);
    }

    // 센터 등록
    @Transactional
    public Center readCenter(Center center) {
        return repository.selectCenterById(center);
    }

    @Transactional
    public List<Center> readCenters() {
        return repository.selectAllCenters();
    }

    @Transactional
    public Center createCenter(Center center) {
        repository.insertCenter(center);
        return center;
    }

    @Transactional
    public Center updateCenter(Center center) {
        repository.updateCenter(center);
        return center;
    }

    @Transactional
    public void deleteCenter(Center center) {
        repository.deleteCenter(center);
    }
}
