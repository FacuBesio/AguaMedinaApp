package ar.com.aguaMedina.utils.html;

import ar.com.aguaMedina.connectors.Conector;
import ar.com.aguaMedina.entities.ClienteEmpresa;
import ar.com.aguaMedina.entities.ClientePersona;
import ar.com.aguaMedina.entities.Recorrido;
import ar.com.aguaMedina.repositories.interfaces.I_ClienteEmpresaRepository;
import ar.com.aguaMedina.repositories.interfaces.I_ClientePersonaRepository;
import ar.com.aguaMedina.repositories.interfaces.I_RecorridoRepository;
import ar.com.aguaMedina.repositories.jdbc.ClienteEmpresaRepository;
import ar.com.aguaMedina.repositories.jdbc.ClientePersonaRepository;
import ar.com.aguaMedina.repositories.jdbc.RecorridoRepository;
import java.util.ArrayList;
import java.util.List;

public class HtmlTable_Recorrido {

    public static String tabla_Recorridos(){
        
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Zona</th>";
                    table += "<th>Dia</th>";
                    table += "<th>Responsable</th>";
                    table += "<th>Asistente</th>";
                    table += "<th>Personas</th>";
                    table += "<th>Empresas</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                //</th>
                table += "</tr>";
                
            for(Recorrido r: re_rep.getAll()){
                List <ClientePersona> array_ClientesPersona_ConMismoRecorrido = new ArrayList();
                List <ClienteEmpresa> array_ClientesEmpresa_ConMismoRecorrido = new ArrayList();
                int bidones = 0;
                int maquinas = 0;
                long clientesPersona_cant = 0;
                long clientesEmpresa_cant = 0;
                
                table += "<tr>";
                    table += "<td>";
                        table += r.getId();
                    table += "</td>";
                    table += "<td>";
                        table += r.getNombreZona();
                    table += "</td>";
                    table += "<td>";
                        table += r.getDia().toString();
                    table += "</td>";
                    table += "<td>";
                        table += r.getResponsableZona();
                    table += "</td>";
                    table += "<td>";
                        table += r.getAsistenteZona();
                    table += "</td>";
                    table += "<td>";
                    for (ClientePersona p : cp_rep.getAll()){
                        if (p.getIdRecorrido() == r.getId()){
                            array_ClientesPersona_ConMismoRecorrido.add(p);
                            bidones = bidones + p.getBidones();
                            maquinas = maquinas + p.getMaquinas();
                        }
                    }
                    clientesPersona_cant = array_ClientesPersona_ConMismoRecorrido.stream().count();
                    array_ClientesPersona_ConMismoRecorrido.removeAll(array_ClientesPersona_ConMismoRecorrido);
                    table += clientesPersona_cant;
                    table += "</td>";
                    table += "<td>";
                        for (ClienteEmpresa e : ce_rep.getAll()){
                        if (e.getIdRecorrido() == r.getId()){
                            array_ClientesEmpresa_ConMismoRecorrido.add(e);
                            bidones = bidones + e.getBidones();
                            maquinas = maquinas + e.getMaquinas();
                        }
                    }
                    clientesEmpresa_cant = array_ClientesEmpresa_ConMismoRecorrido.stream().count();
                    
                    array_ClientesEmpresa_ConMismoRecorrido.removeAll(array_ClientesEmpresa_ConMismoRecorrido);
                    table += clientesEmpresa_cant;
                    table += "</td>";
                    table += "<td>";
                        table += bidones;
                    table += "</td>";
                    table += "<td>";
                        table += maquinas;
                    table += "</td>";
                table += "</tr>";
            }
            table += "</table>";
        return table;
    }
    
