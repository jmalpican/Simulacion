package controller;

import bean.*;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import service.CapacitacionService;
import service.ObservadorService;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
public class AjaxController {

    @Autowired
    CapacitacionService capacitacionService;

    @Autowired
    ObservadorService observadorService;

    @RequestMapping(value="/api/capacitacion/create")
    public String getSearchResultViaAjax(@RequestBody Capacitacion capacitacion) {

        AjaxResponseBody result = new AjaxResponseBody();
        result.setMessage("");
        result.setCode("200");
        result.setResult(capacitacion);

        return getJson(result);
    }

    @RequestMapping(value="/api/getEstacion",method={RequestMethod.GET},produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String getEstacion(ModelMap mapa, HttpServletRequest request) throws Exception{
        List<Suggestion> listSuggestion = new ArrayList<Suggestion>();
        Suggestion sug1 = new Suggestion();
        sug1.setData("1");
        sug1.setValue("Estacion 1");
        Suggestion sug2 = new Suggestion();
        sug2.setData("2");
        sug2.setValue("Estacion 2");
        listSuggestion.add(sug1);
        listSuggestion.add(sug2);

        SuggestionResult suggestionResult = new SuggestionResult();
        suggestionResult.setSuggestions(listSuggestion);
        return getJson(suggestionResult);
    }

    @RequestMapping(value="/api/saveObservador",method={RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String saveObservador(HttpServletRequest request) throws Exception{
        System.out.println(request.getParameter("obsid"));
        Observador observador = generateObservador(request);

        observadorService.saveOrUpdateObservador(observador);

        AjaxResponseBody result = new AjaxResponseBody();
        result.setMessage("");
        result.setCode("200");
        return getJson(result);
    }

    @RequestMapping(value="/api/saveCapacitacion",method={RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String saveCapacitacion(HttpServletRequest request) throws Exception{
        System.out.println(request.getParameter("observadorId"));

        Capacitacion capacitacion = generateCapacitacion(request);
        capacitacionService.saveOrUpdateCapacitacion(capacitacion);

        AjaxResponseBody result = new AjaxResponseBody();
        result.setMessage("La capacitacion fue registrada");
        result.setCode("200");
        return getJson(result);
    }

    @RequestMapping(value="/api/getObservador/estacion/{id}",method={RequestMethod.GET},produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String getObservadores(@PathVariable int id, ModelMap mapa, HttpServletRequest request) throws Exception{
        List<Observador> observadorList = observadorService.getObservadoresPorEstacionId(id);
        return getJson(observadorList);
    }

    @RequestMapping(value="/api/getCapacitacion/observador/{id}",method={RequestMethod.GET},produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String getCapacitaciones(@PathVariable int id, ModelMap mapa, HttpServletRequest request) throws Exception{
        List<Capacitacion> capacitacionList = capacitacionService.getCapacitacionesPorObservador(id);
        return getJson(capacitacionList);
    }

    @RequestMapping(value="/api/capacitacion/{id}",method={RequestMethod.DELETE},produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String delCapacitacion(@PathVariable int id, HttpServletRequest request) throws Exception{
        capacitacionService.eliminarCapacitacion(id);

        AjaxResponseBody result = new AjaxResponseBody();
        result.setMessage("La capacitacion fue eliminada");
        result.setCode("200");
        return getJson(result);
    }

    private Observador generateObservador(HttpServletRequest request) throws ParseException {
        DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
        String dni = request.getParameter("dni");
        String id = request.getParameter("id");
        Observador observador = new Observador();
        observador.setId(StringUtils.hasText(id) ? Integer.parseInt(id) : 0);
        observador.setNombre(request.getParameter("nombre"));
        observador.setDni(StringUtils.hasText(dni) ? Integer.parseInt(dni) : 0);
        observador.setFechaIngreso(format.parse(request.getParameter("fechaIngreso")));
        observador.setCelular(request.getParameter("celular"));
        observador.setFijo(request.getParameter("fijo"));
        observador.setDireccion(request.getParameter("direccion"));
        observador.setReferencia(request.getParameter("referencia"));
        observador.setMail(request.getParameter("mail"));
        observador.setGradoInstruccion(request.getParameter("gradoInstruccion"));
        observador.setOtraOcupacion(request.getParameter("otraOcupacion"));
        observador.setEstacionId(Integer.parseInt(request.getParameter("estacionId")));
        return observador;
    }

    private Capacitacion generateCapacitacion(HttpServletRequest request){
        Capacitacion capacitacion = new Capacitacion();
        capacitacion.setObservadorId(Integer.parseInt(request.getParameter("observadorId")));
        capacitacion.setNombre(request.getParameter("nombre"));
        capacitacion.setDuracion(request.getParameter("duracion"));
        capacitacion.setLugar(request.getParameter("lugar"));
        capacitacion.setOrganizador(request.getParameter("organizador"));
        capacitacion.setCertificado(request.getParameter("certificado"));
        capacitacion.setObservacion(request.getParameter("observacion"));
        return capacitacion;
    }

    private String getJson(Object object) {
        return new Gson().toJson(object);
    }
}
