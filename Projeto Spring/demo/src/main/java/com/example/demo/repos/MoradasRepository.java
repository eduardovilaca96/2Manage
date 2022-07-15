package com.example.demo.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Morada;

@Repository
public interface MoradasRepository extends JpaRepository<Morada, Integer>{

}
