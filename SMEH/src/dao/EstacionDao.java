package dao;

import bean.Estacion;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface EstacionDao {

    @Select("select e.id, e.alias, e.nombre, e.cod_senamhi as codSenamhi from ESTACION e")
    List<Estacion> getListAll();

}
