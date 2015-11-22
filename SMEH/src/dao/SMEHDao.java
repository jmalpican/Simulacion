package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import bean.Combo;
import bean.Metadatos;
import bean.Responsable;
import bean.Usuario;

@Component
public interface SMEHDao {
	
	@Select("Select UYC_USUARIO as usuario, UYC_CLAVE as clave from Login where UYC_USUARIO = #{usuario}  and UYC_CLAVE = #{clave}")
	Usuario autenticar(Usuario usuario);

	@Select("select m.id_metadatos as idMetadatos, m.RDM_FECHA as fecha, m.RDM_AUTORIZAC as autorizado,m.id_motivo as idMotivo, mo.descripcion as motivo, m.RDM_RESP as idResp, r.nombre || ' ' || r.apellidos as nombreCompleto from METADATOS m left join responsable r on m.RDM_RESP = r.id_Resp left join motivo mo on m.id_motivo = mo.codigo")
	List<Metadatos> getListAll();
	
	@Select("SELECT ID_RESP as idResp, nombre, apellidos as apellido FROM RESPONSABLE")
	List<Responsable> getListAllResponsable();

	@Select("SELECT codigo, descripcion FROM motivo")
	List<Combo> getListAllMotivo();

	@Update("UPDATE METADATOS SET RDM_RESP=#{idResp}, ID_MOTIVO=#{idMotivo} WHERE id_metadatos = #{idMetadatos}")
	void actualizarMetadatos(Metadatos metadatos);

	@Insert("INSERT INTO ${tabla} (descripcion ) VALUES (#{descripcion} )")
	void guardarCombo(Combo combo);

}
