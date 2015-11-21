package service;

import bean.Observador;
import dao.ObservadorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ObservadorServiceImpl implements ObservadorService {

    @Autowired
    ObservadorMapper observadorMapper;

    @Override
    public void saveOrUpdateObservador(Observador observador) {
        if (observador.getId() > 0) {
            observadorMapper.actualizarObservador(observador);
        } else {
            observadorMapper.registrarObservador(observador);
        }
    }

    @Override
    public List<Observador> getObservadores() {
        return observadorMapper.getAll();
    }

    @Override
    public Observador getObservadorPorId(int id) {
        return observadorMapper.getObservadorPorId(id);
    }

    @Override
    public List<Observador> getObservadoresPorEstacionId(int id) {
        return observadorMapper.getObservadoresPorEstacionId(id);
    }
}
