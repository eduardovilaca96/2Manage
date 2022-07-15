package com.example.demo.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Membro;

@Repository("memb")
public interface MembrosRepository extends JpaRepository<Membro, Integer>{
	Membro findByNome(String nome);
	Membro findByUserUserId(Integer userId);
}
