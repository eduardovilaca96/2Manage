package com.example.demo.entities;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name = "tarefas")
public class Tarefa {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_tarefa")
	private Integer idTarefa;

	@Column(name = "nome_tarefa")
	private String designacao;
	
	@Column(name = "data_criacao")
	private long dataCriacao;
	
	@Column(name = "data_completada")
	private long dataConclusao;

	@Column(name = "data_fim")
	private long dataFim;

	@JoinColumn(name = "idprojeto")
	@JsonProperty("projeto")
	@ManyToOne(optional = true)
	private Projeto projeto;

	@JoinColumn(name = "idmembro")
	@ManyToOne
	private Membro membro;

	@Column(name = "idstatus")
	private Integer status;

	@Column(name = "idtipo")
	private Integer tipo;
	
	@Column(name = "progresso")
	private Integer progresso;
	
	@Column(name = "descricao")
	private String descricao;	

	public Integer getIdTarefa() {
		return idTarefa;
	}

	public void setIdTarefa(Integer IdTarefa) {
		this.idTarefa = IdTarefa;
	}

	public String getDesignacao() {
		return designacao;
	}

	public void setDesignacao(String designacao) {
		this.designacao = designacao;
	}

	public long getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(long dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public long getDataFim() {
		return dataFim;
	}

	public void setDataFim(long dataFim) {
		this.dataFim = dataFim;
	}

	public Projeto getProjeto() {
		return projeto;
	}

	public void setProjeto(Projeto projeto) {
		this.projeto = projeto;
	}

	public Membro getMembro() {
		return membro;
	}

	public void setMembro(Membro membro) {
		this.membro = membro;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getTipo() {
		return tipo;
	}

	public void setTipo(Integer tipo) {
		this.tipo = tipo;
	}

	public Integer getProgresso() {
		return progresso;
	}

	public void setProgresso(Integer progresso) {
		this.progresso = progresso;
	}

	public Long getDataConclusao() {
		return dataConclusao;
	}

	public void setDataConclusao(Long dataConclusao) {
		this.dataConclusao = dataConclusao;
	}
	
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDataFormatada(long Data) {
			
		Date date = new Timestamp(Data);
		return date.toString().substring(0,16);
	}

}

