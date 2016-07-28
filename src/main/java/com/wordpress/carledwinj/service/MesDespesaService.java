package com.wordpress.carledwinj.service;

import java.util.List;

import com.wordpress.carledwinj.model.Despesa;

public interface MesDespesaService {
	List<Despesa> all();
	Despesa save(Despesa mesDespesa);
}
