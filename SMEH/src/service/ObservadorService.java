package service;

import bean.Observador;
import org.springframework.stereotype.Service;

import java.util.List;

public interface ObservadorService {

    void insertarObservador(Observador observador);

    List<Observador> getObservadores();

    Observador getObservadorPorId(int id);

}
