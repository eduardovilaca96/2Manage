package com.example.demo.services;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Membro;
import com.example.demo.entities.UserEntity;
import com.example.demo.repos.MembrosRepository;
import com.example.demo.repos.UserRepository;

@Service
public class TMUser extends SecurityContextHolder{
	
	@Autowired 
	UserRepository userRepo;
	
	@Autowired 
	MembrosRepository membroRepo;

		
	public UserEntity getUser(HttpServletRequest req) throws Exception{
		return userRepo.findByUserName(req.getUserPrincipal().getName());
	}
	
	public Membro getMember(HttpServletRequest req) throws Exception{
		return membroRepo.findByNome(req.getUserPrincipal().getName());
	}

}
