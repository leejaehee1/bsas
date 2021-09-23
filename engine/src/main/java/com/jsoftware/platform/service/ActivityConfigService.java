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

    // 지인
    // all users
    @Transactional
    public List<User> readUsers() {
        return repository.selectAllUsers();
    }

    // one user
    @Transactional
    public User readUser(int id) {
        return repository.selectUserById(id);
    }

    @Transactional
    public User createUser(User user) {
        repository.insertUser(user);
        return user;
    }

    @Transactional
    public User updateUser(int id, User user) {
        repository.updateUser(id, user);
        return user;
    }

    @Transactional
    public void deleteUser(int id) {
        repository.deleteUser(id);
    }

    // 병원
    @Transactional
    public Hospital readHospital(int id) {
        return repository.selectHospitalById(id);
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
    public Hospital updateHospital(int id, Hospital hospital) {
        repository.updateHospital(id, hospital);
        return hospital;
    }

    @Transactional
    public void deleteHospital(int id) {
        repository.deleteHospital(id);
    }

    // 센터
    @Transactional
    public Center readCenter(int id) {
        return repository.selectCenterById(id);
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
    public Center updateCenter(int id, Center center) {
        repository.updateCenter(id, center);
        return center;
    }

    @Transactional
    public void deleteCenter(int id) {
        repository.deleteCenter(id);
    }
}