    public static String tabla_Personas_BuscadoGenerico(String buscador){
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Zona</th>";
                    table += "<th>Dia</th>";
                    table += "<th>Responsable</th>";
                    table += "<th>Asistente</th>";
                    table += "<th>Personas</th>";
                    table += "<th>Empresas</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                //</th>
                table += "</tr>";
                
                for(Recorrido r: re_rep.BuscadorGenerico(buscador)){
                List <ClientePersona> array_ClientesPersona_ConMismoRecorrido = new ArrayList();
                List <ClienteEmpresa> array_ClientesEmpresa_ConMismoRecorrido = new ArrayList();
                int bidones = 0;
                int maquinas = 0;
                long clientesPersona_cant = 0;
                long clientesEmpresa_cant = 0;
                
                table += "<tr>";
                    table += "<td>";
                        table += r.getId();
                    table += "</td>";
                    table += "<td>";
                        table += r.getNombreZona();
                    table += "</td>";
                    table += "<td>";
                        table += r.getDia().toString();
                    table += "</td>";
                    table += "<td>";
                        table += r.getResponsableZona();
                    table += "</td>";
                    table += "<td>";
                        table += r.getAsistenteZona();
                    table += "</td>";
                    table += "<td>";
                    for (ClientePersona p : cp_rep.getAll()){
                        if (p.getIdRecorrido() == r.getId()){
                            array_ClientesPersona_ConMismoRecorrido.add(p);
                            bidones = bidones + p.getBidones();
                            maquinas = maquinas + p.getMaquinas();
                        }
                    }
                    clientesPersona_cant = array_ClientesPersona_ConMismoRecorrido.stream().count();
                    array_ClientesPersona_ConMismoRecorrido.removeAll(array_ClientesPersona_ConMismoRecorrido);
                    table += clientesPersona_cant;
                    table += "</td>";
                    table += "<td>";
                        for (ClienteEmpresa e : ce_rep.getAll()){
                        if (e.getIdRecorrido() == r.getId()){
                            array_ClientesEmpresa_ConMismoRecorrido.add(e);
                            bidones = bidones + e.getBidones();
                            maquinas = maquinas + e.getMaquinas();
                        }
                    }
                    clientesEmpresa_cant = array_ClientesEmpresa_ConMismoRecorrido.stream().count();
                    
                    array_ClientesEmpresa_ConMismoRecorrido.removeAll(array_ClientesEmpresa_ConMismoRecorrido);
                    table += clientesEmpresa_cant;
                    table += "</td>";
                    table += "<td>";
                        table += bidones;
                    table += "</td>";
                    table += "<td>";
                        table += maquinas;
                    table += "</td>";
                table += "</tr>";
            }
            table += "</table>";
        return table;
    }
    
