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

    public void insertUser(User user);

    public void updateUser(User user);

//    public void deleteUser(int id);

    public void deleteUser(User user);


    // 병원 등록
    Hospital selectHospitalById(int id);

    List<Hospital> selectAllHospitals();

    public void insertHospital(Hospital hospital);

    public void updateHospital(Hospital hospital);

    public void deleteHospital(int id);

    // 센터 등록
    Center selectCenterById(int id);

    List<Center> selectAllCenters();

    public void insertCenter(Center center);

    public void updateCenter(Center center);

    public void deleteCenter(int id);
}