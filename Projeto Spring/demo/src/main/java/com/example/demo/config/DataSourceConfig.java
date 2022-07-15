package com.example.demo.config;

import javax.sql.DataSource;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//ligacao á base de dados
@Configuration
public class DataSourceConfig {

	@Bean
	public DataSource getDataSource() {
        @SuppressWarnings("rawtypes")
		DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
        dataSourceBuilder.driverClassName("org.postgresql.Driver");
        dataSourceBuilder.url("jdbc:postgresql://localhost:5432/ToManage");
        dataSourceBuilder.username("postgres");
        dataSourceBuilder.password("T0Manag3pap");
        return dataSourceBuilder.build();
	}
}
