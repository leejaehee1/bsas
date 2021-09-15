package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Board;
import com.jsoftware.platform.model.RecommendActivity;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RecommendActivityRepositoryImpl implements RecommendActivityRepository{

    final SqlSessionFactory sqlSessionFactory;

    final SqlSessionTemplate sqlSessionTemplate;


    public RecommendActivityRepositoryImpl(SqlSessionFactory sqlSessionFactory, SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionFactory = sqlSessionFactory;
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<RecommendActivity> readRecommendActivities() {
        return sqlSessionTemplate.selectList("selectAllRecommendActivity");
    }
}