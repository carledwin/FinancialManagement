package com.wordpress.carledwinj.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wordpress.carledwinj.model.Despesa;
import com.wordpress.carledwinj.repository.DespesaRepository;
import com.wordpress.carledwinj.utils.ConvertIterableToList;


@Service
public class DespesaServiceImpl implements DespesaService{

	@Autowired
	private DespesaRepository despesaRepository;

	public List<Despesa> all(){
		List<Despesa> lista = new ArrayList<Despesa>();
		
		if(despesaRepository.findAll().iterator() != null){
			
			lista = ConvertIterableToList.toList(despesaRepository.findAll());
			
		}
		
		return lista; 
	}
	
	public Despesa save(Despesa despesa){
		return despesaRepository.save(despesa);
	}

}
