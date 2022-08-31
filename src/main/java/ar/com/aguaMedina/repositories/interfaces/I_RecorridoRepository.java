package ar.com.aguaMedina.repositories.interfaces;

import ar.com.aguaMedina.entities.Recorrido;
import ar.com.aguaMedina.enums.Dia;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_RecorridoRepository {
    
    void save(Recorrido recorrido);             //insert
    void remove(Recorrido recorrido);           //delete
    void remove(int id_recorrido);
    void update(Recorrido recorrido);           //update
    public List<Recorrido> BuscadorGenerico(String string);
    List<Recorrido> getAll();                   //select
    
    default Recorrido getById(int id){
        if (getAll() == null || getAll().isEmpty()){
            return new Recorrido();
        }else{
        
            return  getAll()
                    .stream()
                    .filter(a->a.getId()==id)
                    .findAny()
                    .orElse(new Recorrido());
        }
    }                  
    
    default List<Recorrido>getLikeNombreZona(String nombreZona){
        if (nombreZona == null) return new ArrayList();
        return  getAll()
                .stream()
                .filter(a->a.getNombreZona().toLowerCase().contains(nombreZona.toLowerCase()))
                .collect(Collectors.toList());
    }
    
    default List<Recorrido>getLikeDia(String dia){
        if (dia == null) return new ArrayList();
        return  getAll()
                .stream()
                .filter(a->a.getDia().toString().toLowerCase().contains(dia.toLowerCase()))
                .collect(Collectors.toList());
    }
    
    default List<Recorrido>getLikeResponsableZona(String responsableZona){
        if (responsableZona == null) return new ArrayList();
        return  getAll()
                .stream()
                .filter(a->a.getResponsableZona().toLowerCase().contains(responsableZona.toLowerCase()))
                .collect(Collectors.toList());
    }
    
    default List<Recorrido>getLikeAsistenteZona(String asistenteZona){
        if (asistenteZona == null) return new ArrayList();
        List <Recorrido> list = getAll()
                                .stream()
                                .filter(a->a.getAsistenteZona()!=null)
                                .collect(Collectors.toList());
        return  list
                .stream()
                .filter(a->a.getAsistenteZona().toLowerCase().contains(asistenteZona.toLowerCase()))
                .collect(Collectors.toList());
    }
    
    
}
