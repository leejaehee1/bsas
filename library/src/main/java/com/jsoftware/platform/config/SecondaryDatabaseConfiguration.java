package com.jsoftware.platform.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

@Slf4j
@Configuration
@PropertySource("classpath:/application.yml")
public class SecondaryDatabaseConfiguration {

    @Bean(name = "secondaryHikariConfig")
    @ConfigurationProperties(prefix = "spring.secondary.datasource")
    public HikariConfig hikariConfig() {
        return new HikariConfig();
    }

    @Bean(name = "secondaryDataSource")
    public DataSource dataSource() {
        return new HikariDataSource(hikariConfig());
    }

    @Bean(name = "secondarySqlSessionFactory")
    public SqlSessionFactory primarySqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
        sqlSessionFactory.setDataSource(dataSource());
        sqlSessionFactory.setMapperLocations(
                new PathMatchingResourcePatternResolver().getResources("classpath:/sqlmap/*.xml"));
        return sqlSessionFactory.getObject();
    }

    @Bean(name = "secondarySqlSessionTemplate")
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

    @Bean(name = "secondaryTransactionManager")
    public DataSourceTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dataSource());
    }

}