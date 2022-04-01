package com.examen.DC.mayorista.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControllerIndex {
	private static final String INDEX = "/index";

	@GetMapping(value = INDEX)
	public ModelAndView Default() {
		ModelAndView modelAndView = new ModelAndView("index");
		return modelAndView;
	}

	@PostMapping("/datos")
	public @ResponseBody Object recivoDatos(@RequestBody Object dto) {
		return dto;
	}
	/*
	 * Other method
	 * 
	 * @GetMapping(value = Admin_page) public String Admin() { return
	 * "Administrador-Page/Administrador"; }
	 */
}
