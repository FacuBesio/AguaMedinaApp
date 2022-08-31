<%@page import="ar.com.aguaMedina.entities.ClienteEmpresa"%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.ClienteEmpresaRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_ClienteEmpresaRepository"%>
<%@page import="ar.com.aguaMedina.utils.html.HtmlTable_ClienteEmpresa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.List"%>
<%@page import="ar.com.aguaMedina.entities.Recorrido"%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.RecorridoRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_RecorridoRepository"%>
<%@page import="ar.com.aguaMedina.connectors.Conector"%>
<%@page import="ar.com.aguaMedina.utils.html.HtmlTable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());%>
<%I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>AguaMedina App - Empresas</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    
        <!-- CSS -->
        <link rel="stylesheet" href="../../css/clienteEmpresaCSS/Home_ClientesEmpresaCSS.css">
    
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
                    <!--  <input type="search" placeholder="¿Qué deseas buscar?">-->
                    <h1 style="color: rgb(183, 206, 52)">
                        <strong style="font-weight: 900; color:rgb(0, 147, 180);">Agua</strong>Medina<strong style="font-weight: 800; color:rgb(220, 150, 20);">App</strong>                                                                                
                    </h1>
                </div>
            </div>
    
            <!-- HEADER CONTAINER MENU -->
            <div class="container__menu"> <!-- Representa la línea horizontal entera -->
                <!-- MENU -->
                <div class="menu"> <!-- Representa al Menú sobre la línea horizontal entera -->
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
                            
                            <li><a href="../clientesPersona/Home_ClientesPersona.jsp" id="selectedPe">Personas</a>
                                <ul>
                                    <li><a href="../clientesPersona/cargar_ClientesPersona.jsp">Cargar Personas</a></li>
                                    <li><a href="../clientesPersona/buscar_ClientesPersona.jsp">Buscar Personas</a></li>
                                    <li><a href="../clientesPersona/editar_ClientesPersona.jsp">Editar Personas</a></li>
                                    <li><a href="../clientesPersona/borrar_ClientesPersona.jsp">Borrar Personas</a></li>
                                </ul>
                            </li>
                            
                            <li><a href="Home_ClientesEmpresa.jsp" id="selectedEm">Empresas</a>
                                <ul>
                                    <li><a href="cargar_ClientesEmpresa.jsp">Cargar Empresas</a></li>
                                    <li><a href="buscar_ClientesEmpresa.jsp">Buscar Empresas</a></li>
                                    <li><a href="editar_ClientesEmpresa.jsp">Editar Empresas</a></li>
                                    <li><a href="borrar_ClientesEmpresa.jsp">Borrar Empresas</a></li>
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
            //LUNES
            List <Recorrido> recorridos_LunesEmpresa  = new ArrayList();
            List <ClienteEmpresa> clientesEmpresa_Lunes = new ArrayList();
            int bidones_LunesEmpresa = 0;
            int maquinas_LunesEmpresa = 0;
            recorridos_LunesEmpresa =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Lunes"))
                                            .collect(Collectors.toList());
            for (Recorrido r : recorridos_LunesEmpresa){
                for (ClienteEmpresa e : ce_rep.getAll()){
                    if (e.getIdRecorrido() == r.getId()){
                        clientesEmpresa_Lunes.add(e);
                        bidones_LunesEmpresa = bidones_LunesEmpresa + e.getBidones();
                        maquinas_LunesEmpresa = maquinas_LunesEmpresa + e.getMaquinas();
                    }
                }
            }
            //clientesPersona_Lunes.forEach(System.out::println);
            //System.out.println("");
            //recorridos_Lunes.forEach(System.out::println);
            long clientesEmpresa_LunesCantidad = clientesEmpresa_Lunes.stream().count();


            //MARTES
            List <Recorrido> recorridos_MartesEmpresa  = new ArrayList();
            List <ClienteEmpresa> clientesEmpresa_Martes = new ArrayList();
            int bidones_MartesEmpresa = 0;
            int maquinas_MartesEmpresa = 0;
            recorridos_MartesEmpresa =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Martes"))
                                            .collect(Collectors.toList());
            for (Recorrido r : recorridos_MartesEmpresa){
                for (ClienteEmpresa e : ce_rep.getAll()){
                    if (e.getIdRecorrido() == r.getId()){
                        clientesEmpresa_Martes.add(e);
                        bidones_MartesEmpresa = bidones_MartesEmpresa + e.getBidones();
                        maquinas_MartesEmpresa = maquinas_MartesEmpresa + e.getMaquinas();
                    }
                }
            }
            //clientesPersona_Martes.forEach(System.out::println);
            //System.out.println("");
            //recorridos_Martes.forEach(System.out::println);
            long clientesEmpresa_MartesCantidad = clientesEmpresa_Martes.stream().count();

            //MIERCOLES
            List <Recorrido> recorridos_MiercolesEmpresa  = new ArrayList();
            List <ClienteEmpresa> clientesEmpresa_Miercoles = new ArrayList();
            int bidones_MiercolesEmpresa = 0;
            int maquinas_MiercolesEmpresa = 0;
            recorridos_MiercolesEmpresa =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Miercoles"))
                                            .collect(Collectors.toList());
            for (Recorrido r : recorridos_MiercolesEmpresa){
                for (ClienteEmpresa e : ce_rep.getAll()){
                    if (e.getIdRecorrido() == r.getId()){
                        clientesEmpresa_Miercoles.add(e);
                        bidones_MiercolesEmpresa = bidones_MiercolesEmpresa + e.getBidones();
                        maquinas_MiercolesEmpresa = maquinas_MiercolesEmpresa + e.getMaquinas();
                    }
                }
            }
            //clientesPersona_Miercoles.forEach(System.out::println);
            //System.out.println("");
            //recorridos_Miercoles.forEach(System.out::println);
            long clientesEmpresa_MiercolesCantidad = clientesEmpresa_Miercoles.stream().count();

            //JUEVES
            List <Recorrido> recorridos_JuevesEmpresa  = new ArrayList();
            List <ClienteEmpresa> clientesEmpresa_Jueves = new ArrayList();
            int bidones_JuevesEmpresa = 0;
            int maquinas_JuevesEmpresa = 0;
            recorridos_JuevesEmpresa =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Jueves"))
                                            .collect(Collectors.toList());
            for (Recorrido r : recorridos_JuevesEmpresa){
                for (ClienteEmpresa e : ce_rep.getAll()){
                    if (e.getIdRecorrido() == r.getId()){
                        clientesEmpresa_Jueves.add(e);
                        bidones_JuevesEmpresa = bidones_JuevesEmpresa + e.getBidones();
                        maquinas_JuevesEmpresa = maquinas_JuevesEmpresa + e.getMaquinas();
                    }
                }
            }
            //lientesPersona_Jueves.forEach(System.out::println);
            //System.out.println("");
            //recorridos_Jueves.forEach(System.out::println);
            long clientesEmpresa_JuevesCantidad = clientesEmpresa_Jueves.stream().count();
            //System.out.println(clientesPersona_JuevesCantidad);

            //VIERNES
            List <Recorrido> recorridos_ViernesEmpresa  = new ArrayList();
            List <ClienteEmpresa> clientesEmpresa_Viernes = new ArrayList();
            int bidones_ViernesEmpresa = 0;
            int maquinas_ViernesEmpresa = 0;
            recorridos_ViernesEmpresa =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Viernes"))
                                            .collect(Collectors.toList());
            for (Recorrido r : recorridos_ViernesEmpresa){
                for (ClienteEmpresa e : ce_rep.getAll()){
                    if (e.getIdRecorrido() == r.getId()){
                        clientesEmpresa_Viernes.add(e);
                        bidones_ViernesEmpresa = bidones_ViernesEmpresa + e.getBidones();
                        maquinas_ViernesEmpresa = maquinas_ViernesEmpresa + e.getMaquinas();
                    }
                }
            }
            //clientesPersona_Viernes.forEach(System.out::println);
            //System.out.println("");
            //recorridos_Viernes.forEach(System.out::println);
            long clientesEmpresa_ViernesCantidad = clientesEmpresa_Viernes.stream().count();
            //System.out.println(clientesPersona_ViernesCantidad);

            //SABADOS
            List <Recorrido> recorridos_SabadosEmpresa  = new ArrayList();
            List <ClienteEmpresa> clientesEmpresa_Sabados = new ArrayList();
            int bidones_SabadosEmpresa = 0;
            int maquinas_SabadosEmpresa = 0;
            recorridos_SabadosEmpresa =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Sabados"))
                                            .collect(Collectors.toList());
            for (Recorrido r : recorridos_SabadosEmpresa){
                for (ClienteEmpresa e : ce_rep.getAll()){
                    if (e.getIdRecorrido() == r.getId()){
                        clientesEmpresa_Sabados.add(e);
                        bidones_SabadosEmpresa = bidones_SabadosEmpresa + e.getBidones();
                        maquinas_SabadosEmpresa = maquinas_SabadosEmpresa + e.getMaquinas();
                    }
                }
            }
            //clientesPersona_Sabados.forEach(System.out::println);
            //System.out.println("");
            //recorridos_Sabados.forEach(System.out::println);
            long clientesEmpresa_SabadosCantidad = clientesEmpresa_Sabados.stream().count();
                //System.out.println(clientesPersona_SabadosCantidad);
                
                
            int bidones_totalEmpresa = bidones_LunesEmpresa + bidones_MartesEmpresa + bidones_MiercolesEmpresa 
                                + bidones_JuevesEmpresa + bidones_ViernesEmpresa + bidones_SabadosEmpresa;
            int maquinas_totalEmpresa = maquinas_LunesEmpresa + maquinas_MartesEmpresa + maquinas_MiercolesEmpresa 
                                        + maquinas_JuevesEmpresa + maquinas_ViernesEmpresa + maquinas_SabadosEmpresa;

            long clientesEmpresa_Total = ce_rep.getAll().stream().count();
