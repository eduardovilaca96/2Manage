package com.example.demo.entities;

import java.nio.charset.StandardCharsets;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "projetos")
public class Projeto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_projeto")
	private Integer idProjeto;

	@Column(name = "designacao")
	private String designacao;

	@JoinColumn(name = "id_cliente")
	@ManyToOne
	private Cliente cliente;

	@Column(name = "sourcecode")
	private byte[] sourceCode;

	@Column(name = "preview")
	private byte[] preview;
	
	@Column(name = "data_criacao")
	private Date dataCriacao;

	@Column(name = "informacoes")
	private String informacoes;
	
	@Column(name = "link")
	private String link;
	
	@Column(name = "versao")
	private String versao;

	public Integer getIdProjeto() {
		return idProjeto;
	}

	public void setIdProjeto(Integer idProjeto) {
		this.idProjeto = idProjeto;
	}

	public String getDesignacao() {
		return designacao;
	}

	public void setDesignacao(String designacao) {
		this.designacao = designacao;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public byte[] getSourceCode() {
		return sourceCode;
	}

	public void setSourceCode(byte[] sourceCode) {
		this.sourceCode = sourceCode;
	}

	public Date getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public String getInformacoes() {
		return informacoes;
	}

	public void setInformacoes(String informacoes) {
		this.informacoes = informacoes;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getVersao() {
		return versao;
	}

	public void setVersao(String versao) {
		this.versao = versao;
	}

	public byte[] getPreview() {
		return preview;
	}

	public void setPreview(byte[] preview) {
		this.preview = preview;
	}
	
	public String getFileContent(byte[] file) {
		if(file != null) {
			return new String(file, StandardCharsets.UTF_8);
		}else {
			return "";
		}
	}

	
}
