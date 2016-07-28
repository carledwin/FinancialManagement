package com.wordpress.carledwinj.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.wordpress.carledwinj.model.Despesa;
import com.wordpress.carledwinj.model.Mes;
import com.wordpress.carledwinj.service.DespesaService;
import com.wordpress.carledwinj.service.MesService;

@Controller
@SessionAttributes
@RequestMapping("/")
public class MesController {

	@Autowired
	private MesService mesService;
	
	@Autowired
	private DespesaService despesaService;
	
	private Mes mes = new Mes(); 
	
	@RequestMapping(value = "/mes/novo", method = RequestMethod.GET)
	public String novo(Model model) {
			
		this.mes = new Mes();
		this.mes.setDespesas(new HashSet<Despesa>());
		this.mes.setDataInicial(new Date());
		this.mes.setDataFinal(new Date());
		this.mes.setValorTotalAPagar(new BigDecimal(0));
		this.mes.setValorTotalPago(new BigDecimal(0));
		this.mes.setValorTotalVencido(new BigDecimal(0));
		
		List<Despesa> listDespesasFixas = despesaService.all();
		
		this.mes.getDespesas().addAll(listDespesasFixas);
		
		Despesa novaDespesaVariavel = new Despesa();
		
		novaDespesaVariavel.setValor(new BigDecimal(0));
		novaDespesaVariavel.setDataVencimento(new Date());
		novaDespesaVariavel.setDataPagamento(new Date());
		novaDespesaVariavel.setDataAgendamento(new Date());
		novaDespesaVariavel.setDescricaoD(new String());
		
		model.addAttribute("novaDespesa", novaDespesaVariavel);
		model.addAttribute("mes", this.mes);
		return "cadastroMes";
	}
	
	@RequestMapping(value = "/mes", method = RequestMethod.GET)
	public String loadAllMeses(Model model) {
		model.addAttribute("listaMeses", mesService.all());
		return "meses";
	}
	
	@RequestMapping(value = "/mes/cadastrar", method = RequestMethod.POST)
	public String save(@ModelAttribute Mes mes, Model model, BindingResult result) {
		
		Mes aux = new Mes();
				
		aux = this.mes;
		
		this.mes = mes;
		
		this.mes.setDespesas(new HashSet<Despesa>());
		
		if(aux.getDespesas() != null && aux.getDespesas().size() > 0)
		this.mes.getDespesas().addAll(aux.getDespesas());
		
		
		mesService.save(mes);
		model.addAttribute("listaMeses", mesService.all());
		return "redirect:/mes";	
	}
	
	
	@RequestMapping(value = "/mes/edit/{id}", method = RequestMethod.POST)
	public ModelAndView updateMes(Model model, @PathVariable Long id) {
		this.mes = mesService.findById(id);
			model.addAttribute("titulo", "Alteração de Mes");
			model.addAttribute("mes", this.mes);
			//this.mes = null;
			return new ModelAndView("cadastroMes");
	}
	
	@RequestMapping( value="/mes/delete/{id}", method=RequestMethod.POST)
	public String deleteMes(@PathVariable Long id){
		try {
			mesService.delete(id);
			return "redirect:/mes";
		} catch (Exception e) {
			return "redirect:/mes";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/mes/adicionar", method = RequestMethod.POST)
	public ModelAndView adicionar(@Valid @ModelAttribute Despesa novaDespesa, Model model,@ModelAttribute Mes mes, BindingResult result) {
		
		this.mes.getDespesas().add(novaDespesa);
		novaDespesa = new Despesa();
		
		Mes mesAux = new Mes();
		
		mesAux = this.mes;
		
		if(mes.getDespesas() == null){
			mes.setDespesas(new HashSet<Despesa>());
		}
		
		this.mes = mes;
		this.mes.getDespesas().addAll(mesAux.getDespesas());
			
		model.addAttribute("mes", this.mes);
		model.addAttribute("novaDespesa",novaDespesa);
		
		return new ModelAndView("cadastroMes");
		
	}

	public Mes getMes() {
		return mes;
	}

	public void setMes(Mes mes) {
		this.mes = mes;
	}
}
