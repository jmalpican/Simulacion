package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import bean.Usuario;

import service.SMEHService;

@Controller
public class SMEHController {

	@Autowired
	private SMEHService smehService;
	
	@RequestMapping("/iniLogin")
	public String hello() {

		return "login";

	}
	
	@RequestMapping("/iniciarSesion")
	public String iniciarSesion(ModelMap mapa,HttpServletRequest request) {
		String usu = getValorParam(request, "usu");
		String pass = getValorParam(request, "pass");
		
		Usuario usuario = new Usuario();
		usuario.setUsuario(usu);
		usuario.setClave(pass);
		
		smehService.autenticar(usuario);
		
		String rspt = "login";
		if ("user1".equals(usu)&&"pass1".equals(pass)) {
			rspt = "principal";
		}
		return rspt;
	}
	
	private String getValorParam(HttpServletRequest request, String key) {
		String rpta = null;
		if (request.getParameter(key) != null && !"".equals(request.getParameter(key).trim())) {
			rpta = request.getParameter(key).trim();
		}
		return rpta;
	}

}
