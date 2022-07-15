package com.example.demo.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Entity
@Table(name = "moradas")
public class Morada {

	@Id
	@JsonSerialize
	@JsonProperty("id_morada")
	@Column(name = "id_morada")
	private Integer idMorada;

	@JsonSerialize
	@JsonProperty("linha1")
	@Column(name = "linha1")
	private String linha1;

	@JsonSerialize
	@JsonProperty("linha2")
	@Column(name = "linha2")
	private String linha2;

	@JsonSerialize
	@JsonProperty("codigopostal")
	@Column(name = "codigopostal")
	private String codigopostal;
	
	@JsonSerialize
	@JsonProperty("localidade")
	@Column(name = "localidade")
	private String localidade;

	@JsonSerialize
	@JsonProperty("freguesia")
	@Column(name = "freguesia")
	private String freguesia;

	@JsonSerialize
	@JsonProperty("numero")
	@Column(name = "numero")
	private Integer numero;

	@JsonSerialize
	@JsonProperty("lote")
	@Column(name = "lote")
	private Integer lote;

	public Integer getIdMorada() {
		return idMorada;
	}

	public void setIdMorada(Integer idMorada) {
		this.idMorada = idMorada;
	}

	public String getLinha1() {
		return linha1;
	}

	public void setLinha1(String linha1) {
		this.linha1 = linha1;
	}

	public String getLinha2() {
		return linha2;
	}

	public void setLinha2(String linha2) {
		this.linha2 = linha2;
	}

	public String getCodigopostal() {
		return codigopostal;
	}

	public void setCodigopostal(String codigopostal) {
		this.codigopostal = codigopostal;
	}

	public String getLocalidade() {
		return localidade;
	}

	public void setLocalidade(String localidade) {
		this.localidade = localidade;
	}

	public String getFreguesia() {
		return freguesia;
	}

	public void setFreguesia(String freguesia) {
		this.freguesia = freguesia;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public Integer getLote() {
		return lote;
	}

	public void setLote(Integer lote) {
		this.lote = lote;
	}



}
