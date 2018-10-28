package com.avengers.proyecto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import modelo.mongodb.DAOEmpleado;
import modelo.mongodb.Empleado;

public class loginController {

	@RequestMapping("login.htm")
	public ModelAndView redireccion() {
		ModelAndView MV= new ModelAndView();
		MV.setViewName("login");


		return MV;
	}


	@RequestMapping(value = "login.htm", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, ModelMap model)throws Exception{
		String email, contrasena;
		Empleado empleado = new Empleado();
		email = request.getParameter("inputEmail");
		contrasena = request.getParameter("inputPassword");		
		if(empleado.credencialesCorrectas(email, contrasena)) {
			empleado = new Empleado(email, contrasena);
			model.addAttribute("email", empleado.getEmail());
			return new ModelAndView("home");

		}else {

			return new ModelAndView("login","error","usuario o contraseña incorrectos");
		} 	
	}
}
