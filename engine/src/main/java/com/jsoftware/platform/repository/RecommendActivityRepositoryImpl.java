package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.MonthlyPick;
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

    @Override
    public List<RecommendActivity> readRecommendActivities() {
        return sqlSessionTemplate.selectList("selectAllRecommendActivity");
    }

    @Override
    public RecommendActivity readRecommendActivity(int id) {
        return sqlSessionTemplate.selectOne("selectRecommendActivityById", id);
    }

    @Override
    public void createRecommendActivity(RecommendActivity recommendActivity) {
        sqlSessionTemplate.insert("insertRecommendActivity", recommendActivity);
    }

    @Override
    public void updateRecommendActivity(RecommendActivity recommendActivity) {
        sqlSessionTemplate.update("updateRecommendActivity", recommendActivity);
    }

    @Override
    public void deleteRecommendActivity(int id) {
        sqlSessionTemplate.delete("deleteRecommendActivity", id);
    }
}