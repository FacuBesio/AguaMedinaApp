package ar.com.aguaMedina.test;

import ar.com.aguaMedina.entities.ClienteEmpresa;
import ar.com.aguaMedina.entities.ClientePersona;



public class TestEntities {
    
    public static void main(String[] args) {
        
        System.out.println("----- ClientesPersona -----");
        ClientePersona clientePersona1 = new ClientePersona("Maria Juana", "Villa Verde 248", "Lugares Santos", "1124845263",
                                                            "Bidones", 3, 0, 1000, 1, "mail@persona1.com", "24-05-22",
                                                            "DetallePersona1");
        System.out.println(clientePersona1);
        
        
       System.out.println("");
        System.out.println("----- ClientesEmpresa -----");
        ClienteEmpresa clienteEmpresa1 = new ClienteEmpresa("Construcciones SRL","27-28033514-8", "Villa Verde 248", 
                                                            "Lugares Santos", "1124845263", "Bidones", 3, 0, 1000, 1, 
                                                            "mail@empresa1.com", "24-05-22","DetalleEmpresa1");
        System.out.println(clienteEmpresa1);
    }
}
