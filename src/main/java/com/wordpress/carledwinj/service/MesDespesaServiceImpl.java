package com.wordpress.carledwinj.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wordpress.carledwinj.model.Despesa;
import com.wordpress.carledwinj.repository.MesDespesaRepository;


@Service
public class MesDespesaServiceImpl implements MesDespesaService{

	@Autowired
	private MesDespesaRepository mesDespesaRepository;

	public List<Despesa> all(){
		
		List<Despesa> lista = new ArrayList<Despesa>();
		
		return lista; 
	}
	
	public Despesa save(Despesa mesDespesa){
		return mesDespesaRepository.save(mesDespesa);
	}

}
