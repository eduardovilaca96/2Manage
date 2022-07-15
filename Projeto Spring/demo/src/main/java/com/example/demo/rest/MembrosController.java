package com.example.demo.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.services.MembroService;
import com.google.gson.Gson;

/**
 * @author edv
 *
 * @since 31/05/2022
 */
@RestController
@RequestMapping(value = "/api/membros", method = RequestMethod.POST)
public class MembrosController {
	
	@Autowired
	MembroService memService;
	
	@PostMapping("/tabelaDash")
	public String returnMembro(@RequestBody String membro) throws Exception {
		return new Gson().toJson(memService.getAllMembros());
	}
	

}
