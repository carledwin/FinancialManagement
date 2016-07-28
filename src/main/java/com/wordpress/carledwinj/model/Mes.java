package com.wordpress.carledwinj.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="mes")
public class Mes implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@NotEmpty
	private String descricao;
	
	private BigDecimal valorTotalAPagar;
	
	private BigDecimal valorTotalPago;
	
	private BigDecimal valorTotalVencido;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date dataInicial;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date dataFinal;

	@ManyToMany
	@JoinTable(name="mes_despesa", 
				joinColumns= @JoinColumn(name="id_mes"), 
				inverseJoinColumns=@JoinColumn(name="id_despesa"))
	private Set<Despesa> despesas;
	
	
	public Mes() {
	}

	
	public Mes(Long id, String descricao, BigDecimal valorTotalAPagar, BigDecimal valorTotalPago,
			BigDecimal valorTotalVencido, Date dataInicial, Date dataFinal, Set<Despesa> despesas) {
		super();
		this.id = id;
		this.descricao = descricao;
		this.valorTotalAPagar = valorTotalAPagar;
		this.valorTotalPago = valorTotalPago;
		this.valorTotalVencido = valorTotalVencido;
		this.dataInicial = dataInicial;
		this.dataFinal = dataFinal;
		this.despesas = despesas;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public BigDecimal getValorTotalAPagar() {
		return valorTotalAPagar;
	}

	public void setValorTotalAPagar(BigDecimal valorTotalAPagar) {
		this.valorTotalAPagar = valorTotalAPagar;
	}

	public BigDecimal getValorTotalPago() {
		return valorTotalPago;
	}

	public void setValorTotalPago(BigDecimal valorTotalPago) {
		this.valorTotalPago = valorTotalPago;
	}

	public BigDecimal getValorTotalVencido() {
		return valorTotalVencido;
	}

	public void setValorTotalVencido(BigDecimal valorTotalVencido) {
		this.valorTotalVencido = valorTotalVencido;
	}

	public Date getDataInicial() {
		return dataInicial;
	}

	public void setDataInicial(Date dataInicial) {
		this.dataInicial = dataInicial;
	}

	public Date getDataFinal() {
		return dataFinal;
	}

	public void setDataFinal(Date dataFinal) {
		this.dataFinal = dataFinal;
	}


	public Set<Despesa> getDespesas() {
		return despesas;
	}


	public void setDespesas(Set<Despesa> despesas) {
		this.despesas = despesas;
	}
	
}