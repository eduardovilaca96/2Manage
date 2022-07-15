package com.example.demo.rest;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.UserEntity;
import com.example.demo.services.UserService;

@RestController
@RequestMapping(value = "/api/users")
public class UserController {

	@Autowired
	private UserService userService;
	
	@PostMapping("/desativar")
	public UserEntity desativaMembro(@RequestBody HashMap<String, String> proj) {
		return userService.desativa(Integer.parseInt(proj.get("userId")));
	}
	
	@PostMapping("/chng")
	public UserEntity mudaPassword(@RequestBody HashMap<String, String> proj) {
		return userService.mudaPassword(proj);
	}
}
