package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.RecommendActivity;
import com.jsoftware.platform.model.RecommendHotspot;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RecommendHotspotRepositoryImpl implements RecommendHotspotRepository{

    final SqlSessionFactory sqlSessionFactory;

    final SqlSessionTemplate sqlSessionTemplate;


    public RecommendHotspotRepositoryImpl(SqlSessionFactory sqlSessionFactory, SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionFactory = sqlSessionFactory;
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<RecommendHotspot> readRecommendHotspots() {
        return sqlSessionTemplate.selectList("selectAllRecommendHotspot");
    }
}