%>

            <!-- CONTENEDOR PRINCIPAL -->
            <div class="contenedor__principal">

                <!-- CLIENTES EMPRESA -->
                <div class="container__main_ClientesEmpresa">
                    <table>
                        <tr>
                            <td>
                                <a href="procesosClientesEmpresa/proBuscar_Empresa_Result.jsp?buscarDia=Lunes">Lunes</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                    <%
                        out.print("Empresas: "+ clientesEmpresa_LunesCantidad 
                                    +" - Bidones: "+ bidones_LunesEmpresa
                                    +" - Maquinas: "+ maquinas_LunesEmpresa);
                    %>
                                </h4>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <a href="procesosClientesEmpresa/proBuscar_Empresa_Result.jsp?buscarDia=Martes">Martes</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                    <%
                        out.print("Empresas: "+ clientesEmpresa_MartesCantidad
                                        +" - Bidones: "+ bidones_MartesEmpresa
                                        +" - Maquinas: "+ maquinas_MartesEmpresa);
                    %>
                                </h4>
                            </td>
                        </tr>
    
                        <tr>
                            <td>
                                <a href="procesosClientesEmpresa/proBuscar_Empresa_Result.jsp?buscarDia=Miercoles">Miércoles</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                   <%
                        out.print("Empresas: "+ clientesEmpresa_MiercolesCantidad
                                        +" - Bidones: "+ bidones_MiercolesEmpresa
                                        +" - Maquinas: "+ maquinas_MiercolesEmpresa);
                    %>
                                </h4>
                            </td>
                        </tr>
                    
                        <tr>
                            <td>
                                <a href="procesosClientesEmpresa/proBuscar_Empresa_Result.jsp?buscarDia=Jueves">Jueves</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                   <%
                        out.print("Empresas: "+ clientesEmpresa_JuevesCantidad
                                        +" - Bidones: "+ bidones_JuevesEmpresa
                                        +" - Maquinas: "+ maquinas_JuevesEmpresa);
                    %>
                                </h4>
                            </td>
                        </tr>
                    
                        <tr>
                            <td>
                                <a href="procesosClientesEmpresa/proBuscar_Empresa_Result.jsp?buscarDia=Viernes">Viernes</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                   <%
                        out.print("Empresas: "+ clientesEmpresa_ViernesCantidad
                                        +" - Bidones: "+ bidones_ViernesEmpresa
                                        +" - Maquinas: "+ maquinas_ViernesEmpresa);
                    %>
                                </h4>
                            </td>
                        </tr>
    
                        <tr>
                            <td>
                                <a href="procesosClientesEmpresa/proBuscar_Empresa_Result.jsp?buscarDia=Sabados">Sábados</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                   <%
                        out.print("Empresas: "+ clientesEmpresa_SabadosCantidad
                                        +" - Bidones: "+ bidones_SabadosEmpresa
                                        +" - Maquinas: "+ maquinas_SabadosEmpresa);
                    %>
                                </h4>
                            </td>
                        </tr>
                        
                        
                        
                        <tr>
                            <td>
                                <h2 style="margin-top: -5px;"><%out.print("BIDONES: " + bidones_totalEmpresa);%> </h2>
                            </td>
                        </tr>
                        <tr><td><h2><%out.print("MÁQUINAS: " + maquinas_totalEmpresa);%> </h2></td></tr>
                        <tr>
                            <td>
                                <h3><%out.print("TOTAL EMPRESAS: "+ clientesEmpresa_Total);%></h3>
                            </td>
                        </tr>
                    </table>
                </div>
                    
                <!-- TABLA -->
                <div class="tabla_ClientesEmpresa">
        <%
                //TABLA CLIENTE EMPRESA
                 if (ce_rep.getAll() != null || !(ce_rep.getAll().isEmpty())){
                    out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresa());
                }
        %>
                </div>

            </div>
        </main>
    </body>
</html>