package ar.com.aguaMedina.utils.html;

import ar.com.aguaMedina.connectors.Conector;
import ar.com.aguaMedina.entities.ClienteEmpresa;
import ar.com.aguaMedina.entities.Recorrido;
import ar.com.aguaMedina.repositories.interfaces.I_ClienteEmpresaRepository;
import ar.com.aguaMedina.repositories.interfaces.I_RecorridoRepository;
import ar.com.aguaMedina.repositories.jdbc.ClienteEmpresaRepository;
import ar.com.aguaMedina.repositories.jdbc.ClientePersonaRepository;
import ar.com.aguaMedina.repositories.jdbc.RecorridoRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class HtmlTable_ClienteEmpresa {
 
    public static String tabla_ClientesEmpresa(){
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Razon Social</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Cuit</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";
                
            for(ClienteEmpresa e: ce_rep.getAll()){
                table += "<tr>";
                    table += "<td>";
                        table += e.getId();
                    table += "</td>";
                    table += "<td>";
                        table += e.getRazon_social();
                    table += "</td>";
                    
                    Recorrido recorrido = re_rep.getById(e.getIdRecorrido());
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += e.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += e.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += e.getCuit();
                    table += "</td>";
                    table += "<td>";
                        table += e.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(e.getMaquinas()>0){
                            table += e.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getPrecio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += e.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(e.getDetalles() == null || e.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += e.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }
        table += "</table>";
        return table;
    }
    
    public static String tabla_Empresas_BuscadoGenerico(String buscador){
        
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Razon Social</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Cuit</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";


            for(ClienteEmpresa e: ce_rep.BuscadorGenerico(buscador)){
                table += "<tr>";
                    table += "<td>";
                        table += e.getId();
                    table += "</td>";
                    table += "<td>";
                        table += e.getRazon_social();
                    table += "</td>";
                    
                    Recorrido recorrido = re_rep.getById(e.getIdRecorrido());
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += e.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += e.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += e.getCuit();
                    table += "</td>";
                    table += "<td>";
                        table += e.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(e.getMaquinas()>0){
                            table += e.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getPrecio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += e.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(e.getDetalles() == null || e.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += e.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }
        table += "</table>";
        return table;
    }

    public static String tabla_ClientesEmpresaLikeRazonSocial(String buscador){
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Razon Social</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Cuit</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";
            for(ClienteEmpresa e: ce_rep.getLikeRazonSocial(buscador)){
                table += "<tr>";
                    table += "<td>";
                        table += e.getId();
                    table += "</td>";
                    table += "<td>";
                        table += e.getRazon_social();
                    table += "</td>";
                    
                    Recorrido recorrido = re_rep.getById(e.getIdRecorrido());
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += e.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += e.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += e.getCuit();
                    table += "</td>";
                    table += "<td>";
                        table += e.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(e.getMaquinas()>0){
                            table += e.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getPrecio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += e.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(e.getDetalles() == null || e.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += e.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }
        table += "</table>";
        return table;
    }
    
    
    public static String tabla_ClientesEmpresaLikeCuit(String buscador){
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Razon Social</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Cuit</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";
            for(ClienteEmpresa e: ce_rep.getLikeCuit(buscador)){
                table += "<tr>";
                    table += "<td>";
                        table += e.getId();
                    table += "</td>";
                    table += "<td>";
                        table += e.getRazon_social();
                    table += "</td>";
                    
                    Recorrido recorrido = re_rep.getById(e.getIdRecorrido());
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += e.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += e.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += e.getCuit();
                    table += "</td>";
                    table += "<td>";
                        table += e.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(e.getMaquinas()>0){
                            table += e.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getPrecio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += e.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(e.getDetalles() == null || e.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += e.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }
        table += "</table>";
        return table;
    }
    
    
    public static String tabla_ClientesEmpresaLikeDireccion(String buscador){
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Razon Social</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Cuit</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";


            for(ClienteEmpresa e: ce_rep.getLikeDireccion(buscador)){
                 table += "<tr>";
                    table += "<td>";
                        table += e.getId();
                    table += "</td>";
                    table += "<td>";
                        table += e.getRazon_social();
                    table += "</td>";
                    Recorrido recorrido = re_rep.getById(e.getIdRecorrido());
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += e.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += e.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += e.getCuit();
                    table += "</td>";
                    table += "<td>";
                        table += e.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(e.getMaquinas()>0){
                            table += e.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getPrecio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += e.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(e.getDetalles() == null || e.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += e.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }
        table += "</table>";
        return table;
    }
    
    public static String tabla_ClientesEmpresaLikeLocalidad(String buscador){
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Razon Social</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Cuit</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";


            for(ClienteEmpresa e: ce_rep.getLikeLocalidad(buscador)){
                 table += "<tr>";
                    table += "<td>";
                        table += e.getId();
                    table += "</td>";
                    table += "<td>";
                        table += e.getRazon_social();
                    table += "</td>";
                    
                    Recorrido recorrido = re_rep.getById(e.getIdRecorrido());
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += e.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += e.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += e.getCuit();
                    table += "</td>";
                    table += "<td>";
                        table += e.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(e.getMaquinas()>0){
                            table += e.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getPrecio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += e.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(e.getDetalles() == null || e.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += e.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }
        table += "</table>";
        return table;
    }
    
    public static String tabla_ClientesEmpresaLikeTipoServicio(String buscador){
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Razon Social</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Cuit</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";


            for(ClienteEmpresa e: ce_rep.getLikeTipoServicio(buscador)){
                 table += "<tr>";
                    table += "<td>";
                        table += e.getId();
                    table += "</td>";
                    table += "<td>";
                        table += e.getRazon_social();
                    table += "</td>";
                    
                    Recorrido recorrido = re_rep.getById(e.getIdRecorrido());
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += e.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += e.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += e.getCuit();
                    table += "</td>";
                    table += "<td>";
                        table += e.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(e.getMaquinas()>0){
                            table += e.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getPrecio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += e.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(e.getDetalles() == null || e.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += e.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }
        table += "</table>";
        return table;
    }
    
    public static String tabla_ClientesEmpresaLikeRecorrido(int buscador){
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Razon Social</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Cuit</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";


            for(ClienteEmpresa e: ce_rep.getLikeRecorrido(buscador)){
                 table += "<tr>";
                    table += "<td>";
                        table += e.getId();
                    table += "</td>";
                    table += "<td>";
                        table += e.getRazon_social();
                    table += "</td>";
                     
                    Recorrido recorrido = re_rep.getById(e.getIdRecorrido());
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += e.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += e.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += e.getCuit();
                    table += "</td>";
                    table += "<td>";
                        table += e.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(e.getMaquinas()>0){
                            table += e.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getPrecio();
                    table += "</td>";
                   table += "<td>";
                        table += e.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += e.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(e.getDetalles() == null || e.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += e.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }
        table += "</table>";
        return table;
    }
    
    public static String tabla_ClientesEmpresaDia(String dia){
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        List <Recorrido> recorridos_Dia  = new ArrayList();
        List <ClienteEmpresa> clientesEmpresa_Dia = new ArrayList();
        recorridos_Dia =  re_rep.getAll()
                                        .stream()
                                        .filter(a->a.getDia().toString().equalsIgnoreCase(dia))
                                        .collect(Collectors.toList());
        for (Recorrido r : recorridos_Dia){
            for (ClienteEmpresa e : ce_rep.getAll()){
                if (e.getIdRecorrido() == r.getId()){
                    clientesEmpresa_Dia.add(e);
                }
            }
        }
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Razon Social</th>";
                    table += "<th>Recorrido</th>";
                    table += "<th>Dirección</th>";
                    table += "<th>Localidad</th>";
                    table += "<th>Contacto</th>";
                    table += "<th>Cuit</th>";
                    table += "<th>Servicio</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                    table += "<th>Precio ($)</th>";
                    table += "<th>Mail</th>";
                    table += "<th>Fecha Alta</th>";
                    table += "<th>Detalles</th>";
                //</th>
                table += "</tr>";


            for(ClienteEmpresa e: clientesEmpresa_Dia){
                table += "<tr>";
                    table += "<td>";
                        table += e.getId();
                    table += "</td>";
                    table += "<td>";
                        table += e.getRazon_social();
                    table += "</td>";
                    
                    Recorrido recorrido = re_rep.getById(e.getIdRecorrido());
                    table += "<td>";
                        if (recorrido.getId()!=0){
                            table +=    recorrido.getNombreZona()+", " 
                                        + recorrido.getDia().toString().toLowerCase();
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getDireccion();
                    table += "</td>";
                    table += "<td>";
                        table += e.getLocalidad();
                    table += "</td>";
                    table += "<td>";
                        table += e.getContacto();
                    table += "</td>";
                    table += "<td>";
                        table += e.getCuit();
                    table += "</td>";
                    table += "<td>";
                        table += e.getTipo_servicio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getBidones();
                    table += "</td>";
                    table += "<td>";
                        if(e.getMaquinas()>0){
                            table += e.getMaquinas();
                        }else{
                            table += "-";
                        }
                    table += "</td>";
                    table += "<td>";
                        table += e.getPrecio();
                    table += "</td>";
                    table += "<td>";
                        table += e.getMail();
                    table += "</td>";
                    table += "<td>";
                        table += e.getFecha_alta();
                    table += "</td>";
                    table += "<td>";
                        if(e.getDetalles() == null || e.getDetalles().isEmpty()){
                            table += "-";
                        }else{
                            table += e.getDetalles();
                        }
                    table += "</td>";
                table += "</tr>";
            }
        table += "</table>";
        return table;
    }
}

