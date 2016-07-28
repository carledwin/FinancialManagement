package com.wordpress.carledwinj.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

@Entity
@Table(name="despesa")
public class Despesa implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String descricaoD;
	
	@NumberFormat(pattern="#,##")
	private BigDecimal valor;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date dataVencimento;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date dataPagamento;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date dataAgendamento;

	@Enumerated(EnumType.STRING)
	private StatusDespesaEnum status;
		
	@ManyToMany(mappedBy="despesas")
	private Set<Mes> mes;
	
	@Enumerated(EnumType.STRING)
	private TipoDespesaEnum tipo;
	
	public Despesa() {
	}

	public Despesa(Long id, String descricaoD, BigDecimal valor, Date dataVencimento, Date dataPagamento,
			Date dataAgendamento, StatusDespesaEnum status, Set<Mes> mes, TipoDespesaEnum tipo) {
		super();
		this.id = id;
		this.descricaoD = descricaoD;
		this.valor = valor;
		this.dataVencimento = dataVencimento;
		this.dataPagamento = dataPagamento;
		this.dataAgendamento = dataAgendamento;
		this.status = status;
		this.mes = mes;
		this.tipo = tipo;
	}

	public TipoDespesaEnum getTipo() {
		return tipo;
	}

	public void setTipo(TipoDespesaEnum tipo) {
		this.tipo = tipo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public Date getDataVencimento() {
		return dataVencimento;
	}

	public void setDataVencimento(Date dataVencimento) {
		this.dataVencimento = dataVencimento;
	}

	public Date getDataPagamento() {
		return dataPagamento;
	}

	public void setDataPagamento(Date dataPagamento) {
		this.dataPagamento = dataPagamento;
	}

	public Date getDataAgendamento() {
		return dataAgendamento;
	}

	public void setDataAgendamento(Date dataAgendamento) {
		this.dataAgendamento = dataAgendamento;
	}

	public StatusDespesaEnum getStatus() {
		return status;
	}

	public void setStatus(StatusDespesaEnum status) {
		this.status = status;
	}


	public String getDescricaoD() {
		return descricaoD;
	}


	public void setDescricaoD(String descricaoD) {
		this.descricaoD = descricaoD;
	}


	public Set<Mes> getMes() {
		return mes;
	}

	public void setMes(Set<Mes> mes) {
		this.mes = mes;
	}
	
}