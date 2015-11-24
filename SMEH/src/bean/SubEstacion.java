package bean;

import java.io.Serializable;

public class SubEstacion implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer codigo_sub;
	private String descripcion;
	private Integer clasificacionId;
	
	

	public Integer getCodigo_sub() {
		return codigo_sub;
	}
	public void setCodigo_sub(Integer codigo_sub) {
		this.codigo_sub = codigo_sub;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Integer getClasificacionId() {
		return clasificacionId;
	}
	public void setClasificacionId(Integer clasificacionId) {
		this.clasificacionId = clasificacionId;
	}
	
}