    public static String tabla_RecorridosLikeNombreZona(String buscador){
        
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Zona</th>";
                    table += "<th>Dia</th>";
                    table += "<th>Responsable</th>";
                    table += "<th>Asistente</th>";
                    table += "<th>Personas</th>";
                    table += "<th>Empresas</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                //</th>
                table += "</tr>";
                
            for(Recorrido r: re_rep.getLikeNombreZona(buscador)){
                List <ClientePersona> array_ClientesPersona_ConMismoRecorrido = new ArrayList();
                List <ClienteEmpresa> array_ClientesEmpresa_ConMismoRecorrido = new ArrayList();
                int bidones = 0;
                int maquinas = 0;
                long clientesPersona_cant = 0;
                long clientesEmpresa_cant = 0;
                
                table += "<tr>";
                    table += "<td>";
                        table += r.getId();
                    table += "</td>";
                    table += "<td>";
                        table += r.getNombreZona();
                    table += "</td>";
                    table += "<td>";
                        table += r.getDia().toString();
                    table += "</td>";
                    table += "<td>";
                        table += r.getResponsableZona();
                    table += "</td>";
                    table += "<td>";
                        table += r.getAsistenteZona();
                    table += "</td>";
                    table += "<td>";
                    for (ClientePersona p : cp_rep.getAll()){
                        if (p.getIdRecorrido() == r.getId()){
                            array_ClientesPersona_ConMismoRecorrido.add(p);
                            bidones = bidones + p.getBidones();
                            maquinas = maquinas + p.getMaquinas();
                        }
                    }
                    clientesPersona_cant = array_ClientesPersona_ConMismoRecorrido.stream().count();
                    array_ClientesPersona_ConMismoRecorrido.removeAll(array_ClientesPersona_ConMismoRecorrido);
                    table += clientesPersona_cant;
                    table += "</td>";
                    table += "<td>";
                        for (ClienteEmpresa e : ce_rep.getAll()){
                        if (e.getIdRecorrido() == r.getId()){
                            array_ClientesEmpresa_ConMismoRecorrido.add(e);
                            bidones = bidones + e.getBidones();
                            maquinas = maquinas + e.getMaquinas();
                        }
                    }
                    clientesEmpresa_cant = array_ClientesEmpresa_ConMismoRecorrido.stream().count();
                    
                    array_ClientesEmpresa_ConMismoRecorrido.removeAll(array_ClientesEmpresa_ConMismoRecorrido);
                    table += clientesEmpresa_cant;
                    table += "</td>";
                    table += "<td>";
                        table += bidones;
                    table += "</td>";
                    table += "<td>";
                        table += maquinas;
                    table += "</td>";
                table += "</tr>";
            }
            table += "</table>";
        return table;
    }
    
    
     public static String tabla_RecorridosLikeDia(String buscador){
        
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Zona</th>";
                    table += "<th>Dia</th>";
                    table += "<th>Responsable</th>";
                    table += "<th>Asistente</th>";
                    table += "<th>Personas</th>";
                    table += "<th>Empresas</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                //</th>
                table += "</tr>";
                
            for(Recorrido r: re_rep.getLikeDia(buscador)){
                List <ClientePersona> array_ClientesPersona_ConMismoRecorrido = new ArrayList();
                List <ClienteEmpresa> array_ClientesEmpresa_ConMismoRecorrido = new ArrayList();
                int bidones = 0;
                int maquinas = 0;
                long clientesPersona_cant = 0;
                long clientesEmpresa_cant = 0;
                
                table += "<tr>";
                    table += "<td>";
                        table += r.getId();
                    table += "</td>";
                    table += "<td>";
                        table += r.getNombreZona();
                    table += "</td>";
                    table += "<td>";
                        table += r.getDia().toString();
                    table += "</td>";
                    table += "<td>";
                        table += r.getResponsableZona();
                    table += "</td>";
                    table += "<td>";
                        table += r.getAsistenteZona();
                    table += "</td>";
                    table += "<td>";
                    for (ClientePersona p : cp_rep.getAll()){
                        if (p.getIdRecorrido() == r.getId()){
                            array_ClientesPersona_ConMismoRecorrido.add(p);
                            bidones = bidones + p.getBidones();
                            maquinas = maquinas + p.getMaquinas();
                        }
                    }
                    clientesPersona_cant = array_ClientesPersona_ConMismoRecorrido.stream().count();
                    array_ClientesPersona_ConMismoRecorrido.removeAll(array_ClientesPersona_ConMismoRecorrido);
                    table += clientesPersona_cant;
                    table += "</td>";
                    table += "<td>";
                        for (ClienteEmpresa e : ce_rep.getAll()){
                        if (e.getIdRecorrido() == r.getId()){
                            array_ClientesEmpresa_ConMismoRecorrido.add(e);
                            bidones = bidones + e.getBidones();
                            maquinas = maquinas + e.getMaquinas();
                        }
                    }
                    clientesEmpresa_cant = array_ClientesEmpresa_ConMismoRecorrido.stream().count();
                    
                    array_ClientesEmpresa_ConMismoRecorrido.removeAll(array_ClientesEmpresa_ConMismoRecorrido);
                    table += clientesEmpresa_cant;
                    table += "</td>";
                    table += "<td>";
                        table += bidones;
                    table += "</td>";
                    table += "<td>";
                        table += maquinas;
                    table += "</td>";
                table += "</tr>";
            }
            table += "</table>";
        return table;
    }
     
