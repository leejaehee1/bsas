package com.jsoftware.batch.biz.S001;

import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.item.ItemWriter;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.List;

@Slf4j
public class S001Writer  implements ItemWriter {

    @Resource(name = "primaryDataSource")
    private DataSource dataSource;

    @Override
    public void write(List items) throws Exception {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        String sql = "select 1";
        int result = jdbcTemplate.update(sql);

        System.out.println(result);
    }
}
