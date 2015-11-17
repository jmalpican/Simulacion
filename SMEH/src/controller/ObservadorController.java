package controller;

import bean.Estacion;
import bean.Observador;
import dao.ObservadorDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ObservadorController {

    @Autowired
    ObservadorDao observadorDao;

    @RequestMapping(value="/observador",method={RequestMethod.GET})
    public String observadorGet(Model model) {
        model.addAttribute("observadores", observadorDao.getListAll());
        return "observador";
    }

    @RequestMapping(value="/observador/nuevo",method={RequestMethod.GET})
    public String observadorNuevo(Model model) {
        Observador observador = new Observador();
        model.addAttribute("estacionForm", observador);
        return "observadorNuevo";
    }

}
