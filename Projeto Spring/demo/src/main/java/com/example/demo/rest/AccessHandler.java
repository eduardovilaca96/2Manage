package com.example.demo.rest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/")
public class AccessHandler {

	public String redirectIndex() {
		return "redirect:/inicio/login.jsp";
	}
}
