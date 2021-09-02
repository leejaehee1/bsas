package com.jsoftware.platform.controller;

import com.jsoftware.platform.vo.DataItem;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;

@RestController
public class HomeController {

    @Resource(name = "secondaryDataSource")
    private DataSource dataSource;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public class CustomRowMapper implements RowMapper<DataItem> {

        @Override
        public DataItem mapRow(ResultSet rs, int rowNum) throws SQLException {
            System.out.println(rs.toString());
            return null;
        }
    }

    @GetMapping("/home")
    public String findUid(HttpSession session) {
        return session.getId();
    }

    @GetMapping("/test/data")
    public String testDataSource(HttpSession session) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        String sql = "select * from table2 limit 10";
        for (DataItem dataItem : jdbcTemplate.query(sql, new CustomRowMapper())) {
            System.out.println(dataItem.toJson());
        }

        return "";
    }
}
