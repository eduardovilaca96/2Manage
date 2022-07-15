package com.example.demo.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
 
@Configuration
@EnableWebSecurity
public class WebConfig extends WebSecurityConfigurerAdapter {
 
    @Autowired
    private DataSource dataSource;
    
    
    @Autowired
    CustomSuccessHandler successHandler;
     
    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().passwordEncoder(new BCryptPasswordEncoder())
            .dataSource(dataSource)
            .usersByUsernameQuery("select username, password, enabled from users where username=?")
            .authoritiesByUsernameQuery("select username, role from users where username=?")
        ;
    }
    
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable().authorizeRequests()
        	//paginas acessiveis ao admin 
        	.antMatchers("/admin/*").hasAnyRole("ADMIN")
        	//paginas acessiveis ao user
        	.antMatchers("/user/*").hasAnyRole("USER")
        	//trancar login/registo
//        	.antMatchers(HttpMethod.GET,"/inicio/*").denyAll()
        	//permite acesso a todos 
        	.antMatchers("/scripts/*").permitAll()
        	.antMatchers("/css/*").permitAll()
        	.antMatchers("/favicon.ico").permitAll()
        	.antMatchers("/imagens/*").permitAll()
        	.antMatchers("/erros/*").permitAll()
        	.antMatchers(HttpMethod.GET,"/inicio/registo.jsp").anonymous()
        	.antMatchers(HttpMethod.GET,"/inicio/login.jsp").anonymous()
        	.antMatchers(HttpMethod.GET,"/api/registo/*").permitAll()
        	.antMatchers("/api/registo/*").permitAll()
        	.antMatchers("/inicio/*").permitAll()
        	.and()
        	.formLogin()
        	.loginPage("/inicio/login.jsp").successHandler(successHandler).and()
            .logout().invalidateHttpSession(true);
    }
}