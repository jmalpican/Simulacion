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

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
public class AjaxController {

    @Autowired
    CapacitacionService capacitacionService;

    @RequestMapping(value="/api/capacitacion/create")
    public String getSearchResultViaAjax(@RequestBody Capacitacion capacitacion) {

        AjaxResponseBody result = new AjaxResponseBody();

//        if (isValidSearchCriteria(search)) {
//            capacitacionService.insertarCapacitacion(capacitacion);
//            if (capacitacion.getId() != 0) {
                result.setMessage("");
                result.setCode("200");
                result.setResult(capacitacion);
//            }
//            if (users.size() > 0) {
//                result.setCode("200");
//                result.setMessage("");
//                result.setResult(users);
//            }
            //TODO 204

//        } else {
//            result.setCode("400");
//        }
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
    public @ResponseBody String saveObservador(ModelMap mapa, HttpServletRequest request) throws Exception{
        System.out.println(request.getParameter("obsid"));
        String id = request.getParameter("obsid");
        Observador observador = generateObservador(request);
        if (StringUtils.hasText(id) ) {
            observador.setId(Integer.valueOf(id));
            //TODO actualizar
        } else {
            //TODO registrar
        }

        AjaxResponseBody result = new AjaxResponseBody();
        result.setMessage("");
        result.setCode("200");
        return getJson(result);
    }

    @RequestMapping(value="/api/getObservador/estacion/{id}",method={RequestMethod.GET},produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String saveObservador(@PathVariable int id, ModelMap mapa, HttpServletRequest request) throws Exception{
        System.out.println(id);
        List<Observador> listObs = new ArrayList<Observador>();
        Observador obs = new Observador();
        obs.setId(1);
        obs.setNombre("Manuel");
        obs.setFechaIngreso(new Date());
        obs.setDni(9919191);
        listObs.add(obs);
        return getJson(listObs);
    }

    private Observador generateObservador(HttpServletRequest request){
        String dni = request.getParameter("dni");
        Observador observador = new Observador();
        observador.setNombre(request.getParameter("nombre"));
        observador.setDni(StringUtils.hasText(dni) ? Integer.parseInt(dni) : 0);
        observador.setCelular(request.getParameter("celular"));
        observador.setFijo(request.getParameter("fijo"));
        observador.setDireccion(request.getParameter("direccion"));
        observador.setReferencia(request.getParameter("referencia"));
        observador.setMail(request.getParameter("mail"));
        observador.setGradoInstruccion(request.getParameter("gradoInstruccion"));
        observador.setOtraOcupacion(request.getParameter("otraOcupacion"));
        return observador;
    }

    private String getJson(Object object) {
        return new Gson().toJson(object);
    }
}
