package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Center;
import com.jsoftware.platform.model.Hospital;
import com.jsoftware.platform.model.User;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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


    // 지인
    @Override
    public User selectUserById(int id) {
        return sqlSessionTemplate.selectOne("selectUserById", id);
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

//    @Override
//    public void deleteUser(int id) {
//        sqlSessionTemplate.delete("deleteUser", id);
//    }

    @Override
    public void deleteUser(User user) {
        sqlSessionTemplate.delete("deleteUser", user);
    }


    // 병원
    @Override
    public Hospital selectHospitalById(int id) {
        return sqlSessionTemplate.selectOne("selectHospitalById", id);
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
    public void deleteHospital(int id) {
        sqlSessionTemplate.delete("deleteHospital", id);
    }



    // 센터
    @Override
    public Center selectCenterById(int id) {
        return sqlSessionTemplate.selectOne("selectCenterById", id);
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
    public void deleteCenter(int id) {
        sqlSessionTemplate.delete("deleteCenter", id);
    }
}