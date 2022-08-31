package ar.com.aguaMedina.utils.html;

import ar.com.aguaMedina.connectors.Conector;
import ar.com.aguaMedina.entities.ClientePersona;
import ar.com.aguaMedina.entities.Recorrido;
import ar.com.aguaMedina.repositories.interfaces.I_ClientePersonaRepository;
import ar.com.aguaMedina.repositories.interfaces.I_RecorridoRepository;
import ar.com.aguaMedina.repositories.jdbc.ClientePersonaRepository;
import ar.com.aguaMedina.repositories.jdbc.RecorridoRepository;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class HtmlTable_ClientePersona {

    
    public static String tabla_ClientesPersona(){
        
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                    table += "<th>Id</th>";
                    table += "<th>Nombre</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                table += "</tr>";
                
            for(ClientePersona c: cp_rep.getAll()){
                table += "<tr>";
                    table += "<td>";
                        table += c.getId();
                    table += "</td>";
                    table += "<td>";
                        table += c.getNombre();
                    table += "</td>";
                    Recorrido recorrido = re_rep.getById(c.getIdRecorrido());
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += c.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += c.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += c.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += c.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(c.getMaquinas()>0){
                            table += c.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getPrecio();
                    table += "</td>";
                    
                    table += "<td>";
                        table += c.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += c.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(c.getDetalles() == null || c.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += c.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }
        table += "</table>";
        return table;
    }
    
    public static String tabla_Personas_BuscadoGenerico(String buscador){
        
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Nombre</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";


            for(ClientePersona c: cp_rep.BuscadorGenerico(buscador)){
                table += "<tr>";
                    table += "<td>";
                        table += c.getId();
                    table += "</td>";
                    table += "<td>";
                        table += c.getNombre();
                    table += "</td>";
                    Recorrido recorrido = re_rep.getById(c.getIdRecorrido());
                    
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += c.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += c.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += c.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += c.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(c.getMaquinas()>0){
                            table += c.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getPrecio();
                    table += "</td>";
                    table += "<td>";
                        table += c.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += c.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(c.getDetalles() == null || c.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += c.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }

            table += "</table>";
        return table;
    }
    
    public static String tabla_ClientesPersonaLikeNombre(String buscador){
        
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Nombre</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";


            for(ClientePersona c: cp_rep.getLikeNombre(buscador)){
                table += "<tr>";
                    table += "<td>";
                        table += c.getId();
                    table += "</td>";
                    table += "<td>";
                        table += c.getNombre();
                    table += "</td>";
                    Recorrido recorrido = re_rep.getById(c.getIdRecorrido());
                    
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += c.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += c.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += c.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += c.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(c.getMaquinas()>0){
                            table += c.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getPrecio();
                    table += "</td>";
                    table += "<td>";
                        table += c.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += c.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(c.getDetalles() == null || c.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += c.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }

            table += "</table>";
        return table;
    }
           

    
    
    
    public static String tabla_ClientesPersonaLikeDireccion(String buscador){
        
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Nombre</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";


            for(ClientePersona c: cp_rep.getLikeDireccion(buscador)){
                table += "<tr>";
                    table += "<td>";
                        table += c.getId();
                    table += "</td>";
                    table += "<td>";
                        table += c.getNombre();
                    table += "</td>";
                    Recorrido recorrido = re_rep.getById(c.getIdRecorrido());
                    
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += c.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += c.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += c.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += c.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(c.getMaquinas()>0){
                            table += c.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getPrecio();
                    table += "</td>";
                    table += "<td>";
                        table += c.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += c.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(c.getDetalles() == null || c.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += c.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }
            table += "</table>";
        return table;
    }
    
    public static String tabla_ClientesPersonaLikeLocalidad(String buscador){
        
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Nombre</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";


            for(ClientePersona c: cp_rep.getLikeLocalidad(buscador)){
                table += "<tr>";
                    table += "<td>";
                        table += c.getId();
                    table += "</td>";
                    table += "<td>";
                        table += c.getNombre();
                    table += "</td>";
                    Recorrido recorrido = re_rep.getById(c.getIdRecorrido());
                    
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += c.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += c.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += c.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += c.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(c.getMaquinas()>0){
                            table += c.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getPrecio();
                    table += "</td>";
                    table += "<td>";
                        table += c.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += c.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(c.getDetalles() == null || c.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += c.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }
            table += "</table>";
        return table;
    }
    
    public static String tabla_ClientesPersonaLikeTipoServicio(String buscador){
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Nombre</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";


            for(ClientePersona c: cp_rep.getLikeTipoServicio(buscador)){
                  table += "<tr>";
                    table += "<td>";
                        table += c.getId();
                    table += "</td>";
                    table += "<td>";
                        table += c.getNombre();
                    table += "</td>";
                    Recorrido recorrido = re_rep.getById(c.getIdRecorrido());
                    
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += c.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += c.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += c.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += c.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(c.getMaquinas()>0){
                            table += c.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getPrecio();
                    table += "</td>";
                    table += "<td>";
                        table += c.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += c.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(c.getDetalles() == null || c.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += c.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }
            table += "</table>";
        return table;
    }
    
    public static String tabla_ClientesPersonaRecorrido(int buscador){
        
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Nombre</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";


            for(ClientePersona c: cp_rep.getLikeRecorrido(buscador)){
                table += "<tr>";
                    table += "<td>";
                        table += c.getId();
                    table += "</td>";
                    table += "<td>";
                        table += c.getNombre();
                    table += "</td>";
                    Recorrido recorrido = re_rep.getById(c.getIdRecorrido());
                    
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += c.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += c.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += c.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += c.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(c.getMaquinas()>0){
                            table += c.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getPrecio();
                    table += "</td>";
                    table += "<td>";
                        table += c.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += c.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(c.getDetalles() == null || c.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += c.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }
            table += "</table>";
        return table;
    }
    
    public static String tabla_ClientesPersonaDia(String dia){
        
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        List <Recorrido> recorridos_Dia  = new ArrayList();
        List <ClientePersona> clientesPersona_Dia = new ArrayList();
        recorridos_Dia =  re_rep.getAll()
                                        .stream()
                                        .filter(a->a.getDia().toString().equalsIgnoreCase(dia))
                                        .collect(Collectors.toList());
        for (Recorrido r : recorridos_Dia){
            for (ClientePersona p : cp_rep.getAll()){
                if (p.getIdRecorrido() == r.getId()){
                    clientesPersona_Dia.add(p);
                }
            }
        }
        
        
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Nombre</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";


            for(ClientePersona c: clientesPersona_Dia){
                table += "<tr>";
                    table += "<td>";
                        table += c.getId();
                    table += "</td>";
                    table += "<td>";
                        table += c.getNombre();
                    table += "</td>";
                    Recorrido recorrido = re_rep.getById(c.getIdRecorrido());
                    
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += c.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += c.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += c.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += c.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(c.getMaquinas()>0){
                            table += c.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += c.getPrecio();
                    table += "</td>";
                    table += "<td>";
                        table += c.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += c.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(c.getDetalles() == null || c.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += c.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }
            table += "</table>";
        return table;
    }
}
