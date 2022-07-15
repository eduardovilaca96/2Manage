package com.example.demo.repos;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Tarefa;

@Qualifier("TASK")
@Repository
public interface TarefasRepository extends JpaRepository<Tarefa, Integer>{
	List<Tarefa>  findByMembroIdMembro(Integer idMembro);
	List<Tarefa>  findByStatusAndMembroIdMembroOrderByDataFim(Integer status,Integer idMembro);
	List<Tarefa>  findByProjetoIdProjeto(Integer idProjeto);
}
