package service;

import bean.Capacitacion;
import bean.Observador;

import java.util.List;

public interface CapacitacionService {

    void insertarCapacitacion(Capacitacion capacitacion);

    Capacitacion getCapacitacion(int id);

    List<Capacitacion> getCapacitacionesPorObservador(int id);

}
