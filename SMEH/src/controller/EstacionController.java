package controller;

import bean.Estacion;
import com.google.gson.Gson;
import dao.EstacionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EstacionController {

    @Autowired
    EstacionDao estacionDao;

    @RequestMapping(value="/estacion",method={RequestMethod.GET})
    public String estacionGet(Model model) {
        model.addAttribute("estaciones", estacionDao.getListAll());
        return "estacion";
    }

    @RequestMapping(value="/estacion/nuevo",method={RequestMethod.GET})
    public String estacionNuevo(Model model) {
        Estacion estacion = new Estacion();
        model.addAttribute("estacionForm", estacion);
        return "estacionNuevo";
    }

//    @RequestMapping(value="/estacion/nuevo",method={RequestMethod.GET})
//    public String estacionGet(Model model) {
//        model.addAttribute("estaciones", estacionDao.getListAll());
//
//        return "estaciones";
//    }

    private String getJson(Object object) {
        return new Gson().toJson(object);
    }

}
