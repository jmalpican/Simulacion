package bean;

import java.io.Serializable;

public class SubEstacion2 implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer codigo_sub2;
	private String descripcion;
	private Integer codigoSub;
	
	

	public Integer getCodigo_sub2() {
		return codigo_sub2;
	}
	public void setCodigo_sub2(Integer codigo_sub2) {
		this.codigo_sub2 = codigo_sub2;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Integer getCodigoSub() {
		return codigoSub;
	}
	public void setCodigoSub(Integer codigoSub) {
		this.codigoSub = codigoSub;
	}

	
	
	
}
