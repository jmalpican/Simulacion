package dao;

import bean.Estacion;
import bean.Observador;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import java.util.List;

/**
 * Created by manueltejeda on 11/18/15.
 */
public interface ObservadorMapper {

    @Insert("INSERT INTO observador(id, nombre, dni, celular,"
            + "fijo, direccion, referencia, mail) VALUES"
            + "(#{id}, #{nombre}, #{dni}, #{celular}, #{fijo}, #{direccion},"
            + "#{referencia}, #{mail})")
    @SelectKey(
            keyProperty = "id",
            before = true,
            resultType = Integer.class,
            statement = { "SELECT observador_seq.nextval AS id FROM dual" })
    void insertarObservador(Observador observador);


    @Select("SELECT id, nombre, dni, fecha_ingreso as fechaIngreso FROM observador")
    List<Observador> getAll();

    @Select("SELECT id, nombre, dni, celular, fijo, direccion, referencia, mail, fecha_ingreso as fechaIngreso FROM observador WHERE id=#{id}")
    Observador getObservadorPorId(int id);
}
