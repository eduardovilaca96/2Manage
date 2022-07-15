package com.example.demo.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Projeto;

@Repository
public interface ProjetosRepository extends JpaRepository<Projeto, Integer>{

}
