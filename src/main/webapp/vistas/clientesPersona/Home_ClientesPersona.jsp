<%@page import="java.util.ArrayList"%>
<%@page import="ar.com.aguaMedina.utils.html.HtmlTable_ClientePersona"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.List"%>
<%@page import="ar.com.aguaMedina.entities.Recorrido"%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.RecorridoRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_RecorridoRepository"%>
<%@page import="ar.com.aguaMedina.connectors.Conector"%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.ClientePersonaRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_ClientePersonaRepository"%>
<%@page import="ar.com.aguaMedina.entities.ClientePersona"%>
<%@page import="ar.com.aguaMedina.utils.html.HtmlTable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());%>
<%I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>AguaMedina App - Personas</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    
        <!-- CSS -->
        <link rel="stylesheet" href="../../css/clientePersonaCSS/Home_ClientesPersonaCSS.css">
    
        <!-- GoogleFonts -->
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,
        300;1,400;1,600;1,700;1,900&display=swap" rel="stylesheet">
    </head>
    
    <body>
        <!-- ---------------------------------------- HEADER ---------------------------------------- -->
        <header>
            <!-- HEADER SUPERIOR -->
            <div class="header__superior">
                <!-- LOGO -->
                <div class="logo">
                    <img src="../../imagenes/logoAguaMedina.png" alt="">
                </div>
                <!-- SEARCH -->
                <div class="search">
                    <!--  <input type="search" placeholder="????Qu???? deseas buscar?">-->
                    <h1 style="color: rgb(183, 206, 52)">
                        <strong style="font-weight: 900; color:rgb(0, 147, 180);">Agua</strong>Medina<strong style="font-weight: 800; color:rgb(220, 150, 20);">App</strong>                                                                                
                    </h1>
                </div>
            </div>
    
            <!-- HEADER CONTAINER MENU -->
            <div class="container__menu"> <!-- Representa la l????nea horizontal entera -->
                <!-- MENU -->
                <div class="menu"> <!-- Representa al Men???? sobre la l????nea horizontal entera -->
                    <input type="checkbox" id="check__menu">
                    <label id="#label__check" for="check__menu">
                        <i class="fa-solid fa-bars icon__menu"></i>
                    </label>
                    <nav>
                        <ul>
                            <li><a href="../../index.jsp" style="background-color: rgb(183, 206, 53);">     </a>
                            </li>
                            
                            <li><a href="../recorridos/Home_Recorridos.jsp" id="selectedRe">Recorridos           </a>
                                <ul>
                                    <li><a href="../recorridos/cargar_Recorridos.jsp">Cargar Recorridos</a></li>
                                    <li><a href="../recorridos/buscar_Recorridos.jsp">Buscar Recorridos</a></li>
                                    <li><a href="../recorridos/editar_Recorridos.jsp">Editar Recorridos</a></li>
                                    <li><a href="../recorridos/borrar_Recorridos.jsp">Borrar Recorridos</a></li>
                                </ul>
                            </li>
                            
                            <li><a href="Home_ClientesPersona.jsp" id="selectedPe">Personas</a>
                                <ul>
                                    <li><a href="cargar_ClientesPersona.jsp">Cargar Personas</a></li>
                                    <li><a href="buscar_ClientesPersona.jsp">Buscar Personas</a></li>
                                    <li><a href="editar_ClientesPersona.jsp">Editar Personas</a></li>
                                    <li><a href="borrar_ClientesPersona.jsp">Borrar Personas</a></li>
                                </ul>
                            </li>
                            
                            <li><a href="../clientesEmpresa/Home_ClientesEmpresa.jsp" id="selectedEm">Empresas</a>
                                <ul>
                                    <li><a href="../clientesEmpresa/cargar_ClientesEmpresa.jsp">Cargar Empresas</a></li>
                                    <li><a href="../clientesEmpresa/buscar_ClientesEmpresa.jsp">Buscar Empresas</a></li>
                                    <li><a href="../clientesEmpresa/editar_ClientesEmpresa.jsp">Editar Empresas</a></li>
                                    <li><a href="../clientesEmpresa/borrar_ClientesEmpresa.jsp">Borrar Empresas</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>
        
        <!-- ---------------------------------------- MAIN ---------------------------------------- -->
        <main>
