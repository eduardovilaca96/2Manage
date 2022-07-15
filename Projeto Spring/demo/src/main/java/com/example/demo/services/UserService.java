package com.example.demo.services;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Sessao;
import com.example.demo.entities.UserEntity;
import com.example.demo.repos.SessaoRepository;
import com.example.demo.repos.UserRepository;
@Service
public class UserService {

	@Autowired
	private  UserRepository repos;
	
	@Autowired
	private  SessaoRepository reposSess;
	
	public void register(HashMap<String,String> params) {
		
//		List<UserEntity> users = repos.findAll();
		
		UserEntity user = new UserEntity();
		user.setUserId(null);
		repos.save(null);
	
		
	}
	
	public UserEntity desativa(Integer id) {
		UserEntity current = repos.findById(id).get();
		current.setEnabled(current.getEnabled() == 1? 0 : 1);
		return repos.save(current);
	}
	
	public UserEntity mudaPassword(HashMap<String,String> params) {
		UserEntity current = repos.findById(Integer.parseInt(params.get("userId"))).get();
		current.setPassword(new BCryptPasswordEncoder().encode(params.get("password")));
		return repos.save(current);
	}
	
	public List<UserEntity> getAllUsers(){
		return repos.findAll();
	}
	
	public List<Sessao> getAllSessoes(){
		return reposSess.findAll();
	}

}
