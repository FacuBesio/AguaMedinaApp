package ar.com.aguaMedina.entities;

public class ClientePersona {

    private int id;//id int auto_increment primary key,
    private String nombre; //nombre varchar(25) not null,
    private String direccion; //direccion varchar(25) not null,
    private String localidad; //localidad varchar(25) not null,
    private String contacto; //contacto varchar(25) not null,
    private String tipo_servicio; // tipo_servicio varchar(25) not null,
    private int bidones; //bidones int not null,
    private int maquinas; //maquinas int not null,
    private int precio; //precio int,
    private int idRecorrido; //idRecorrido int not null
    private String mail;//mail varchar(50),
    private String fecha_alta; //fecha_alta varchar(50),
    private String detalles;// detalles varchar(100)

    public ClientePersona() {
    }

    public ClientePersona(String nombre, String direccion, String localidad, String contacto, String tipo_servicio, int bidones, int maquinas, int precio, int idRecorrido, String mail, String fecha_alta, String detalles) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.localidad = localidad;
        this.contacto = contacto;
        this.tipo_servicio = tipo_servicio;
        this.bidones = bidones;
        this.maquinas = maquinas;
        this.precio = precio;
        this.idRecorrido = idRecorrido;
        this.mail = mail;
        this.fecha_alta = fecha_alta;
        this.detalles = detalles;
    }

    public ClientePersona(int id, String nombre, String direccion, String localidad, String contacto, String tipo_servicio, int bidones, int maquinas, int precio, int idRecorrido, String mail, String fecha_alta, String detalles) {
        this.id = id;
        this.nombre = nombre;
        this.direccion = direccion;
        this.localidad = localidad;
        this.contacto = contacto;
        this.tipo_servicio = tipo_servicio;
        this.bidones = bidones;
        this.maquinas = maquinas;
        this.precio = precio;
        this.idRecorrido = idRecorrido;
        this.mail = mail;
        this.fecha_alta = fecha_alta;
        this.detalles = detalles;
    }

    @Override
    public String toString() {
        return "ClientePersona{" + "id=" + id + ", nombre=" + nombre + ", direccion=" + direccion + ", localidad=" + localidad + ", contacto=" + contacto + ", tipo_servicio=" + tipo_servicio + ", bidones=" + bidones + ", maquinas=" + maquinas + ", precio=" + precio + ", idRecorrido=" + idRecorrido + ", mail=" + mail + ", fecha_alta=" + fecha_alta + ", detalles=" + detalles + '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }

    public String getTipo_servicio() {
        return tipo_servicio;
    }

    public void setTipo_servicio(String tipo_servicio) {
        this.tipo_servicio = tipo_servicio;
    }

    public int getBidones() {
        return bidones;
    }

    public void setBidones(int bidones) {
        this.bidones = bidones;
    }

    public int getMaquinas() {
        return maquinas;
    }

    public void setMaquinas(int maquinas) {
        this.maquinas = maquinas;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getIdRecorrido() {
        return idRecorrido;
    }

    public void setIdRecorrido(int idRecorrido) {
        this.idRecorrido = idRecorrido;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getFecha_alta() {
        return fecha_alta;
    }

    public void setFecha_alta(String fecha_alta) {
        this.fecha_alta = fecha_alta;
    }

    public String getDetalles() {
        return detalles;
    }

    public void setDetalles(String detalles) {
        this.detalles = detalles;
    }

    
}
