package com.example.demo.entities;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name = "spring_session")
public class Sessao {

	@Id
	@Column(name = "session_id")
	private String idSessao;

	@Column(name = "creation_time")
	private String tempoCriacao;

	@Column(name = "last_access_time")
	@JsonProperty("last_access_time")
	private String lastAccess;

	@Column(name = "expiry_time")
	@JsonProperty("expiry_time")
	private String tempoExpirar;
	
	@Column(name="principal_name")
	@JsonProperty("util")
	private String util;

	public String getIdSessao() {
		return idSessao;
	}

	public void setIdSessao(String idSessao) {
		this.idSessao = idSessao;
	}

	public String getTempoCriacao() {
		return tempoCriacao;
	}

	public void setTempoCriacao(String tempoCriacao) {
		this.tempoCriacao = tempoCriacao;
	}

	public String getLastAccess() {
		return lastAccess;
	}

	public void setLastAccess(String lastAccess) {
		this.lastAccess = lastAccess;
	}

	public String getTempoExpirar() {
		return tempoExpirar;
	}

	public void setTempoExpirar(String tempoExpirar) {
		this.tempoExpirar = tempoExpirar;
	}

	public String getUtil() {
		return util;
	}

	public void setUtil(String util) {
		this.util = util;
	}
	
	@JsonIgnore
	public String getDataAcesso() {
		if(lastAccess != null) {
			Timestamp ts = new Timestamp(Long.parseLong(lastAccess));
			Date dataAcesso = ts;
			return dataAcesso.toString().substring(0, 19);
		}else {
			return "NO DATA";
		}
		
	}
}
