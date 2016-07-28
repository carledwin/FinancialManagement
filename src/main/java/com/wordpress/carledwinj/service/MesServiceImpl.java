package com.wordpress.carledwinj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wordpress.carledwinj.model.Mes;
import com.wordpress.carledwinj.repository.MesRepository;


@Service
public class MesServiceImpl implements MesService{

	@Autowired
	private MesRepository mesRepository;

	public Iterable<Mes> all(){
		return mesRepository.findAll(); 
	}
	
	public Mes save(Mes mes){
		return mesRepository.save(mes);
	}
	
	
	public void insertAll(){
	
	}

	@Override
	public void delete(Long id) {
		mesRepository.delete(id);
	}

	@Override
	public Mes findById(Long id) {
		return mesRepository.findOne(id);
	}

}
