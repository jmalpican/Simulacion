package bean;

public class Estacion {

    private Integer id;
    private String nombre;
    private String alias;
    private String codSenamhi;
    private String codOmn;
    private String codOtro;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCodSenamhi() {
        return codSenamhi;
    }

    public void setCodSenamhi(String codSenamhi) {
        this.codSenamhi = codSenamhi;
    }

    public String getCodOmn() {
        return codOmn;
    }

    public void setCodOmn(String codOmn) {
        this.codOmn = codOmn;
    }

    public String getCodOtro() {
        return codOtro;
    }

    public void setCodOtro(String codOtro) {
        this.codOtro = codOtro;
    }
}

