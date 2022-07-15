package com.example.demo.rest;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.Projeto;
import com.example.demo.services.ProjetoService;

@RestController
@RequestMapping(value = "/api/projetos")
public class ProjetosController {

	
	@Autowired
	private ProjetoService projsrv;
	
	@PostMapping("/criarnovo")
	public Projeto novoProjeto(@RequestBody HashMap<String, String> proj) throws ParseException {
		try {
			return projsrv.criarProjeto(proj);
		} catch (RuntimeException e) {
			throw new RuntimeException("Erro ao criar novo Projeto " + e.getMessage());
		}
		
	}
	
	@PostMapping("/projetoById")
	public Projeto getProjetoById(@RequestBody Integer id) {
		return projsrv.getProjetoById(id);
		
	}
	
	
	@PostMapping("/altera")
	public Projeto alteraProjeto(@RequestBody HashMap<String, String> proj) throws ParseException {
		try {
			return projsrv.alterarProjeto(proj);
		} catch (RuntimeException e) {
			throw new RuntimeException("Erro ao alterar Projeto " + e.getMessage());
		}

	}
	
	@PostMapping("/eliminar")
	public void eliminarProjeto(@RequestBody Integer projetoId2) throws ParseException {
		projsrv.eliminarProjeto(projetoId2);

	}
	
	@GetMapping(path = "/preview/{idProj}")
	public  ResponseEntity<byte[]> downloadPreview(@PathVariable("idProj") Integer idProj, HttpServletResponse response) throws ParseException, IOException {
		return projsrv.constroiFichiero(idProj,response);
	}
	
	@GetMapping(path = "/sourcecode/{idProj}")
	public  ResponseEntity<byte[]> downloadSourceCode(@PathVariable("idProj") Integer idProj, HttpServletResponse response) throws ParseException, IOException {
		return projsrv.constroiFichiero2(idProj,response);
	}
	
	
	
}
