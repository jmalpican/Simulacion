package controller;

import bean.Capacitacion;
import bean.Observador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.CapacitacionService;
import service.ObservadorService;

import java.util.List;

@Controller
public class ObservadorController {

    @Autowired
    ObservadorService observadorService;

    @Autowired
    CapacitacionService capacitacionService;

    @RequestMapping(value="/observador",method={RequestMethod.GET})
    public String observadorGet(Model model) {
        model.addAttribute("observadores", observadorService.getObservadores());
        return "observador";
    }

    @RequestMapping(value="/observador/nuevo",method={RequestMethod.GET})
    public String observadorNuevo(Model model) {
        Observador observador = new Observador();
        model.addAttribute("observadorForm", observador);
        return "observador/nuevo";
    }

    @RequestMapping(value = "/observador/{id}", method = RequestMethod.GET)
    public String showUser(@PathVariable("id") int id, Model model) {

        Observador observador = observadorService.getObservadorPorId(id);
//        if (user == null) {
//            model.addAttribute("css", "danger");
//            model.addAttribute("msg", "User not found");
//        }
        model.addAttribute("observador", observador);
        return "observador/mostrar";
    }

    @RequestMapping(value = "/observador/{id}/capacitacion", method = RequestMethod.GET)
    public String showCapacitaciones(@PathVariable("id") int id, Model model) {
        List<Capacitacion> capacitaciones = capacitacionService.getCapacitacionesPorObservador(id);
//        if (user == null) {
//            model.addAttribute("css", "danger");
//            model.addAttribute("msg", "User not found");
//        }
        model.addAttribute("capacitaciones", capacitaciones);
        return "observador/capacitacion";
    }

}
