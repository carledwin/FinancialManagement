package com.wordpress.carledwinj.service;

import com.wordpress.carledwinj.model.Mes;

public interface MesService {
	Iterable<Mes> all();
	Mes save(Mes mes);
	void delete(Long id);
	Mes findById(Long id);
	
}
