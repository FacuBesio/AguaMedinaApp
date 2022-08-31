// ● JAVA 2 Standard 11 Web Programming - CLASE 6 - CARLOS RIOS
package ar.com.aguaMedina.test;


import ar.com.aguaMedina.connectors.Conector;
import ar.com.aguaMedina.entities.ClienteEmpresa;
import ar.com.aguaMedina.entities.ClientePersona;
import ar.com.aguaMedina.entities.Recorrido;
import ar.com.aguaMedina.enums.Dia;
import ar.com.aguaMedina.repositories.interfaces.I_ClienteEmpresaRepository;
import ar.com.aguaMedina.repositories.interfaces.I_ClientePersonaRepository;
import ar.com.aguaMedina.repositories.interfaces.I_RecorridoRepository;
import ar.com.aguaMedina.repositories.jdbc.ClienteEmpresaRepository;
import ar.com.aguaMedina.repositories.jdbc.ClientePersonaRepository;
import ar.com.aguaMedina.repositories.jdbc.RecorridoRepository;
import java.util.ArrayList;
import java.util.List;

public class TestRepository {
    public static void main(String[] args) {
       
        System.out.println("-----------    Recorridos    -----------");
        
        I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());
        
        Recorrido recorrido1 = new Recorrido("Garin (Zona A)", Dia.Lunes , "Pablo", "Valentin"); 
        System.out.println(recorrido1);
        
        re_rep.save(recorrido1);
        System.out.println(recorrido1);
        
        System.out.println("");
        Recorrido recorrido6 = new Recorrido("Garin (Zona B)", Dia.Lunes , "Matias", "Facundo"); 
        re_rep.save(recorrido6);
        
        Recorrido recorrido2 = new Recorrido("Ing. Maschwitz", Dia.Martes, "Valentin"); 
        re_rep.save(recorrido2);
        
        Recorrido recorrido3 = new Recorrido("Benavidez", Dia.Martes, "Pablo"); 
        re_rep.save(recorrido3);
        
        Recorrido recorrido8 = new Recorrido("Escobar (Zona A)", Dia.Miercoles, "Pablo", "Facundo"); 
        re_rep.save(recorrido8);
        
        Recorrido recorrido9 = new Recorrido("Escobar (Zona B)", Dia.Miercoles, "Matias", "Valentin"); 
        re_rep.save(recorrido9);
        
        Recorrido recorrido4 = new Recorrido("Maquinista Savio", Dia.Jueves, "Valentin"); 
        re_rep.save(recorrido4);
        
        Recorrido recorrido10 = new Recorrido("Del Viso", Dia.Jueves, "Pablo"); 
        re_rep.save(recorrido10);
        
        Recorrido recorrido5 = new Recorrido("Garin (Zona C)", Dia.Viernes, "Pablo", "Valentin"); 
        re_rep.save(recorrido5);
        
        Recorrido recorrido7 = new Recorrido("Pilar", Dia.Sabados, "Matias", "Facundo"); 
        re_rep.save(recorrido7);
        
        re_rep.getAll().forEach(System.out::println);
        
        System.out.println("");
        System.out.println(". getLikeNombreZona(\"in\"):");
        re_rep.getLikeNombreZona("ari").forEach(System.out::println);
        
        System.out.println("");
        System.out.println(". getLikeDia(\"ie\"):");
        re_rep.getLikeDia("ie").forEach(System.out::println);
        
        System.out.println("");
        System.out.println(". getLikeResponsableZona((\"pablo\"):");
        re_rep.getLikeResponsableZona("pablo").forEach(System.out::println);
        
        System.out.println("");
        System.out.println(". getLikeAsistenteZona(\"valentin\"):");
        re_rep.getLikeAsistenteZona("valen").forEach(System.out::println);
        
        System.out.println("");
        System.out.println(". getById(4):");
        System.out.println(re_rep.getById(4));
        
     
        

//-----------------------------------------------------------------------------------------------------------------------------        

