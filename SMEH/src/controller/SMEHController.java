package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import bean.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import service.SMEHService;
import service.SensorService;

@Controller
public class SMEHController {

	@Autowired
	private SMEHService smehService;

	@Autowired
	private SensorService sensorService;
	
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

    @RequestMapping("/principal")
    public String principal(ModelMap mapa,HttpServletRequest request) {

        return "principal";
    }
	
	private void cargarPestana1(ModelMap mapa) {
		List<Metadatos> lstMetadatos = new ArrayList<Metadatos>();
//		lstMetadatos = smehService.getListAll();
		
		List<Responsable> lstResponsables = new ArrayList<Responsable>();
//		lstResponsables = smehService.getListAllResponsable();
		
		mapa.addAttribute("lstResponsables",getJson(lstResponsables));
		
		List<Combo> lstMotivo = new ArrayList<Combo>();
//		lstMotivo = smehService.getListAllMotivo();
		
		mapa.addAttribute("lstMotivo",getJson(lstMotivo));
		
		mapa.addAttribute("lstMetadatos",getJson(lstMetadatos));
		
		List<Combo> lstSituacionLegal = new ArrayList<Combo>();
		lstSituacionLegal = smehService.getListAllSituacionLegal();
		mapa.addAttribute("lstSituacionLegal",getJson(lstSituacionLegal));
		
		List<Combo> lstTipoEstacion = new ArrayList<Combo>();
		lstTipoEstacion = smehService.getListAllTipoEstacion();
		mapa.addAttribute("lstTipoEstacion",getJson(lstTipoEstacion));
		
		List<Combo> lstPropositoRed = new ArrayList<Combo>();
		lstPropositoRed = smehService.getListAllPropositoRed();
		mapa.addAttribute("lstPropositoRed",getJson(lstPropositoRed));
		
		List<Combo> lstClasificacionEstacion = new ArrayList<Combo>();
		lstClasificacionEstacion = smehService.getListAllClasificacionEstacion();
		mapa.addAttribute("lstClasificacionEstacion",getJson(lstClasificacionEstacion));
		
		List<SubEstacion> lstSubEstacion1 = new ArrayList<SubEstacion>();
		lstSubEstacion1 = smehService.getListAllSubEstacion1(0);
		mapa.addAttribute("lstSubEstacion1",getJson(lstSubEstacion1));
	
		List<SubEstacion2> lstSubEstacion2 = new ArrayList<SubEstacion2>();
		lstSubEstacion2 = smehService.getListAllSubEstacion2(0);
		mapa.addAttribute("lstSubEstacion2",getJson(lstSubEstacion2));
		
		List<SubEstacion3> lstSubEstacion3 = new ArrayList<SubEstacion3>();
		lstSubEstacion3 = smehService.getListAllSubEstacion3(0);
		mapa.addAttribute("lstSubEstacion3",getJson(lstSubEstacion3));

		List<Combo> listGradoInt = new ArrayList<Combo>();
		listGradoInt = sensorService.getListAllGradoInterferencia();
		mapa.addAttribute("lstGradoInterferencia",getJson(listGradoInt));

		List<Combo> listTipoSurperficie = new ArrayList<Combo>();
		listTipoSurperficie = sensorService.getListAllTipoSuperficie();
		mapa.addAttribute("lstTipoSurperficie",getJson(listTipoSurperficie));

		List<Combo> listTipoBase = new ArrayList<Combo>();
		listTipoBase = sensorService.getListAllTipoBase();
		mapa.addAttribute("lstTipoBase",getJson(listTipoBase));
		
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
	
	@RequestMapping(value="/guardarCombo",method={RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String guardarCombo(ModelMap mapa, HttpServletRequest request) throws Exception{
		try {
			Combo combo = new Combo();
			combo.setCodigo(getValorParamInt(request, "codigo"));
			combo.setDescripcion(getValorParam(request, "descripcion"));
			combo.setTabla(getValorParam(request, "tabla"));
			smehService.guardarCombo(combo);
			
		} catch (Exception e) {
			System.out.print(e);
		}
		
		
		return "true";
	}
	
	@RequestMapping(value="/registrarInformacionEstacion",method={RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String registrarInformacionEstacion(ModelMap mapa, HttpServletRequest request) throws Exception{

		String resultado = "0";
		Estacion estacion = new Estacion();
		try {

        	
        	
			String nombreEstacion = getValorParam(request, "nombreEstacion");
			String alias = getValorParam(request, "alias");
			String codigoSenamhi = getValorParam(request, "codigoSenamhi");
		    String codigoOmm = getValorParam(request, "codigoOmm");
			String otroCodigo = getValorParam(request, "otroCodigo");
			String tipoClasEstacion = getValorParam(request, "tipoClasEstacion");
			String tipoSubClasEstacion1 = getValorParam(request, "tipoSubClasEstacion1");
			String tipoSubClasEstacion2 = getValorParam(request, "tipoSubClasEstacion2");
			String tipoSubClasEstacion3 = getValorParam(request, "tipoSubClasEstacion3");
			String tipoEstacion = getValorParam(request, "tipoEstacion");
			String mixta = getValorParam(request, "mixta");
			String fecIni = getValorParam(request, "fecIni");
			String autorizacionIni = getValorParam(request, "autorizacionIni");
			String fecFin = getValorParam(request, "fecFin");
			String autorizacionFin = getValorParam(request, "autorizacionFin");
			String propiedadEstacion = getValorParam(request, "propiedadEstacion");
			String tipoSituacion = getValorParam(request, "tipoSituacion");
			String nombreRed = getValorParam(request, "nombreRed");
			String tipoestacionRed = getValorParam(request, "tipoestacionRed");
		
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		      
	         Date fechaInicio = df.parse(fecIni);     
	         Date fechaFin = df.parse(fecFin);    
	         
			
			estacion.setNombre(nombreEstacion);
			estacion.setAlias(alias);
			estacion.setCodSenamhi(codigoSenamhi);
			estacion.setCodOmn(codigoOmm);
			estacion.setCodOtro(otroCodigo);
			estacion.setClasificacion(Integer.parseInt(tipoClasEstacion));
			estacion.setSub1estacion(Integer.parseInt(tipoSubClasEstacion1));
			estacion.setSub2estacion(Integer.parseInt(tipoSubClasEstacion2));
			estacion.setSub3estacion(Integer.parseInt(tipoSubClasEstacion3));
			estacion.setTipoEstacion(Integer.parseInt(tipoEstacion));
			estacion.setEstacionMixt(mixta);
			estacion.setfInicio(fechaInicio);
			estacion.setAutorizacionIni(autorizacionIni);
			estacion.setfCierre(fechaFin);
			estacion.setAutorizacionCierre(autorizacionFin);
			estacion.setPropiedad(propiedadEstacion);
			estacion.setSituacionLegal(tipoSituacion);
			estacion.setNombreRed(nombreRed);
			estacion.setPropositoEstacionRed(Integer.parseInt(tipoestacionRed));
			 
		
			
		  smehService.registrarEstacion(estacion);
            resultado = "1";
	    	
		} catch (Exception e) {
	
			e.printStackTrace();
		}
		
		return getJson(resultado);
		
	}

	@RequestMapping(value="/registrarSensor",method={RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String registrarSensor(ModelMap mapa, HttpServletRequest request) throws Exception{

		String resultado = "0";
		Sensor sensor = new Sensor();
		try {

			String instrumento = getValorParam(request, "instrumento");
			String instalado = getValorParam(request, "instalado");
			String empresa = getValorParam(request, "empresa");
			String distancia = getValorParam(request, "distancia");
			String area = getValorParam(request, "area");
			String material = getValorParam(request, "material");
			String notas = getValorParam(request, "notas");
			String altura = getValorParam(request, "altura");
			String gradoInterferencia = getValorParam(request, "gradoInterferencia");
			String tipoSuperficie = getValorParam(request, "tipoSuperficie");
			String tipoBase = getValorParam(request, "tipoBase");
			String fecIni = getValorParam(request, "fechaIni");
			String esquema = getValorParam(request, "esquema");


			DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
			Date fechaInicio = df.parse(fecIni);

			sensor.setSensor(instrumento);
			sensor.setInstalpor(instalado);
			sensor.setInstalemp(empresa);
			sensor.setDistancia(distancia);
			sensor.setInstalarearesp(area);
			sensor.setMaterial(material);
			sensor.setNotas(notas);
			sensor.setAltbase(altura);
			sensor.setfInstal(fechaInicio);
			sensor.setEsquema(esquema);

			sensor.setGradinterf(Integer.parseInt(gradoInterferencia));
			sensor.setTsuperfbajosensor(Integer.parseInt(tipoSuperficie));
			sensor.setTipobase(Integer.parseInt(tipoBase));

			sensorService.registrarSensor(sensor);
			resultado = "1";

		} catch (Exception e) {

			e.printStackTrace();
		}

		return getJson(resultado);

	}
	
	@RequestMapping(value="/selectComboClasificacion",method={RequestMethod.GET},produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String selectComboClasificacion(ModelMap mapa, HttpServletRequest request) throws Exception{
	
			
			    int codigo = getValorParamInt(request, "codigo");
			    List<SubEstacion> lstSubEstacion1 = new ArrayList<SubEstacion>();
				lstSubEstacion1 = smehService.getListAllSubEstacion1(codigo);
				mapa.addAttribute("lstSubEstacion1",getJson(lstSubEstacion1));
		
				
				 return getJson(lstSubEstacion1);
	}
	
	
	@RequestMapping(value="/selectComboSub1",method={RequestMethod.GET},produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String selectComboSub1(ModelMap mapa, HttpServletRequest request) throws Exception{
	
			
			    int codigo = getValorParamInt(request, "codigo");
			    
			    List<SubEstacion2> lstSubEstacion2 = new ArrayList<SubEstacion2>();
				lstSubEstacion2 = smehService.getListAllSubEstacion2(codigo);
				mapa.addAttribute("lstSubEstacion2",getJson(lstSubEstacion2));

				
				 return getJson(lstSubEstacion2);
	}
	
	@RequestMapping(value="/selectComboSub2",method={RequestMethod.GET},produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String selectComboSub2(ModelMap mapa, HttpServletRequest request) throws Exception{
	
			
			    int codigo = getValorParamInt(request, "codigo");
			    
				List<SubEstacion3> lstSubEstacion3 = new ArrayList<SubEstacion3>();
				lstSubEstacion3 = smehService.getListAllSubEstacion3(codigo);
				mapa.addAttribute("lstSubEstacion3",getJson(lstSubEstacion3));
			    

				
				 return getJson(lstSubEstacion3);
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
