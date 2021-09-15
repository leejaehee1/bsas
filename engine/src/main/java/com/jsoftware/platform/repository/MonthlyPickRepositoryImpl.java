package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.MonthlyPick;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MonthlyPickRepositoryImpl implements MonthlyPickRepository{

    final SqlSessionFactory sqlSessionFactory;

    final SqlSessionTemplate sqlSessionTemplate;


    public MonthlyPickRepositoryImpl(SqlSessionFactory sqlSessionFactory, SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionFactory = sqlSessionFactory;
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<MonthlyPick> readMonthlyPicks() {
        return sqlSessionTemplate.selectList("selectAllMonthlyPick");
    }
}