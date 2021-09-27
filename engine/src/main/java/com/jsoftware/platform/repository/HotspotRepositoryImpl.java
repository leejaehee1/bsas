package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Hotspot;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class HotspotRepositoryImpl implements HotspotRepository {

    final SqlSessionFactory sqlSessionFactory;

    final SqlSessionTemplate sqlSessionTemplate;


    public HotspotRepositoryImpl(SqlSessionFactory sqlSessionFactory, SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionFactory = sqlSessionFactory;
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<Hotspot> readHotspots() {
        return sqlSessionTemplate.selectList("selectAllHotspots");
    }

    @Override
    public Hotspot readHotspot(int id) {
        return sqlSessionTemplate.selectOne("selectHotspotById", id);
    }

    @Override
    public void createHotspot(Hotspot hotspot) {
        sqlSessionTemplate.insert("insertHotspot", hotspot);
    }

    @Override
    public void updateHotspot(Hotspot hotspot) {
        sqlSessionTemplate.update("updateHotspot", hotspot);
    }

    @Override
    public void deleteHotspot(int id) {
        sqlSessionTemplate.delete("deleteHotspot", id);
    }
}