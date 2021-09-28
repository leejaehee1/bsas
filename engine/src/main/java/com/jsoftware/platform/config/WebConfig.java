package com.jsoftware.platform.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {


    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**") // CORS(다른 출처의 자원을 공유할 수 있도록 설정하는 권한 체제)를 적용할 url 패턴 정의
                .allowedOrigins("**") // 자원 공유를 허락할 Origin을 지정: 이번에는 권한 없이 접근해야 함
                .maxAge(2000) // 원하는 시간만큼 pre-flight 리퀘스트를 캐싱
                .allowedMethods("GET", "POST");;  // 허용할 HTTP method를 지정
    }

    // 어떤 걸 쓰는게 맞는가?
    // CorsMapping
    // ResourceHadler는 이미지, js, css, html 정적 자원들에 대한 요청을 처리할 수 있는 것
    // 정적 자원들을 응답할 수 있고, 캐싱까지 지원 됨

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
                registry.addResourceHandler("/banners/**")
                        .addResourceLocations("classpath:banners/")
                        .setCachePeriod(0); // 허용할 HTTP method를 지정
    }



    /*@Bean
    public WebMvcConfigurer webMvcConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**")
                        .allowedOrigins("*")
                        .allowedMethods(HttpMethod.POST.name())
                        .allowCredentials(false)
                        .maxAge(3600);
            }
        };
    }
  => webflux 사용시 작성법

    @Bean
    public WebFluxConfigurer webFluxConfigurer() {
        return new WebFluxConfigurerComposite() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/message/**")
                        .allowedOrigins("*")
                        .allowedMethods(HttpMethod.POST.name())
                        .allowCredentials(false)
                        .maxAge(3600);
            }
        };
    }*/
}