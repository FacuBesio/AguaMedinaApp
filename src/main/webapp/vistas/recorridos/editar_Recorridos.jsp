<%@page import="ar.com.aguaMedina.utils.html.HtmlTable_Recorrido"%>
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

        <title>AguaMedina App - Editar Recorridos</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    
        <!-- CSS -->
        <link rel="stylesheet" href="../../css/recorridosCSS/editar_RecorridosCSS.css">
    
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
                            
                            <li><a href="Home_Recorridos.jsp" id="selectedRe">Recorridos           </a>
                                <ul>
                                    <li><a href="cargar_Recorridos.jsp">Cargar Recorridos</a></li>
                                    <li><a href="buscar_Recorridos.jsp">Buscar Recorridos</a></li>
                                    <li><a href="editar_Recorridos.jsp">Editar Recorridos</a></li>
                                    <li><a href="borrar_Recorridos.jsp">Borrar Recorridos</a></li>
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
            <!-- CONTENEDOR PRINCIPAL -->
            <div class="contenedor__principal">

                <!-- EDITAR RECORRIDOS -->
                <div class="container__EditarRecorrido">
                    
                    
                    <!-- SELECCIONAR RECORRIDO -->
                    <div class="container_SelectorRecorrido">
                        <form action="procesosRecorridos/proEditar_RecorridoFormulario.jsp" method="get">
                            <table>
                                <tr>
                                    <td><h2> EDITAR RECORRIDO </h2>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="select__Recorrido">
                                            <option disabled selected style="color: black;">
                                                Seleccione el Recorrido
                                            </option>
                                        <%
                                        List<Recorrido>list_select_Recorridos = re_rep.getAll();
                                        if (list_select_Recorridos.isEmpty()|| list_select_Recorridos == null){
                                            out.print("<option disabled=\"\"> Cargue un Recorrido por favor </option>");
                                        } 

                                        for(Recorrido r: list_select_Recorridos){
                                        out.print("<option value=" +r.getId()+">"   
                                                                                +r.getId()+". " 
                                                                                +r.getNombreZona()+", "
                                                                                +r.getDia()+" ( "
                                                                                +r.getResponsableZona()+" - "
                                                                                +r.getAsistenteZona()+")"
                                                                                +"</option>");
                                        }
                                        
                                        %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="submit" value="EDITAR"/> 
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    
                </div>
                    
                <!-- TABLA -->
                <div class="tabla_Recorridos">
        <%      //TABLA RECORRIDOS
                if (re_rep.getAll() != null || !(re_rep.getAll().isEmpty())){
                out.print(HtmlTable_Recorrido.tabla_Recorridos());
                }
        %>
                </div>
                
            </div>
        </main>
    </body>
</html>

