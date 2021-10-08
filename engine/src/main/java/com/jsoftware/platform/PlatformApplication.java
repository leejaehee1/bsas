package com.jsoftware.platform;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

@MapperScan(basePackageClasses = PlatformApplication.class)
@SpringBootApplication
@EnableRedisHttpSession
@EnableCaching
public class PlatformApplication {

	public static void main(String[] args) {
		System.setProperty("spring.devtools.restart.enabled", "false");
		System.setProperty("spring.devtools.livereload.enabled", "true");

		SpringApplication.run(PlatformApplication.class, args);
	}

}
