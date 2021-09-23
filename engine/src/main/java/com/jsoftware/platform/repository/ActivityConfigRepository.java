package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Center;
import com.jsoftware.platform.model.Hospital;
import com.jsoftware.platform.model.User;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ActivityConfigRepository {

    // 지인 등록
    User selectUserById(Long id);

    List<User> selectAllUsers();

    public void insertUser(User user);

    public void updateUser(Long id, User user);

    public void deleteUser(Long id);

    // 병원 등록
    Hospital selectHospitalById(Long id);

    List<Hospital> selectAllHospitals();

    public void insertHospital(Hospital hospital);

    public void updateHospital(Long id, Hospital hospital);

    public void deleteHospital(Long id);

    // 센터 등록
    Center selectCenterById(Long id);

    List<Center> selectAllCenters();

    public void insertCenter(Center center);

    public void updateCenter(Long id, Center center);

    public void deleteCenter(Long id);
}