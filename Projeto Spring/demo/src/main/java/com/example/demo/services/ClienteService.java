package com.example.demo.services;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Cliente;
import com.example.demo.repos.ClientesRepository;

@Service
public class ClienteService {

	@Autowired
	private ClientesRepository clientesRepo;
	
	public List<Cliente> getAllClientes(){
		return clientesRepo.findAll();
	}

	public Cliente criarCliente(HashMap<String, String> cli) {
		Cliente cliente = new Cliente();
		cliente.setNome(cli.get("nome"));
		cliente.setApelido(cli.get("apelido"));
		cliente.setEmail(cli.get("email"));
		cliente.setContacto(cli.get("contacto"));
		cliente.setData_contrato(cli.get("contrato"));
		cliente.setDescricao(cli.get("descricao"));
		return clientesRepo.save(cliente);
	}

	public Cliente getClienteById(Integer id) {
		return clientesRepo.findById(id).get();
	}

	public Cliente alterarCliente(HashMap<String, String> cli) {
		Cliente cliente = clientesRepo.findById(Integer.parseInt(cli.get("clienteId2"))).get();
		cliente.setNome(cli.get("nome2"));
		cliente.setApelido(cli.get("apelido2"));
		cliente.setEmail(cli.get("email2"));
		cliente.setContacto(cli.get("contacto2"));
		cliente.setData_contrato(cli.get("contrato2"));
		cliente.setDescricao(cli.get("descricao2"));
		return clientesRepo.save(cliente);
	}

	public void eliminarCliente(Integer clienteId2) {
		clientesRepo.delete(clientesRepo.findById(clienteId2).get());
		
	}
}
