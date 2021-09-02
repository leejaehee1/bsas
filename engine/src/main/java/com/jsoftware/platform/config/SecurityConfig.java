package com.jsoftware.platform.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/* Spring Security를 이용해 로그인/로그아웃/인증/인가 등을 처리하기 위한 설정 파일이다.
 * @EnableWebSecurity가 붙어 있을 경우 Spring Security를 구성하는
 * 기본적인 Bean들을 자동으로 구성해준다. WebSecurityConfigurerAdapter를 상속받으면,
 * 특정 메소드를 오버라이딩 함으로써 좀 더 손쉽게 설정할 수 있다.
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    /* configure(WebSecurity web) 메소드를 오버라이딩 하는 이유는
     * 인증/인가가 필요 없는 경로를 설정할 필요가 있기 때문이다.
     */
    /* Maven이전에 널리 사용된 프로젝트를 빌드할 때 사용하는 ant라는 도구가 있다.
     * 이 ant에서 사용하는 표기법 중에 "/경로/**" 와 같은 형식이 있는데
     * "**"는 특정 경로 이하의 모든 것을 의미한다. 따라서 지정한 경로를 무시하라는 의미이다.
     */
    //   /webjars/** 경로에 대한 요청은 인증/인가 처리하지 않도록 무시한다.
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers(
                "/**");
    }

    /* configure(HttpSecurity http) 메소드를 오버라이딩 한다는 것은
     * 인증/인가에 대한 설정을 한다는 의미이다. 가장 중요한 메소드로 볼 수 있다.
     */
    /* http.csrf().disable()는 csrf() 기능을 끄라는 설정이다.
     * csrf는 보안 설정 중 post방식으로 값을 전송할 때 token을 사용해야하는 보안 설정이다.
     * csrf은 기본으로 설정되어 있는데 사용시 보안성은 높아지지만
     * 개발초기에는 불편함이 있다는 단점이 있어서 기능을 끈 것이다.
     */
    /* disable()메소드는  HttpSecurity를 리턴한다.
     * 즉 다음과 같은 뜻이다.
     * http.authorizeRequests()
                .antMatchers("/", "/main").permitAll()
                .anyRequest().authenticated();
     */
    /*  "/"와 "/main" 경로는 누구나 접근(permitAll)할 수 있도록 한 것이며
		그외의 경로는 인증을 한 후에만 접근할 수 있다는 것을 의미한다.
     */
    //   /, /main에 대한 요청은 누구나 할 수 있지만, 그 외의 요청은 모두 인증 후 접근 가능하다.
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/", "/main").permitAll()
                .anyRequest().authenticated();
    }

    // 패스워드 인코더를 Bean으로 등록한다. 암호를 인코딩하거나,
    // 인코딩된 암호와 사용자가 입력한 암호가 같은 지 확인할 때 사용한다.
    @Bean
    public PasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }
}
