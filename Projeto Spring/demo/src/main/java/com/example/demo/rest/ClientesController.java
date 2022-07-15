package com.example.demo.rest;

import java.text.ParseException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.Cliente;
import com.example.demo.services.ClienteService;

@RestController
@RequestMapping(value = "/api/clientes", method = RequestMethod.POST)
public class ClientesController {

	
	@Autowired
	private ClienteService clisrv;
	
	@PostMapping("/criarnovo")
	public Cliente novoCliente(@RequestBody HashMap<String, String> cli) throws ParseException {
		try {
			return clisrv.criarCliente(cli);
		} catch (RuntimeException e) {
			throw new RuntimeException("Erro ao criar novo Cliente " + e.getMessage());
		}
		
	}
	
	@PostMapping("/clienteById")
	public Cliente getClienteById(@RequestBody Integer id) {
		return clisrv.getClienteById(id);
		
	}
	
	
	@PostMapping("/altera")
	public Cliente alteraCliente(@RequestBody HashMap<String, String> cli) throws ParseException {
		try {
			return clisrv.alterarCliente(cli);
		} catch (RuntimeException e) {
			throw new RuntimeException("Erro ao alterar Cliente " + e.getMessage());
		}

	}
	
	@PostMapping("/eliminar")
	public void eliminarCliente(@RequestBody Integer clienteId2) throws ParseException {
		clisrv.eliminarCliente(clienteId2);

	}
}
