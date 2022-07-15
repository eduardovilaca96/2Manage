package com.example.demo.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Sessao;


@Repository
public interface SessaoRepository extends JpaRepository<Sessao, Integer>{

}
