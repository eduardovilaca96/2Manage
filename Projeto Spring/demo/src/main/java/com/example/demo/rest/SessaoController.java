package com.example.demo.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.repos.SessaoRepository;

@RestController
@RequestMapping(value = "/api/sessao")
public class SessaoController {
	
	@Autowired
	SessaoRepository sesRepository;
	
	@GetMapping("/limpar")
	public void returnMembro() throws Exception {
		sesRepository.deleteAllInBatch();
	}
	

}

