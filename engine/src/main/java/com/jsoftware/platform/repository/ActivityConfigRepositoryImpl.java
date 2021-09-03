package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Board;
import com.jsoftware.platform.model.Center;
import com.jsoftware.platform.model.Hospital;
import com.jsoftware.platform.model.User;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ActivityConfigRepositoryImpl implements ActivityConfigRepository{

    final SqlSessionFactory sqlSessionFactory;

    final SqlSessionTemplate sqlSessionTemplate;

    // DB 조회 횟수
    private static int dbCount = 0;

    public ActivityConfigRepositoryImpl(SqlSessionFactory sqlSessionFactory, SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionFactory = sqlSessionFactory;
        this.sqlSessionTemplate = sqlSessionTemplate;
    }


    // 지인 등록
    @Override
    public User selectUserById(User user) {
        return sqlSessionTemplate.selectOne("selectUserById", user);
    }

    @Override
    public List<User> selectAllUsers() {
        return sqlSessionTemplate.selectList("selectAllUsers");
    }

    @Override
    public void insertUser(User user) {
        sqlSessionTemplate.insert("insertUser", user);
    }

    @Override
    public void updateUser(User user) {
        sqlSessionTemplate.update("updateUser", user);
    }

    @Override
    public void deleteUser(User user) {
        sqlSessionTemplate.delete("deleteUser", user);
    }


    // 병원 등록
    @Override
    public Hospital selectHospitalById(Hospital hospital) {
        return sqlSessionTemplate.selectOne("selectHospitalById", hospital);
    }

    @Override
    public List<Hospital> selectAllHospitals() {
        return sqlSessionTemplate.selectList("selectAllHospitals");
    }

    @Override
    public void insertHospital(Hospital hospital) {
        sqlSessionTemplate.insert("insertHospital", hospital);
    }

    @Override
    public void updateHospital(Hospital hospital) {
        sqlSessionTemplate.update("updateHospital", hospital);
    }

    @Override
    public void deleteHospital(Hospital hospital) {
        sqlSessionTemplate.delete("deleteHospital", hospital);
    }



    // 센터 등록
    @Override
    public Center selectCenterById(Center center) {
        return sqlSessionTemplate.selectOne("selectCenterById", center);
    }

    @Override
    public List<Center> selectAllCenters() {
        return sqlSessionTemplate.selectList("selectAllCenters");
    }

    @Override
    public void insertCenter(Center center) {
        sqlSessionTemplate.insert("insertCenter", center);
    }

    @Override
    public void updateCenter(Center center) {
        sqlSessionTemplate.update("updateCenter", center);
    }

    @Override
    public void deleteCenter(Center center) {
        sqlSessionTemplate.delete("deleteCenter", center);
    }
}