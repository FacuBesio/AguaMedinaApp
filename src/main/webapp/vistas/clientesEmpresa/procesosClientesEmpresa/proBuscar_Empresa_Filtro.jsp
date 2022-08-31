<%@page import="ar.com.aguaMedina.repositories.jdbc.ClienteEmpresaRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_ClienteEmpresaRepository"%>
<%@page import="ar.com.aguaMedina.utils.html.HtmlTable_ClienteEmpresa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ar.com.aguaMedina.enums.Dia"%>
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

        <title>AguaMedina App - Buscar Empresas</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    
        <!-- CSS -->
        <link rel="stylesheet" href="../../../css/clienteEmpresaCSS/buscar_ClienteEmpresaCSS.css">
    
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
                    <img src="../../../imagenes/logoAguaMedina.png" alt="">
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
                            <li><a href="../../../index.jsp" style="background-color: rgb(183, 206, 53);">     </a>
                            </li>
                            
                            <li><a href="../../recorridos/Home_Recorridos.jsp" id="selectedRe">Recorridos           </a>
                                <ul>
                                    <li><a href="../../recorridos/cargar_Recorridos.jsp">Cargar Recorridos</a></li>
                                    <li><a href="../../recorridos/buscar_Recorridos.jsp">Buscar Recorridos</a></li>
                                    <li><a href="../../recorridos/editar_Recorridos.jsp">Editar Recorridos</a></li>
                                    <li><a href="../../recorridos/borrar_Recorridos.jsp">Borrar Recorridos</a></li>
                                </ul>
                            </li>
                            
                            <li><a href="../../clientesPersona/Home_ClientesPersona.jsp" id="selectedPe">Personas</a>
                                <ul>
                                    <li><a href="../../clientesPersona/cargar_ClientesPersona.jsp">Cargar Personas</a></li>
                                    <li><a href="../../clientesPersona/buscar_ClientesPersona.jsp">Buscar Personas</a></li>
                                    <li><a href="../../clientesPersona/editar_ClientesPersona.jsp">Editar Personas</a></li>
                                    <li><a href="../../clientesPersona/borrar_ClientesPersona.jsp">Borrar Personas</a></li>
                                </ul>
                            </li>
                            
                            <li><a href="../Home_ClientesEmpresa.jsp" id="selectedEm">Empresas</a>
                                <ul>
                                    <li><a href=../"cargar_ClientesEmpresa.jsp">Cargar Empresas</a></li>
                                    <li><a href="../buscar_ClientesEmpresa.jsp">Buscar Empresas</a></li>
                                    <li><a href="../editar_ClientesEmpresa.jsp">Editar Empresas</a></li>
                                    <li><a href="../borrar_ClientesEmpresa.jsp">Borrar Empresas</a></li>
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

                <!-- BUSCADOR -->
                <div class="container__Buscador">
                    
                    <!-- SELECCIONAR FILTRO -->
                    <div class="container_Selector_filtro">
                        <form action="proBuscar_Empresa_Filtro.jsp" method="get">
                            <table>
                                <tr>
                                    <td><h2> BUSCAR EMPRESA </h2>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="filtro">
                                            <option disabled selected="true">
                                                Seleccione un Filtro
                                            </option>
                                            <option value="Razon_Social" >Razon Social </option>
                                            <option value="Cuit" >CUIT                 </option>
                                            <option value="Direccion">Dirección        </option>
                                            <option value="Localidad">Localidad        </option>
                                            <option value="Servicio">Servicio          </option>
                                            <option value="Recorrido">Recorrido        </option> 
                                            <option value="Dia">Dí­a                    </option> 
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input  type="submit" value="SELECCIONAR"/>            
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    
                    <!-- FILTRO -->
                    <div class="container_Filtro">
                        <form action="proBuscar_Empresa_Result.jsp" method="get">
                            <table>
    <%  
                            //  ● FILTROS  
                            String filtro = request.getParameter("filtro");
                            if (filtro == null){
                            response.sendRedirect("../buscar_ClientesEmpresa.jsp");
                            }
                            
                            //  ♦ RAZON SOCIAL
                            if ("Razon_Social".equalsIgnoreCase(filtro)){
    %>
                                <tr><td><h2>RAZON SOCIAL</h2></td></tr>
                                <tr>
                                    <td><input  type="text" name="buscarRazonSocial" placeholder="Buscador Razon Social"
                                                style="  width: 85%; 
                                                color: black;
                                                background-color: #fff;
                                                border-color: #f0f0f0;
                                                font-size: 24px;
                                                ">        
                                    </td>
                                </tr>
    <%  
                            } 
                            
                            //  ♦ CUIT
                            if ("Cuit".equalsIgnoreCase(filtro)){
    %>
                                <tr><td><h2>CUIT</h2></td></tr>
                                <tr>
                                    <td><input  type="text" name="buscarCuit" placeholder="Buscador CUIT"
                                                style="  width: 85%; 
                                                color: black;
                                                background-color: #fff;
                                                border-color: #f0f0f0;
                                                font-size: 24px;
                                                ">        
                                    </td>
                                </tr>
    <%  
                            }

                            //  ♦ DIRECCIÓN
                            if ("Direccion".equalsIgnoreCase(filtro)){
    %>
                                <tr><td><h2>DIRECCIÓN</h2></td></tr>
                                <tr>
                                    <td><input type="text" name="buscarDireccion" placeholder="Buscador Direcciones"
                                               style="  width: 85%; 
                                                        color: black;
                                                        background-color: #fff;
                                                        border-color: #f0f0f0;
                                                        font-size: 24px;
                                                        "> 
                                    </td>
                                </tr>
    <%
                            }

                            //  ♦ LOCALIDAD
                            if ("Localidad".equalsIgnoreCase(filtro)){
    %>
                                <tr><td><h2>LOCALIDAD</h2></td></tr>
                                <tr>
                                    <td><input type="text" name="buscarLocalidad" placeholder="Buscador Localidades"
                                               style="  width: 85%; 
                                                        color: black;
                                                        background-color: #fff;
                                                        border-color: #f0f0f0;
                                                        font-size: 24px;
                                                        ">
                                    </td>
                                </tr>
    <%
                            }

                            //  ♦ SERVICIO
                            if ("Servicio".equalsIgnoreCase(filtro)){
    %>
                                <tr><td><h2>TIPO DE SERVICIO</h2></td></tr>
                                <tr>
                                    <td>
                                        <select name="buscarServicio">
                                            <option disabled="" selected="true">Seleccione un Servicio</option>
                                            <option>Bidon 12 lts</option>
                                            <option>Bidon 20 lts</option>
                                            <option>Servicio Agua</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                     <td><input  type="submit" value="SELECCIONAR">            
                                    </td>
                                </tr>
    <%
                            }

                            //  ♦ RECORRIDO
                            if ("Recorrido".equalsIgnoreCase(filtro)){
    %>                  
                                <tr><td><h2>RECORRIDO</h2></td></tr>
                                <tr>
                                    <td>
                                        <select name="buscarRecorrido">
    <% 
                                    out.print("<option disabled=\"\" selected=\"true\"> Seleccione Recorrido</option>");
                                    List<Recorrido>list = re_rep.getAll();
                                    if (list.isEmpty()|| list == null){
                                        out.print("<option disabled=\"\"> Cargue un Recorrido por favor </option>");
                                        } else {
                                            for(Recorrido r: list){
                                                if (r.getAsistenteZona()==null){
                                                r.setAsistenteZona("Sin asistente");
                                            }
                                        }
                                    }

                                    for(Recorrido r: list)
                                    out.print("<option value=" +r.getId()+">"+
                                                                                r.getId()+". "+
                                                                                r.getNombreZona()+", "+
                                                                                r.getDia()+" ("+
                                                                                r.getResponsableZona()+" - "+
                                                                                r.getAsistenteZona()+")"
                                    + "</option>");
    %>
                                        </select>
                                    </td>
                                </tr>
                                <tr><td><input  type="submit" value="SELECCIONAR"></td></tr>

    <%
                            }

                            //  ♦ DÍA
                            if ("dia".equalsIgnoreCase(filtro)){
    %>
                                <tr><td><h2>DIA</h2></td></tr>
                                <tr>
                                    <td>
                                        <select name="buscarDia" style="text-transform: capitalize;">
    <% 
                                    out.print("<option disabled=\"\" selected=\"true\"> Seleccione Día</option>");
                                    for(Dia d: Dia.values())
                                    out.print("<option value=" +d+">"+d.toString().toLowerCase()+"</option>");
    %>
                                        </select>
                                    </td>
                                </tr>
                                <tr> <td><input  type="submit" value="SELECCIONAR"> </td></tr>
    <%
                            }
    %>

                            </table>
                        </form>
                    </div>
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