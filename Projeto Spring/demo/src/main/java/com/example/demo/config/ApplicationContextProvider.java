package com.example.demo.config;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
//permite aceder aos services pelo jsp
@Component("applicationContextProvider")
public class ApplicationContextProvider implements ApplicationContextAware{
	private static ApplicationContext ctx = null;
	
	public static ApplicationContext getApplicationContext() {
		return ctx;
	}
	
	@Override
	public void setApplicationContext(ApplicationContext _ctx) throws BeansException {
		ctx = _ctx;
		
	}

}
