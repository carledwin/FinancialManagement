package com.wordpress.carledwinj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wordpress.carledwinj.model.Despesa;
import com.wordpress.carledwinj.service.DespesaService;

@Controller
@SessionAttributes
@RequestMapping("/despesa")
public class DespesaController {

	@Autowired
	private DespesaService dfService;
	

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String loadAllDespesas(Model model) {
		model.addAttribute("listaDespesasFixas", dfService.all());
		return "cadastroDespesaFixa";
	}
	
	@RequestMapping(value = "/nova", method = RequestMethod.GET)
	public String prepareLoad(Model model) {
		model.addAttribute("novaDespesaFixa", new Despesa());
		return "cadastroDespesaFixa";
	}
	
	@RequestMapping(value = "/cadastrar", method = RequestMethod.POST)
	public String create(@ModelAttribute("novaDespesaFixa") Despesa despesa, Model model, BindingResult result) {
		dfService.save(despesa);	
		return "redirect:/despesa";	
	}
}
