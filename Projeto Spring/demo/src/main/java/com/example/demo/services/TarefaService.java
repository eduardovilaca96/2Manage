package com.example.demo.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Membro;
import com.example.demo.entities.Tarefa;
import com.example.demo.repos.MembrosRepository;
import com.example.demo.repos.ProjetosRepository;
import com.example.demo.repos.TarefasRepository;

@Service
public class TarefaService {

	@Autowired
	public MembrosRepository membrosRepo;

	@Autowired
	public TarefasRepository tarefasRepo;
	
	@Autowired
	public ProjetosRepository projetoRepo;

	public Tarefa createTarefa(HashMap<String , String> task) throws ParseException {
		
		Tarefa tasksave = new Tarefa();
		tasksave.setDesignacao(task.get("designacao"));
		tasksave.setDataCriacao(System.currentTimeMillis());
		tasksave.setDataFim((new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(task.get("dataFim").replace('T', ' '))).getTime());
		tasksave.setProjeto(task.get("iDprojeto").isEmpty() ? null : projetoRepo.findById(Integer.parseInt(task.get("iDprojeto"))).get());
		tasksave.setMembro(membrosRepo.findById(Integer.parseInt(task.get("idMembro"))).get());
		tasksave.setStatus(1);
		tasksave.setTipo(Integer.parseInt(task.get("tipo")));
		tasksave.setDescricao(task.get("descricao"));
		tasksave.setProgresso(Integer.parseInt(task.get("progresso")));
		
		return tarefasRepo.save(tasksave);
	}
	
	public String createTarefaAdmin(HashMap<String , String> task) throws ParseException {
		
		if(task.get("idMembro").equals("todos")) {
			for(Membro mem : membrosRepo.findAll()) {
				Tarefa tasksave = new Tarefa();
				tasksave.setDesignacao(task.get("designacao"));
				tasksave.setDataCriacao(System.currentTimeMillis());
				tasksave.setDataFim((new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(task.get("dataFim").replace('T', ' '))).getTime());
				tasksave.setProjeto(task.get("iDprojeto").isEmpty() ? null : projetoRepo.findById(Integer.parseInt(task.get("iDprojeto"))).get());
				tasksave.setStatus(1);
				tasksave.setTipo(Integer.parseInt(task.get("tipo")));
				tasksave.setDescricao(task.get("descricao") + "(criado por Administrador)");
				tasksave.setProgresso(Integer.parseInt(task.get("progresso")));
				tasksave.setMembro(mem);
				tarefasRepo.save(tasksave);
			}
		}else {
			Tarefa tasksave = new Tarefa();
			tasksave.setDesignacao(task.get("designacao"));
			tasksave.setDataCriacao(System.currentTimeMillis());
			tasksave.setDataFim((new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(task.get("dataFim").replace('T', ' '))).getTime());
			tasksave.setProjeto(task.get("iDprojeto").isEmpty() ? null : projetoRepo.findById(Integer.parseInt(task.get("iDprojeto"))).get());
			tasksave.setStatus(1);
			tasksave.setTipo(Integer.parseInt(task.get("tipo")));
			tasksave.setDescricao(task.get("descricao") + "(criado por Administrador)");
			tasksave.setProgresso(Integer.parseInt(task.get("progresso")));
			tasksave.setMembro(membrosRepo.findById(Integer.parseInt(task.get("idMembro"))).get());
			tarefasRepo.save(tasksave);
		}

		
		return "Tarefas Criadas";
	}
	
	
	public Tarefa alteraTarefa(HashMap<String, String> task) throws ParseException {
		Tarefa tasksave = tarefasRepo.findById(Integer.parseInt(task.get("tarefaId2"))).get();
		tasksave.setDesignacao(task.get("designacao2"));
		tasksave.setProjeto(task.get("iDprojeto2").isEmpty() ? null : projetoRepo.findById(Integer.parseInt(task.get("iDprojeto2"))).get());
		tasksave.setDataFim((new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(task.get("dataFim2").replace('T', ' '))).getTime());
		tasksave.setTipo(Integer.parseInt(task.get("tipo2")));
		tasksave.setProgresso(Integer.parseInt(task.get("progresso2")));
		tasksave.setDescricao(task.get("descricao2"));
		
		return tarefasRepo.save(tasksave);
	}
	
