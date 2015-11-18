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
    public void insertarObservador(Observador observador) {
        observadorMapper.insertarObservador(observador);
    }

    @Override
    public List<Observador> getObservadores() {
        return observadorMapper.getAll();
    }

    @Override
    public Observador getObservadorPorId(int id) {
        return observadorMapper.getObservadorPorId(id);
    }
}