<%
            long clientesPersona_Total = cp_rep.getAll().stream().count();
            //LUNES
            List <Recorrido> recorridos_Lunes  = new ArrayList();
            List <ClientePersona> clientesPersona_Lunes = new ArrayList();
            int bidones_Lunes = 0;
            int maquinas_Lunes = 0;
            recorridos_Lunes =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Lunes"))
                                            .collect(Collectors.toList());
            for (Recorrido r : recorridos_Lunes){
                for (ClientePersona p : cp_rep.getAll()){
                    if (p.getIdRecorrido() == r.getId()){
                        clientesPersona_Lunes.add(p);
                        bidones_Lunes = bidones_Lunes + p.getBidones();
                        maquinas_Lunes = maquinas_Lunes + p.getMaquinas();
                    }
                }
            }
            //clientesPersona_Lunes.forEach(System.out::println);
            //System.out.println("");
            //recorridos_Lunes.forEach(System.out::println);
            long clientesPersona_LunesCantidad = clientesPersona_Lunes.stream().count();


            //MARTES
            List <Recorrido> recorridos_Martes  = new ArrayList();
            List <ClientePersona> clientesPersona_Martes = new ArrayList();
            int bidones_Martes = 0;
            int maquinas_Martes = 0;
            recorridos_Martes =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Martes"))
                                            .collect(Collectors.toList());
            for (Recorrido r : recorridos_Martes){
                for (ClientePersona p : cp_rep.getAll()){
                    if (p.getIdRecorrido() == r.getId()){
                        clientesPersona_Martes.add(p);
                        bidones_Martes = bidones_Martes + p.getBidones();
                        maquinas_Martes = maquinas_Martes + p.getMaquinas();
                    }
                }
            }
            //clientesPersona_Martes.forEach(System.out::println);
            //System.out.println("");
            //recorridos_Martes.forEach(System.out::println);
            long clientesPersona_MartesCantidad = clientesPersona_Martes.stream().count();

            //MIERCOLES
            List <Recorrido> recorridos_Miercoles  = new ArrayList();
            List <ClientePersona> clientesPersona_Miercoles = new ArrayList();
            int bidones_Miercoles = 0;
            int maquinas_Miercoles = 0;
            recorridos_Miercoles =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Miercoles"))
                                            .collect(Collectors.toList());
            for (Recorrido r : recorridos_Miercoles){
                for (ClientePersona p : cp_rep.getAll()){
                    if (p.getIdRecorrido() == r.getId()){
                        clientesPersona_Miercoles.add(p);
                        bidones_Miercoles = bidones_Miercoles + p.getBidones();
                        maquinas_Miercoles = maquinas_Miercoles + p.getMaquinas();
                    }
                }
            }
            //clientesPersona_Miercoles.forEach(System.out::println);
            //System.out.println("");
            //recorridos_Miercoles.forEach(System.out::println);
            long clientesPersona_MiercolesCantidad = clientesPersona_Miercoles.stream().count();

            //JUEVES
            List <Recorrido> recorridos_Jueves  = new ArrayList();
            List <ClientePersona> clientesPersona_Jueves = new ArrayList();
            int bidones_Jueves = 0;
            int maquinas_Jueves = 0;
            recorridos_Jueves =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Jueves"))
                                            .collect(Collectors.toList());
            for (Recorrido r : recorridos_Jueves){
                for (ClientePersona p : cp_rep.getAll()){
                    if (p.getIdRecorrido() == r.getId()){
                        clientesPersona_Jueves.add(p);
                        bidones_Jueves = bidones_Jueves + p.getBidones();
                        maquinas_Jueves = maquinas_Jueves + p.getMaquinas();
                    }
                }
            }
            //lientesPersona_Jueves.forEach(System.out::println);
            //System.out.println("");
            //recorridos_Jueves.forEach(System.out::println);
            long clientesPersona_JuevesCantidad = clientesPersona_Jueves.stream().count();
            //System.out.println(clientesPersona_JuevesCantidad);

            //VIERNES
            List <Recorrido> recorridos_Viernes  = new ArrayList();
            List <ClientePersona> clientesPersona_Viernes = new ArrayList();
            int bidones_Viernes = 0;
            int maquinas_Viernes = 0;
            recorridos_Viernes =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Viernes"))
                                            .collect(Collectors.toList());
            for (Recorrido r : recorridos_Viernes){
                for (ClientePersona p : cp_rep.getAll()){
                    if (p.getIdRecorrido() == r.getId()){
                        clientesPersona_Viernes.add(p);
                        bidones_Viernes = bidones_Viernes + p.getBidones();
                        maquinas_Viernes = maquinas_Viernes + p.getMaquinas();
                    }
                }
            }
            clientesPersona_Viernes.forEach(System.out::println);
            //System.out.println("");
            //recorridos_Viernes.forEach(System.out::println);
            long clientesPersona_ViernesCantidad = clientesPersona_Viernes.stream().count();
            //System.out.println(clientesPersona_ViernesCantidad);

            //SABADOS
            List <Recorrido> recorridos_Sabados  = new ArrayList();
            List <ClientePersona> clientesPersona_Sabados = new ArrayList();
            int bidones_Sabados = 0;
            int maquinas_Sabados = 0;
            recorridos_Sabados =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Sabados"))
                                            .collect(Collectors.toList());
            for (Recorrido r : recorridos_Sabados){
                for (ClientePersona p : cp_rep.getAll()){
                    if (p.getIdRecorrido() == r.getId()){
                        clientesPersona_Sabados.add(p);
                        bidones_Sabados = bidones_Sabados + p.getBidones();
                        maquinas_Sabados = maquinas_Sabados + p.getMaquinas();
                    }
                }
            }
            //clientesPersona_Sabados.forEach(System.out::println);
            //System.out.println("");
            //recorridos_Sabados.forEach(System.out::println);
            long clientesPersona_SabadosCantidad = clientesPersona_Sabados.stream().count();
            //System.out.println(clientesPersona_SabadosCantidad);


            int bidones_total = bidones_Lunes + bidones_Martes + bidones_Miercoles + bidones_Jueves + bidones_Viernes 
                                + bidones_Sabados;
            int maquinas_total = maquinas_Lunes + maquinas_Martes + maquinas_Miercoles + maquinas_Jueves 
                                + maquinas_Viernes + maquinas_Sabados;
