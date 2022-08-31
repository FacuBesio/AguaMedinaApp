package ar.com.aguaMedina.test;

import ar.com.aguaMedina.connectors.Conector;
import ar.com.aguaMedina.entities.ClientePersona;
import ar.com.aguaMedina.entities.Recorrido;
import ar.com.aguaMedina.repositories.interfaces.I_ClientePersonaRepository;
import ar.com.aguaMedina.repositories.interfaces.I_RecorridoRepository;
import ar.com.aguaMedina.repositories.jdbc.ClientePersonaRepository;
import ar.com.aguaMedina.repositories.jdbc.RecorridoRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public class Test { 
    
    public static void main(String[] args) {
        
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
    
        ClientePersonaRepository p = new ClientePersonaRepository(Conector.getConecction()); 
        
        
        List <ClientePersona> array_ClientesPersona = new ArrayList();
        
        array_ClientesPersona = p.BuscadorGenerico("che");
        
        //array_ClientesPersona.forEach(System.out::println);
        
        System.out.println(". --- set1_TreeSet <Object> Orden natural (alfabético) ---");
        Set<Object> set1_TreeSet = new TreeSet();
//        
//        set1_TreeSet.add("Lunes");
//        set1_TreeSet.add("Martes");
//        set1_TreeSet.add("Lunes");
//        set1_TreeSet.add("Miercoles");
//        set1_TreeSet.add("Jueves");
//        set1_TreeSet.add("Viernes");

//        set1_TreeSet.forEach(System.out::println);
        
        System.out.println("");
        System.out.println("PRUEBA TREESET:");
        //Set<Object> lista_asistente = new TreeSet(); 
        for(Recorrido r: re_rep.getAll()){
        set1_TreeSet.add(r.getAsistenteZona().toLowerCase());
        }
        
        set1_TreeSet.forEach(System.out::println);
//        for(Object asistente: set1_TreeSet){
//            System.out.println(asistente);
//        }
        
        
        
    }
    
}