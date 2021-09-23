package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Center;
import com.jsoftware.platform.model.Hospital;
import com.jsoftware.platform.model.User;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ActivityConfigRepository {

    // 지인 등록
    User selectUserById(String id);

    List<User> selectAllUsers();

    public void insertUser(User user);

    public void updateUser(String id, User user);

    public void deleteUser(String id);

    // 병원 등록
    Hospital selectHospitalById(String id);

    List<Hospital> selectAllHospitals();

    public void insertHospital(Hospital hospital);

    public void updateHospital(String id, Hospital hospital);

    public void deleteHospital(String id);

    // 센터 등록
    Center selectCenterById(String id);

    List<Center> selectAllCenters();

    public void insertCenter(Center center);

    public void updateCenter(String id, Center center);

    public void deleteCenter(String id);
}