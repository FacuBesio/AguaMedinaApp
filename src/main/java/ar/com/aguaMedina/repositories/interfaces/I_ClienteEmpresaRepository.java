package ar.com.aguaMedina.repositories.interfaces;

import ar.com.aguaMedina.entities.ClienteEmpresa;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_ClienteEmpresaRepository {
    
    void save(ClienteEmpresa clienteEmpresa);
    void remove(ClienteEmpresa clienteEmpresa);
    void remove(int id_clienteEmpresa);
    void update(ClienteEmpresa clienteEmpresa);
    public List<ClienteEmpresa> BuscadorGenerico(String string);
    List<ClienteEmpresa> getAll();
    
    default ClienteEmpresa getById(int id){
        return  getAll()
                .stream()
                .filter(a->a.getId()==id)
                .findAny()
                .orElse(new ClienteEmpresa ());
    }
    
    default List<ClienteEmpresa>getLikeRazonSocial(String razon_social){
        if (razon_social == null) return new ArrayList();
        return  getAll()
                .stream()
                .filter(a->a.getRazon_social().toLowerCase().contains(razon_social.toLowerCase()))
                .collect(Collectors.toList()); //transforma los datos tipo String que devuelve el filtro en Lista. 
    }
    
    default List<ClienteEmpresa>getLikeDireccion (String direccion){
        if (direccion == null) return new ArrayList();
        return  getAll()
                .stream()
                .filter(a->a.getDireccion().toLowerCase().contains(direccion.toLowerCase()))
                .collect(Collectors.toList()); //transforma los datos tipo String que devuelve el filtro en Lista. 
    }
    
    default List<ClienteEmpresa>getLikeLocalidad (String localidad){
        if (localidad == null) return new ArrayList();
        return  getAll()
                .stream()
                .filter(a->a.getLocalidad().toLowerCase().contains(localidad.toLowerCase()))
                .collect(Collectors.toList()); //transforma los datos tipo String que devuelve el filtro en Lista. 
    }
    
    default List<ClienteEmpresa>getLikeRecorrido(int idRecorrido){
        return getAll()
                .stream()
                .filter(a->a.getIdRecorrido()==idRecorrido)
                .collect(Collectors.toList());
    }
    
    default List<ClienteEmpresa>getLikeCuit(String cuit){
        if (cuit == null) return new ArrayList();
        return  getAll()
                .stream()
                .filter(a->a.getCuit().contains(cuit))
                .collect(Collectors.toList()); //transforma los datos tipo String que devuelve el filtro en Lista. 
    }
    
    default List<ClienteEmpresa>getLikeTipoServicio(String tipo_servicio){
        if (tipo_servicio == null) return new ArrayList();
        return  getAll()
                .stream()
                .filter(a->a.getTipo_servicio().toLowerCase().contains(tipo_servicio.toLowerCase()))
                .collect(Collectors.toList()); //transforma los datos tipo String que devuelve el filtro en Lista. 
    }
    
}
