package ar.com.aguaMedina.repositories.interfaces;

import ar.com.aguaMedina.entities.ClientePersona;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_ClientePersonaRepository {
    
    void save(ClientePersona clientePersona);
    void remove(ClientePersona clientePersona);
    void remove(int id_clientePersona);
    void update(ClientePersona clientePersona);
    public List<ClientePersona> BuscadorGenerico(String string);
    List<ClientePersona> getAll();

    
/*Todos los métodos se apoyan en getAll(), ya que deberá estar implementado de forma obligatoria en la Clase que implmente 
la Interfaz. Es mas barato cargar toda la lista y filtrar, que realizar codigos que solo traigan el Elemento solicitado */
    
    default ClientePersona getById(int id){
        return  getAll()
                .stream()
                .filter(a->a.getId()==id)
                .findAny()
                .orElse(new ClientePersona ());
    }
    
    default List<ClientePersona>getLikeNombre(String nombre){
        if (nombre == null) return new ArrayList();
        return  getAll()
                .stream()
                .filter(a->a.getNombre().toLowerCase().contains(nombre.toLowerCase()))
                .collect(Collectors.toList()); //transforma los datos tipo String que devuelve el filtro en Lista. 
    }
    
    default List<ClientePersona>getLikeDireccion (String direccion){
        if (direccion == null) return new ArrayList();
        return  getAll()
                .stream()
                .filter(a->a.getDireccion().toLowerCase().contains(direccion.toLowerCase()))
                .collect(Collectors.toList()); //transforma los datos tipo String que devuelve el filtro en Lista. 
    }
    
    default List<ClientePersona>getLikeLocalidad (String localidad){
        if (localidad == null) return new ArrayList();
        return  getAll()
                .stream()
                .filter(a->a.getLocalidad().toLowerCase().contains(localidad.toLowerCase()))
                .collect(Collectors.toList()); //transforma los datos tipo String que devuelve el filtro en Lista. 
    }
    
    default List<ClientePersona>getLikeTipoServicio (String tipo_servicio){
        if (tipo_servicio == null) return new ArrayList();
        return  getAll()
                .stream()
                .filter(a->a.getTipo_servicio().toLowerCase().contains(tipo_servicio.toLowerCase()))
                .collect(Collectors.toList()); //transforma los datos tipo String que devuelve el filtro en Lista. 
    }
    
    default List<ClientePersona>getLikeRecorrido(int idRecorrido){
        return getAll()
                .stream()
                .filter(a->a.getIdRecorrido()==idRecorrido)
                .collect(Collectors.toList());
    }
    
}



