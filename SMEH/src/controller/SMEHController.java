package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import bean.Combo;
import bean.Metadatos;
import bean.Responsable;
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
		
		usuario = smehService.autenticar(usuario);
		
		String rspt = "login";
		if (usuario != null) {
			cargarPestana1(mapa);
			rspt = "principal";
		}
		return rspt;
	}
	
	private void cargarPestana1(ModelMap mapa) {
		List<Metadatos> lstMetadatos = new ArrayList<Metadatos>();
		lstMetadatos = smehService.getListAll();
		
		List<Responsable> lstResponsables = new ArrayList<Responsable>();
		lstResponsables = smehService.getListAllResponsable();
		
		mapa.addAttribute("lstResponsables",getJson(lstResponsables));
		
		List<Combo> lstMotivo = new ArrayList<Combo>();
		lstMotivo = smehService.getListAllMotivo();
		
		mapa.addAttribute("lstMotivo",getJson(lstMotivo));
		
		mapa.addAttribute("lstMetadatos",getJson(lstMetadatos));
		
	}

	@RequestMapping(value="/actualizarMetadatos",method={RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String actualizarMetadatos(ModelMap mapa, HttpServletRequest request) throws Exception{
		List<Metadatos> lstMetadatos = new ArrayList<Metadatos>();
		try {
			Metadatos metadatos = new Metadatos();
			metadatos.setIdMetadatos(getValorParamInt(request, "idMetadatos"));
			metadatos.setIdMotivo(getValorParamInt(request, "idMotivo"));
			metadatos.setIdResp(getValorParamInt(request, "idResp"));
			smehService.actualizarMetadatos(metadatos);
			
			
			lstMetadatos = smehService.getListAll();
//			mapa.addAttribute("lstMetadatos",getJson(lstMetadatos));
	    	
		} catch (Exception e) {
		}
		
		
		return getJson(lstMetadatos);
	}
	
	private String getValorParam(HttpServletRequest request, String key) {
		String rpta = null;
		if (request.getParameter(key) != null && !"".equals(request.getParameter(key).trim())) {
			rpta = request.getParameter(key).trim();
		}
		return rpta;
	}
	
	private Integer getValorParamInt(HttpServletRequest request, String key) {
		Integer rpta = null;
		if (request.getParameter(key) != null && !"".equals(request.getParameter(key).trim())) {
			rpta = Integer.valueOf(request.getParameter(key).trim());
		}
		return rpta;
	}
	
	private String getJson(Object object) {
		return new Gson().toJson(object);
	}

}