%>

            <!-- CONTENEDOR PRINCIPAL -->
            <div class="contenedor__principal">

                <!-- CLIENTES PERSONA -->
                <div class="container__main_ClientesPersona">
                    <table>
                        <tr>
                            <td>
                                <a href="procesosClientesPersona/proBuscar_Persona_Result.jsp?buscarDia=Lunes">Lunes</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                    <%
                        out.print("Personas: "+ clientesPersona_LunesCantidad 
                                    +" - Bidones: "+ bidones_Lunes
                                    +" - Maquinas: "+ maquinas_Lunes);
                    %>
                                </h4>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <a href="procesosClientesPersona/proBuscar_Persona_Result.jsp?buscarDia=Martes">Martes</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                    <%
                        out.print("Personas: "+ clientesPersona_MartesCantidad
                                        +" - Bidones: "+ bidones_Martes
                                        +" - Maquinas: "+ maquinas_Martes);
                    %>
                                </h4>
                            </td>
                        </tr>
    
                        <tr>
                            <td>
                                <a href="procesosClientesPersona/proBuscar_Persona_Result.jsp?buscarDia=Miercoles">Mi??rcoles</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                   <%
                        out.print("Personas: "+ clientesPersona_MiercolesCantidad
                                        +" - Bidones: "+ bidones_Miercoles
                                        +" - Maquinas: "+ maquinas_Miercoles);
                    %>
                                </h4>
                            </td>
                        </tr>
                    
                        <tr>
                            <td>
                                <a href="procesosClientesPersona/proBuscar_Persona_Result.jsp?buscarDia=Jueves">Jueves</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                   <%
                        out.print("Personas: "+ clientesPersona_JuevesCantidad
                                        +" - Bidones: "+ bidones_Jueves
                                        +" - Maquinas: "+ maquinas_Jueves);
                    %>
                                </h4>
                            </td>
                        </tr>
                    
                        <tr>
                            <td>
                                <a href="procesosClientesPersona/proBuscar_Persona_Result.jsp?buscarDia=Viernes">Viernes</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                   <%
                        out.print("Personas: "+ clientesPersona_ViernesCantidad 
                                        +" - Bidones: "+ bidones_Viernes
                                        +" - Maquinas: "+ maquinas_Viernes);
                    %>
                                </h4>
                            </td>
                        </tr>
    
                        <tr>
                            <td>
                                <a href="procesosClientesPersona/proBuscar_Persona_Result.jsp?buscarDia=Sabados">S??bados</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                   <%
                        out.print("Personas: "+ clientesPersona_SabadosCantidad
                                        +" - Bidones: "+ bidones_Sabados
                                        +" - Maquinas: "+ maquinas_Sabados);
                    %>
                                </h4>
                            </td>
                        </tr>
                        
                        
                        
                        <tr>
                            <td>
                                <h2 style="margin-top: -5px;"><%out.print("BIDONES: " + bidones_total);%> </h2>
                            </td>
                        </tr>
                        <tr><td><h2><%out.print("M??QUINAS: " + maquinas_total);%> </h2></td></tr>
                        <tr>
                            <td>
                                <h3><%out.print("TOTAL PERSONAS: "+ clientesPersona_Total);%></h3>
                            </td>
                        </tr>
                    </table>
                </div>
                    
                <!-- TABLA -->
                <div class="tabla_ClientesPersona">
        <%
                //TABLA CLIENTE PERSONA
                 if (cp_rep.getAll() != null || !(cp_rep.getAll().isEmpty())){
                    out.print(HtmlTable_ClientePersona.tabla_ClientesPersona());
                }
        %>
                </div>

            </div>
        </main>
    </body>
</html>