    public static String tabla_RecorridosLikeResponsableZona(String buscador){
        
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Zona</th>";
                    table += "<th>Dia</th>";
                    table += "<th>Responsable</th>";
                    table += "<th>Asistente</th>";
                    table += "<th>Personas</th>";
                    table += "<th>Empresas</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                //</th>
                table += "</tr>";
                
            for(Recorrido r: re_rep.getLikeResponsableZona(buscador)){
                List <ClientePersona> array_ClientesPersona_ConMismoRecorrido = new ArrayList();
                List <ClienteEmpresa> array_ClientesEmpresa_ConMismoRecorrido = new ArrayList();
                int bidones = 0;
                int maquinas = 0;
                long clientesPersona_cant = 0;
                long clientesEmpresa_cant = 0;
                
                table += "<tr>";
                    table += "<td>";
                        table += r.getId();
                    table += "</td>";
                    table += "<td>";
                        table += r.getNombreZona();
                    table += "</td>";
                    table += "<td>";
                        table += r.getDia().toString();
                    table += "</td>";
                    table += "<td>";
                        table += r.getResponsableZona();
                    table += "</td>";
                    table += "<td>";
                        table += r.getAsistenteZona();
                    table += "</td>";
                    table += "<td>";
                    for (ClientePersona p : cp_rep.getAll()){
                        if (p.getIdRecorrido() == r.getId()){
                            array_ClientesPersona_ConMismoRecorrido.add(p);
                            bidones = bidones + p.getBidones();
                            maquinas = maquinas + p.getMaquinas();
                        }
                    }
                    clientesPersona_cant = array_ClientesPersona_ConMismoRecorrido.stream().count();
                    array_ClientesPersona_ConMismoRecorrido.removeAll(array_ClientesPersona_ConMismoRecorrido);
                    table += clientesPersona_cant;
                    table += "</td>";
                    table += "<td>";
                        for (ClienteEmpresa e : ce_rep.getAll()){
                        if (e.getIdRecorrido() == r.getId()){
                            array_ClientesEmpresa_ConMismoRecorrido.add(e);
                            bidones = bidones + e.getBidones();
                            maquinas = maquinas + e.getMaquinas();
                        }
                    }
                    clientesEmpresa_cant = array_ClientesEmpresa_ConMismoRecorrido.stream().count();
                    
                    array_ClientesEmpresa_ConMismoRecorrido.removeAll(array_ClientesEmpresa_ConMismoRecorrido);
                    table += clientesEmpresa_cant;
                    table += "</td>";
                    table += "<td>";
                        table += bidones;
                    table += "</td>";
                    table += "<td>";
                        table += maquinas;
                    table += "</td>";
                table += "</tr>";
            }
            table += "</table>";
        return table;
    }
    
    
    public static String tabla_RecorridosLikeAsistenteZona(String buscador){
        
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        String table = "<table>";
                table += "<tr>";
                //<th>
                    table += "<th>Id</th>";
                    table += "<th>Zona</th>";
                    table += "<th>Dia</th>";
                    table += "<th>Responsable</th>";
                    table += "<th>Asistente</th>";
                    table += "<th>Personas</th>";
                    table += "<th>Empresas</th>";
                    table += "<th>Bidones</th>";
                    table += "<th>Maq</th>";
                //</th>
                table += "</tr>";
                
            for(Recorrido r: re_rep.getLikeAsistenteZona(buscador)){
                List <ClientePersona> array_ClientesPersona_ConMismoRecorrido = new ArrayList();
                List <ClienteEmpresa> array_ClientesEmpresa_ConMismoRecorrido = new ArrayList();
                int bidones = 0;
                int maquinas = 0;
                long clientesPersona_cant = 0;
                long clientesEmpresa_cant = 0;
                
                table += "<tr>";
                    table += "<td>";
                        table += r.getId();
                    table += "</td>";
                    table += "<td>";
                        table += r.getNombreZona();
                    table += "</td>";
                    table += "<td>";
                        table += r.getDia().toString();
                    table += "</td>";
                    table += "<td>";
                        table += r.getResponsableZona();
                    table += "</td>";
                    table += "<td>";
                        table += r.getAsistenteZona();
                    table += "</td>";
                    table += "<td>";
                    for (ClientePersona p : cp_rep.getAll()){
                        if (p.getIdRecorrido() == r.getId()){
                            array_ClientesPersona_ConMismoRecorrido.add(p);
                            bidones = bidones + p.getBidones();
                            maquinas = maquinas + p.getMaquinas();
                        }
                    }
                    clientesPersona_cant = array_ClientesPersona_ConMismoRecorrido.stream().count();
                    array_ClientesPersona_ConMismoRecorrido.removeAll(array_ClientesPersona_ConMismoRecorrido);
                    table += clientesPersona_cant;
                    table += "</td>";
                    table += "<td>";
                        for (ClienteEmpresa e : ce_rep.getAll()){
                        if (e.getIdRecorrido() == r.getId()){
                            array_ClientesEmpresa_ConMismoRecorrido.add(e);
                            bidones = bidones + e.getBidones();
                            maquinas = maquinas + e.getMaquinas();
                        }
                    }
                    clientesEmpresa_cant = array_ClientesEmpresa_ConMismoRecorrido.stream().count();
                    
                    array_ClientesEmpresa_ConMismoRecorrido.removeAll(array_ClientesEmpresa_ConMismoRecorrido);
                    table += clientesEmpresa_cant;
                    table += "</td>";
                    table += "<td>";
                        table += bidones;
                    table += "</td>";
                    table += "<td>";
                        table += maquinas;
                    table += "</td>";
                table += "</tr>";
            }
            table += "</table>";
        return table;
    }
    
    
}
