package com.jsoftware.platform.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    // ResourceHadler는 이미지, js, css, html 등 정적 자원들에 대한 요청을 처리할 수 있는 핸들러다.
    // 그래서 리소스를 요청하면 정적 자원들을 응답할 수 있고, 캐싱까지 지원 됨

    /*@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
                registry.addResourceHandler("/resources/**")
                        .addResourceLocations("classpath:static/")
                        .setCachePeriod(0);
    }*/

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("resources/js/**")
                .addResourceLocations("classpath:/static/")
                .setCacheControl(CacheControl.noCache().cachePrivate());
        registry.addResourceHandler("resources/css/**")
                .addResourceLocations("classpath:/static/")
                .setCachePeriod(0); }



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