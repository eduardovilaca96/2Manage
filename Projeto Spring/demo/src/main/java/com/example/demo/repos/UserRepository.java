package com.example.demo.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.UserEntity;

@Repository("usr")
public interface UserRepository extends JpaRepository<UserEntity, Integer > {
	UserEntity findByUserName(String username);
}