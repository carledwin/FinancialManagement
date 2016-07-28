package com.wordpress.carledwinj.model;

public enum StatusDespesaEnum {
	PAGA(1L,"Paga"), VENCIDA(2L,"Vencida"),EM_ABERTO(0L, "Em Aberto"), CANCELADA(3L,"Cancelado");
	
	private Long codigo;
	private String descricao;
	
	private StatusDespesaEnum(Long codigo, String descricao) {
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