        System.out.println("");
        System.out.println("-----------    ClientesPersona    -----------");
        I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());
        
        ClientePersona clientePersona1 = new ClientePersona("Maria Juana", "Villa Verde 248", "Garin", "1123548796", 
                                                            "Bidon 20 lts", 3, 0, 1000, 1,"persona1@mail.com","24-05-22", 
                                                            "Testing Detalles Persona ");
        System.out.println(clientePersona1);
        
        cp_rep.save(clientePersona1);
        System.out.println(clientePersona1);
        
        ClientePersona clientePersona2 = new ClientePersona("Carlos Rios", "Masilla 1458", "Garin", "1132657485", 
                                                            "Servicio Agua", 4, 2, 1000, 2,"persona2@mail.com","24-05-22", 
                                                            "Testing Detalles Persona ");
        cp_rep.save(clientePersona2);
        
        ClientePersona clientePersona3 = new ClientePersona("Carla Conte", "Av. Libertador 2800", "Ing. Maschwitz", 
                                                            "1144526936", "Bidon 20 lts", 3, 0, 1000, 3,"persona3@mail.com","24-05-22", 
                                                            "Testing Detalles Persona ");
        cp_rep.save(clientePersona3);
        
        ClientePersona clientePersona4 = new ClientePersona("Mariano Juarez", "España 654", "Benavidez", "1128749356", 
                                                            "Bidon 12 lts", 2, 0, 1000, 4,"persona4@mail.com","24-05-22", 
                                                            "Testing Detalles Persona ");
        cp_rep.save(clientePersona4);
        
        ClientePersona clientePersona5 = new ClientePersona("Tamara Diaz", "Don Bosco 1004", "Escobar", "1125841298", 
                                                            "Servicio Agua", 4, 2, 1000, 5,"persona5@mail.com","24-05-22", 
                                                            "Testing Detalles Persona ");
        cp_rep.save(clientePersona5);
        
        ClientePersona clientePersona6 = new ClientePersona("Mariano Juarez", "España 654", "Escobar", "1128749356", 
                                                            "Servicio Agua", 2, 1, 1000, 6,"persona6@mail.com","24-05-22", 
                                                            "Testing Detalles Persona ");
        cp_rep.save(clientePersona6);
        
        ClientePersona clientePersona7 = new ClientePersona("Jorge Sanchez", "Honduras 423", "Maquinista Savio", "1128749356", 
                                                            "Bidon 20 lts", 3, 0, 1000, 7,"persona7@mail.com","24-05-22", 
                                                            "Testing Detalles Persona ");
        cp_rep.save(clientePersona7);
        
        ClientePersona clientePersona8 = new ClientePersona("Marta Lanata", "Nicaragua 839", "Del Viso", "1128749356", 
                                                            "Bidon 12 lts", 5, 0, 800, 8,"persona8@mail.com","24-05-22", 
                                                            "Testing Detalles Persona ");
        cp_rep.save(clientePersona8);
        
        ClientePersona clientePersona9 = new ClientePersona("Federico Guzman", "Paraguay 1293", "Garin", "1128749356", 
                                                            "Servicio Agua", 4, 1, 950, 9,"persona9@mail.com","24-05-22", 
                                                            "");
        cp_rep.save(clientePersona9);
        
        ClientePersona clientePersona10 = new ClientePersona("Silvia Martinez", "Arenales 1468", "Pilar", "1128749356", 
                                                            "Servicio Agua", 8, 2, 800, 10,"persona10@mail.com","24-05-22", 
                                                            "Testing Detalles Persona ");
        cp_rep.save(clientePersona10);
        
        ClientePersona clientePersona11 = new ClientePersona("Nahuel Perez", "Alvear 2621", "Garin", "1132657485", 
                                                            "Bidon 12 lts", 6, 0, 1000, 2,"persona11@mail.com","24-05-22", 
                                                            "");
        cp_rep.save(clientePersona11);
        
        ClientePersona clientePersona12 = new ClientePersona("Maria Jose Hernandez", "Chacabuco 2467", "Pilar", "1128749356", 
                                                            "Bidon 20 lts", 4, 0, 1000, 10,"persona12@mail.com","24-05-22", 
                                                            "Testing Detalles Persona ");
        cp_rep.save(clientePersona12);
        
        ClientePersona clientePersona13 = new ClientePersona("Roberto Jimenez", "Arias 888", "Pilar", "1128749356", 
                                                            "Servicio Agua", 5, 1, 850, 10,"persona13@mail.com","24-05-22", 
                                                            "Testing Detalles Persona ");
        cp_rep.save(clientePersona13);
        
        ClientePersona clientePersona14 = new ClientePersona("Matias Diaz", "Necochea 1846", "Escobar", "1125841298", 
                                                            "Servicio Agua", 8, 2, 900, 5,"persona13@mail.com","24-05-22", 
                                                            "Testing Detalles Persona ");
        cp_rep.save(clientePersona14);
        /*
        System.out.println("");
        cp_rep.getAll().forEach(System.out::println);
        
        System.out.println("");
        System.out.println("-----------    ClientesPersona Editar   -----------");
        
        ClientePersonaRepository_Editar cpEditar_rep = new ClientePersonaRepository_Editar(Conector.getConecction());
        
        ClientePersona_Editar clientePersona_editar1 = new ClientePersona_Editar
                                                ("Maria Juana", "Villa Verde 248", "Lugares Santos", "1123548796", 
                                                "Bidon", 3, 0, 1);
        cpEditar_rep.save(clientePersona_editar1);
        cpEditar_rep.getAll().forEach(System.out::println);
        
        ClientePersona_Editar clientePersona_editar2 = new ClientePersona_Editar
                                                (4,true,"Carlos Rios", "Masilla 1458", "Jose L. Suarez", "1132657485", 
                                                "Servicio Agua", 4, 2, 4);
        cpEditar_rep.save(clientePersona_editar2);
        cpEditar_rep.getAll().forEach(System.out::println);
        */
        
        
    //-----------------------------------------------------------------------------------------------------------------------------        

        System.out.println("");
        System.out.println("-----------    ClientesEmpresa    -----------");
        
        I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());
        
        ClienteEmpresa clienteEmpresa1 = new ClienteEmpresa("Construcciones SRL","27-28033514-8", "Av.Sobremonte 2480", 
                                                            "Garin", "1124845263", "Bidon 20 lts", 6, 0, 1000, 1, 
                                                            "construcciones@mail.com","24-05-22", "Testing Detalles Empresa 1");
        System.out.println(clienteEmpresa1);
        ce_rep.save(clienteEmpresa1);
        System.out.println(clienteEmpresa1);
        
        ClienteEmpresa clienteEmpresa2 = new ClienteEmpresa("CMP","27-24783512-8", "Av.Centenario 3651", 
                                                            "Garin", "1124845263", "Servicio Agua", 10, 2, 1000, 2,
                                                            "cmp@mail.com","24-05-22", "");
        ce_rep.save(clienteEmpresa2);
        
        ClienteEmpresa clienteEmpresa3 = new ClienteEmpresa("Hormetal","26-32755546-8", "Necochea 4321", 
                                                            "Ing. Maschwitz", "4845263", "Servicio Agua", 8, 2, 1000, 3,
                                                            "hormetal@mail.com","24-05-22", "Testing Detalles Empresa 3");
        ce_rep.save(clienteEmpresa3);
       
        ClienteEmpresa clienteEmpresa4 = new ClienteEmpresa("Viviero SA","28-51758346-8", "Carlos Casares 321", 
                                                            "Benavidez", "113245263", "Servicio Agua", 6, 2, 1000, 4,
                                                            "vivero@mail.com","24-05-22", "Testing Detalles Empresa 4");
        ce_rep.save(clienteEmpresa4);
        
        ClienteEmpresa clienteEmpresa5 = new ClienteEmpresa("Carniceria","27-22754446-4", "Ambrosoni 1222", 
                                                            "Escobar", "113245263", "Bidon 12 lts", 4, 1, 1000, 5,
                                                            "carniceria@mail.com","24-05-22", "");
        ce_rep.save(clienteEmpresa5);
        
        ClienteEmpresa clienteEmpresa6 = new ClienteEmpresa("Pescaderia SRL","27-36782447-5", "Simbron 2004", 
                                                            "Escobar", "113245263", "Servicio Agua", 10, 3, 1000, 6,
                                                            "pescaderia@mail.com","24-05-22", "Testing Detalles Empresa 6");
        ce_rep.save(clienteEmpresa6);
        
        ClienteEmpresa clienteEmpresa7 = new ClienteEmpresa("Estacionamiento","27-49782657-3", "Av. Libertador 1488", 
                                                            "Maquinista Savio", "113245263", "Bidon 20 lts", 1, 2, 1000, 7,
                                                            "estacionamiento@mail.com","24-05-22", "Testing Detalles Empresa 7");
        ce_rep.save(clienteEmpresa7);
        
        ClienteEmpresa clienteEmpresa8 = new ClienteEmpresa("Fabrica Colchones","26-29704657-3", "Av. Peron 3865", 
                                                            "Del Viso", "113245263", "Servicio Agua", 14, 3, 1000, 8,
                                                            "fabricaColchones@mail.com","24-05-22", "Testing Detalles Empresa 8");
        ce_rep.save(clienteEmpresa8);
        
        ClienteEmpresa clienteEmpresa9 = new ClienteEmpresa("Carpinteria Garin","28-94321654-8", "Crl. Diaz 95", 
                                                            "Garin", "113245263", "Servicio Agua", 15, 4, 1000,  9,
                                                            "carpinteriaGarin@mail.com","24-05-22", "");
        ce_rep.save(clienteEmpresa9);
        
        ClienteEmpresa clienteEmpresa10 = new ClienteEmpresa("Carpinteria Pilar","27-37321628-4", "Paraguay 3865", 
                                                            "Pilar", "113245263", "Servicio Agua", 10, 4, 1200, 10,
                                                            "carpinteriaPilar@mail.com","24-05-22", "Testing Detalles Empresa 10");
        ce_rep.save(clienteEmpresa10);
        
        ClienteEmpresa clienteEmpresa11 = new ClienteEmpresa("Fabrica de Pastas","27-31754546-6", "3 de Febrero 422", 
                                                            "Escobar", "113245263", "Bidon 12 lts", 8, 2, 850, 5,
                                                            "fabricaDePastas@mail.com","24-05-22", "Testing Detalles Empresa 11");
        ce_rep.save(clienteEmpresa11);
        
          ce_rep.getAll().forEach(System.out::println);
    }
}