package com.example.demo.rest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.config.CreateUserHandler;
import com.example.demo.entities.Membro;
import com.example.demo.entities.UserEntity;
import com.example.demo.repos.MembrosRepository;
import com.example.demo.repos.UserRepository;

/**
 * @author edv
 *
 * @since 20/05/2022
 */
@RestController
@RequestMapping(value = "/api/registo")
public class RegistoHandler {

	@Autowired
	protected DataSource dataSource;

	@Autowired
	protected UserRepository userRepo;
	
	@Autowired
	protected MembrosRepository memRepo;

	@Bean
	public CreateUserHandler jdbcUserDetailsManager() {
		CreateUserHandler handler = new CreateUserHandler();
		handler.setDataSource(dataSource);
		return handler;
	}
	

	@PostMapping("/regista")
	public String registar(@RequestBody HashMap<String, String> params, HttpServletRequest req) {
		
		try {
			
			List<Membro> listaMem = memRepo.findAll();
			
			for(Membro mem : listaMem) {
				if(params.get("email").toString().equals(mem.getEmail())) {
					throw new DuplicateKeyException("");
				}
			}
			
			List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
			authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		
			UserDetails user = new User(params.get("user").toString(), new BCryptPasswordEncoder().encode(params.get("password").toString()), authorities);
			jdbcUserDetailsManager().createUser(user);
			
			UserEntity newUser = userRepo.findByUserName(user.getUsername());
			
			Membro newMembro = new Membro();
			newMembro.setNome(params.get("nome").toString());
			newMembro.setApelido(params.get("apelido").toString());
			newMembro.setContacto(params.get("tel").toString());
			newMembro.setEmail(params.get("email").toString());
			newMembro.setUser(newUser);
			
			memRepo.save(newMembro);
			
			System.out.println("Novo Utilizador!!");
			System.out.println(user.getUsername() +" " + user.getAuthorities());
			
			UsernamePasswordAuthenticationToken authReq
			 = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword(),user.getAuthorities());
			
	        Authentication authentication = authReq;
	        SecurityContextHolder.getContext().setAuthentication(authentication);
			
			return "Utilizador Registado!";

		}catch (Exception e) {
			return "Utilizador já existente";
		}

	}

}
