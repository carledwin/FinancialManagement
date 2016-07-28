package com.wordpress.carledwinj.model;

public enum TipoDespesaEnum {
	FIXA(1L,"Fixa"), VARIAVEL(2L,"Variável");
	
	private Long codigo;
	private String descricao;
	
	private TipoDespesaEnum(Long codigo, String descricao) {
		this.codigo = codigo;
		this.descricao = descricao;
	}

	public Long getCodigo() {
		return codigo;
	}

	public String getDescricao() {
		return descricao;
	}	
}
