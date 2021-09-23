package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.EventDay;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EventDayRepositoryImpl implements EventDayRepository{

    final SqlSessionFactory sqlSessionFactory;

    final SqlSessionTemplate sqlSessionTemplate;


    public EventDayRepositoryImpl(SqlSessionFactory sqlSessionFactory, SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionFactory = sqlSessionFactory;
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    @Override
    public List<EventDay> readEventDays() {
        return sqlSessionTemplate.selectList("selectAllEventDay");
    }

    @Override
    public EventDay readEventDay(Long id) {
        return sqlSessionTemplate.selectOne("selectEventDayById", id);
    }

    @Override
    public void createEventDay(EventDay eventDay) {
        sqlSessionTemplate.insert("insertEventDay", eventDay);
    }
}