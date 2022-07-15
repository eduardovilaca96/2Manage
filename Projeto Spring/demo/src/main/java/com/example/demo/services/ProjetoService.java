package com.example.demo.services;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Projeto;
import com.example.demo.repos.ClientesRepository;
import com.example.demo.repos.ProjetosRepository;

@Service
public class ProjetoService {

	@Autowired
	private ProjetosRepository projetoRepo;
	
	@Autowired
	private ClientesRepository cliRepo;
	
	public List<Projeto> getAllProjetos(){
		return projetoRepo.findAll();
	}
	
	public Projeto getProjetoById(Integer id) {
		return projetoRepo.findById(id).get();
	}
	
	public Projeto criarProjeto(HashMap<String, String> proj) {
		Projeto projeto = new Projeto();
		projeto.setCliente(cliRepo.findById(Integer.parseInt(proj.get("idCliente"))).get());
		projeto.setDataCriacao(new Date(System.currentTimeMillis()));
		projeto.setDesignacao(proj.get("designacao"));
		projeto.setInformacoes(proj.get("informacoes"));
		projeto.setLink(proj.get("link"));
		projeto.setVersao(proj.get("versao"));
		if(!proj.get("previewPath").equals("")) {
			projeto.setPreview(proj.get("previewPath").getBytes());
		}
		if(!proj.get("sourcecodePath").equals("")) {
			projeto.setSourceCode(proj.get("sourcecodePath").getBytes());
		}
		
		return projetoRepo.save(projeto);
	}
	
	public Projeto alterarProjeto(HashMap<String, String> proj) {
		Projeto projeto = projetoRepo.findById(Integer.parseInt(proj.get("projetoId2"))).get();
		projeto.setInformacoes(proj.get("informacoes2"));
		projeto.setLink(proj.get("link2"));
		projeto.setVersao(proj.get("versao2"));
		if(!proj.get("previewPath2").equals("")) {
			projeto.setPreview(proj.get("previewPath2").getBytes());
		}
		if(!proj.get("sourcecodePath2").equals("")) {
			projeto.setSourceCode(proj.get("sourcecodePath2").getBytes());
		}
		
		
		return projetoRepo.save(projeto);
	}
	
	public void eliminarProjeto(Integer proj) {
		projetoRepo.delete(projetoRepo.findById(proj).get());
	}
	
	public  ResponseEntity<byte[]> constroiFichiero(Integer proj, HttpServletResponse response) throws IOException {
		Projeto projeto = projetoRepo.findById(proj).get();
		byte[] conteudo = projeto.getPreview();
		HttpHeaders headers = new HttpHeaders();
	    headers.setCacheControl(CacheControl.noCache().getHeaderValue());
	    headers.setContentType(MediaType.IMAGE_PNG);
	    ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(conteudo, headers, HttpStatus.OK);
	    return responseEntity;
	}
	
	public  ResponseEntity<byte[]> constroiFichiero2(Integer proj, HttpServletResponse response) throws IOException {
		Projeto projeto = projetoRepo.findById(proj).get();
		byte[] conteudo = projeto.getSourceCode();
		HttpHeaders headers = new HttpHeaders();
	    headers.setCacheControl(CacheControl.noCache().getHeaderValue());
	    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	    ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(conteudo, headers, HttpStatus.OK);
	    return responseEntity;
	}
	
}
