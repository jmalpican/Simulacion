package service;

import bean.Capacitacion;
import bean.Observador;
import dao.CapacitacionMapper;
import dao.ObservadorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CapacitacionServiceImpl implements CapacitacionService {

    @Autowired
    CapacitacionMapper capacitacionMapper;

    @Override
    public void insertarCapacitacion(Capacitacion capacitacion) {
        capacitacionMapper.insertarCapacitacion(capacitacion);
    }

    @Override
    public Capacitacion getCapacitacion(int id) {
        return capacitacionMapper.getCapacitacionPorId(id);
    }

    @Override
    public List<Capacitacion> getCapacitacionesPorObservador(int id) {
        return capacitacionMapper.getCapacitacionPorObservador(id);
    }
}
