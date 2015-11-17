package dao;

import bean.Estacion;
import bean.Observador;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ObservadorDao {

    @Select("select id, nombre, dni, fecha_ingreso as fechaIngreso from OBSERVADOR")
    List<Observador> getListAll();

}
