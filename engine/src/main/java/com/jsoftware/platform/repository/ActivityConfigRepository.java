package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Center;
import com.jsoftware.platform.model.Hospital;
import com.jsoftware.platform.model.User;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ActivityConfigRepository {

    // 지인 등록
    User selectUserById(int id);

    List<User> selectAllUsers();

    void insertUser(User user);

    void updateUser(User user);

    void deleteUser(User user);

    // 병원 등록
    Hospital selectHospitalById(int id);

    List<Hospital> selectAllHospitals();

    void insertHospital(Hospital hospital);

    void updateHospital(Hospital hospital);

    void deleteHospital(Hospital hospital);

    // 센터 등록
    Center selectCenterById(int id);

    List<Center> selectAllCenters();

    void insertCenter(Center center);

    void updateCenter(Center center);

    void deleteCenter(Center center);
}