package ar.com.aguaMedina.entities;

import ar.com.aguaMedina.enums.Dia;

public class Recorrido {
    private int id;                 //    id int auto_increment primary key,
    private String nombreZona;      //    nombreZona varchar(25) not null,
    private Dia dia;                //    dia enum('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES','SABADO'),
    private String responsableZona; //    responsable varchar(25) not null,
    private String asistenteZona;   //    asistente varchar(25) not null

    public Recorrido() {
    }

    public Recorrido(String nombreZona, Dia dia, String responsableZona) {
        this.nombreZona = nombreZona;
        this.dia = dia;
        this.responsableZona = responsableZona;
    }

    public Recorrido(String nombreZona, Dia dia, String responsableZona, String asistenteZona) {
        this.nombreZona = nombreZona;
        this.dia = dia;
        this.responsableZona = responsableZona;
        this.asistenteZona = asistenteZona;
    }

    public Recorrido(int id, String nombreZona, Dia dia, String responsableZona, String asistenteZona) {
        this.id = id;
        this.nombreZona = nombreZona;
        this.dia = dia;
        this.responsableZona = responsableZona;
        this.asistenteZona = asistenteZona;
    }

    @Override
    public String toString() {
        return "Recorrido{" + "id=" + id + ", nombreZona=" + nombreZona + ", dia=" + dia + ", responsableZona=" + responsableZona + ", asistenteZona=" + asistenteZona + '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreZona() {
        return nombreZona;
    }

    public void setNombreZona(String nombreZona) {
        this.nombreZona = nombreZona;
    }

    public Dia getDia() {
        return dia;
    }

    public void setDia(Dia dia) {
        this.dia = dia;
    }

    public String getResponsableZona() {
        return responsableZona;
    }

    public void setResponsableZona(String responsableZona) {
        this.responsableZona = responsableZona;
    }

    public String getAsistenteZona() {
        return asistenteZona;
    }

    public void setAsistenteZona(String asistenteZona) {
        this.asistenteZona = asistenteZona;
    }
    
    
    
    
}
