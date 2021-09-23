package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.EventDay;
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

    @Override
    public List<MonthlyPick> readMonthlyPicks() {
        return sqlSessionTemplate.selectList("selectAllMonthlyPick");
    }

    @Override
    public MonthlyPick readMonthlyPick(Long id) {
        return sqlSessionTemplate.selectOne("selectMonthlyPickById", id);
    }

    @Override
    public void createMonthlyPick(MonthlyPick monthlyPick) {
        sqlSessionTemplate.insert("insertMonthlyPick", monthlyPick);
    }
}