	public Tarefa concluirTarefa(HashMap<String, String> data) throws ParseException {
		Tarefa tasksave = tarefasRepo.findById(Integer.parseInt(data.get("tarefaId2"))).get();
		tasksave.setDataConclusao(new Date(System.currentTimeMillis()).getTime());
		tasksave.setStatus(3);
		tasksave.setProgresso(100);
		return tarefasRepo.save(tasksave);
	}
	
	public Tarefa aFazerTarefa(HashMap<String, String> data) throws ParseException {
		Tarefa tasksave = tarefasRepo.findById(Integer.parseInt(data.get("tarefaId2"))).get();
		tasksave.setDataConclusao((long) 0);
		tasksave.setStatus(1);
		tasksave.setProgresso(0);
		return tarefasRepo.save(tasksave);
	}
	
	public Tarefa getTarefaById(Integer id) {
		return tarefasRepo.findById(id).get();
	}
	
	public Integer[] getTarefasGrafico(Integer user) {
		Membro mem = membrosRepo.findByUserUserId(user);
		Integer[] tarefasStatus = new Integer[3];
		
		List<Tarefa> toDos = tarefasRepo.findByStatusAndMembroIdMembroOrderByDataFim(1, mem.getIdMembro());
		List<Tarefa> missed = new ArrayList<Tarefa>();
		List<Tarefa> done = tarefasRepo.findByStatusAndMembroIdMembroOrderByDataFim(3, mem.getIdMembro());
		
		for(int i = 0; i < toDos.size() ; i++) {
			if(new Date(toDos.get(i).getDataFim()).before(new Date())) {
				missed.add(toDos.get(i));
				toDos.remove(toDos.get(i));
				i--;
			}
		}
		
		tarefasStatus[0] = toDos.size();
		tarefasStatus[1] = missed.size();
		tarefasStatus[2] = done.size();
		
		return tarefasStatus;
		
	}
	
	public List<Tarefa> getToDos(Integer user){
		
		Membro mem = membrosRepo.findByUserUserId(user);
		List<Tarefa> toDos = tarefasRepo.findByStatusAndMembroIdMembroOrderByDataFim(1, mem.getIdMembro());
		for(int i = 0; i < toDos.size() ; i++) {
			if(new Date(toDos.get(i).getDataFim()).before(new Date())) {
				toDos.remove(toDos.get(i));
				i--;
			}
		}
		return toDos;
	}
	
	public List<Tarefa> getMissed(Integer user){
		
		Membro mem = membrosRepo.findByUserUserId(user);
		List<Tarefa> toDos = tarefasRepo.findByStatusAndMembroIdMembroOrderByDataFim(1, mem.getIdMembro());
		List<Tarefa> missed = new ArrayList<Tarefa>();
		
		for(Tarefa tarefa : toDos) {
			if(new Date(tarefa.getDataFim()).before(new Date())) {
				missed.add(tarefa);
			}
		}
		
		
		return missed;
	}
	
	public List<Tarefa> getDone(Integer user){
		
		Membro mem = membrosRepo.findByUserUserId(user);
		List<Tarefa> done = tarefasRepo.findByStatusAndMembroIdMembroOrderByDataFim(3, mem.getIdMembro());	
		return done;
	}
	
	public List<Tarefa> getTarefasByProjeto(Integer idProjeto){
		List<Tarefa> listaTask = tarefasRepo.findByProjetoIdProjeto(idProjeto);
		return listaTask;

	}
	
	public List<Tarefa> getAllTarefas(){
		List<Tarefa> listaTask = tarefasRepo.findAll();
		return listaTask;
	}
	
	public List<Tarefa> getAllTarefasByUser(Integer user){
		Membro mem = membrosRepo.findByUserUserId(user);
		List<Tarefa> listaTask = tarefasRepo.findByMembroIdMembro(mem.getIdMembro());
		return listaTask;
	}
	
	public void deleteTarefa(Integer idTask) {
		tarefasRepo.delete(tarefasRepo.findById(idTask).get());	
	}

}
