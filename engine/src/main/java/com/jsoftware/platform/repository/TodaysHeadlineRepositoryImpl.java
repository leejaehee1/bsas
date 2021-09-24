package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.RecommendHotspot;
import com.jsoftware.platform.model.TodaysHeadline;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TodaysHeadlineRepositoryImpl implements TodaysHeadlineRepository{

    final SqlSessionFactory sqlSessionFactory;

    final SqlSessionTemplate sqlSessionTemplate;


    public TodaysHeadlineRepositoryImpl(SqlSessionFactory sqlSessionFactory, SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionFactory = sqlSessionFactory;
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    @Override
    public List<TodaysHeadline> readTodaysHeadlines() {
        return sqlSessionTemplate.selectList("selectAllTodaysHeadline");
    }

    @Override
    public TodaysHeadline readTodaysHeadline(int id) {
        return sqlSessionTemplate.selectOne("selectTodaysHeadlineById", id);
    }

    @Override
    public void createTodaysHeadline(TodaysHeadline todaysHeadline) {
        sqlSessionTemplate.insert("insertTodaysHeadline", todaysHeadline);
    }

    @Override
    public void updateTodaysHeadline(TodaysHeadline todaysHeadline) {
        sqlSessionTemplate.update("updateTodaysHeadline", todaysHeadline);
    }

    @Override
    public void deleteTodaysHeadline(int id) {
        sqlSessionTemplate.delete("deleteTodaysHeadline", id);
    }
}