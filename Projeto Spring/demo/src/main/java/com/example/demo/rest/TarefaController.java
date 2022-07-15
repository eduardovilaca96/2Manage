package com.example.demo.rest;


import java.text.ParseException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.Membro;
import com.example.demo.entities.Tarefa;
import com.example.demo.repos.MembrosRepository;
import com.example.demo.services.TarefaService;

/**
 * @author edv
 *
 * @since 31/05/2022
 */
@RestController
@RequestMapping(value = "/api/tarefas")
public class TarefaController {

	@Autowired
	private TarefaService taskService;

	@Autowired
	private MembrosRepository memRepos;
		
	
	@PostMapping("/ola")
	public Membro returnMembro(@RequestBody Integer idUser) throws Exception {
		return memRepos.findByUserUserId(idUser);
	}
	
	
	@PostMapping("/tarefasUser")
	public Integer[] returnTarefas(@RequestBody Integer idUser) throws Exception{
		return taskService.getTarefasGrafico(idUser);
		
	}
	
	@PostMapping("/criarova")
	public Tarefa novaTarefa(@RequestBody HashMap<String, String> task) throws ParseException {
		try {
			return taskService.createTarefa(task);
		} catch (RuntimeException e) {
			throw new RuntimeException("Erro ao criar nova Tarefa " + e.getMessage());
		}

	}
	
	@PostMapping("/altera")
	public Tarefa alteraTarefa(@RequestBody HashMap<String, String> task) throws ParseException {
		try {
			return taskService.alteraTarefa(task);
		} catch (RuntimeException e) {
			throw new RuntimeException("Erro ao alterar Tarefa " + e.getMessage());
		}

	}
	
	@PostMapping("/concluir")
	public Tarefa concluirTarefa(@RequestBody HashMap<String, String> task) throws ParseException {
		try {
			return taskService.concluirTarefa(task);
		} catch (RuntimeException e) {
			throw new RuntimeException("Erro ao alterar Tarefa " + e.getMessage());
		}

	}
	
	@PostMapping("/aFazer")
	public Tarefa aFazerTarefa(@RequestBody HashMap<String, String> task) throws ParseException {
		try {
			return taskService.aFazerTarefa(task);
		} catch (RuntimeException e) {
			throw new RuntimeException("Erro ao alterar Tarefa " + e.getMessage());
		}

	}
	
	@PostMapping("/eliminar")
	public void concluirTarefa(@RequestBody Integer idTask) throws ParseException {
		taskService.deleteTarefa(idTask);
	}
	
	@PostMapping("/tarefaById")
	public Tarefa getTarefaById(@RequestBody Integer id) {
		return taskService.getTarefaById(id);
		
	}
	
	@PostMapping("/criarovaAmdin")
	public String novaTarefaAdmin(@RequestBody HashMap<String, String> task) throws ParseException {
		try {
			return taskService.createTarefaAdmin(task);
		} catch (RuntimeException e) {
			throw new RuntimeException("Erro ao criar nova Tarefa " + e.getMessage());
		}

	}

}
