package com.example.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Membro;
import com.example.demo.entities.Sessao;
import com.example.demo.repos.MembrosRepository;
import com.example.demo.repos.SessaoRepository;

@Service
public class MembroService {

	@Autowired
	private MembrosRepository membrosRepo;
	
	@Autowired
	private SessaoRepository sessaoRepo;
	
	public Membro getMembroByUserId(Integer userId) {
		return membrosRepo.findByUserUserId(userId);
	}
	
	public List<Membro> getAllMembros(){
		return membrosRepo.findAll();
	}
	
	public List<Sessao> getAllSessoes(){
		return sessaoRepo.findAll();
	}
	
	public List<String> getAllUsernames(){
		List<Sessao> list = this.getAllSessoes();
		List<String> listsend = new ArrayList<String>();
		for(Sessao sess : list) {
			listsend.add(sess.getUtil());
		}
		return listsend;
	}
}
