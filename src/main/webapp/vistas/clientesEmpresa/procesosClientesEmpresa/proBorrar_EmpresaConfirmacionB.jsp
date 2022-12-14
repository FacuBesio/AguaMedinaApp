<%@page import="ar.com.aguaMedina.entities.ClienteEmpresa"%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.ClienteEmpresaRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_ClienteEmpresaRepository"%>
<%@page import="ar.com.aguaMedina.utils.html.HtmlTable_ClienteEmpresa"%>
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

        <title>AguaMedina App - Borrar Empresas</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    
        <!-- CSS -->
        <link rel="stylesheet" href="../../../css/clienteEmpresaCSS/borrar_ClientesEmpresaCSS.css">
    
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
                    <!--  <input type="search" placeholder="??Qu?? deseas buscar?">-->
                    <h1 style="color: rgb(183, 206, 52)">
                        <strong style="font-weight: 900; color:rgb(0, 147, 180);">Agua</strong>Medina<strong style="font-weight: 800; color:rgb(220, 150, 20);">App</strong>                                                                                
                    </h1>
                </div>
            </div>
    
            <!-- HEADER CONTAINER MENU -->
            <div class="container__menu"> <!-- Representa la l??nea horizontal entera -->
                <!-- MENU -->
                <div class="menu"> <!-- Representa al Men?? sobre la l??nea horizontal entera -->
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
                                    <li><a href="../cargar_ClientesEmpresa.jsp">Cargar Empresas</a></li>
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

                <!-- BORRAR EMPRESAS -->
                <div class="container__BorrarEmpresa">
                    
                    <!-- SELECCIONAR EMPRESA -->
                    <div class="container_SelectorEmpresa">
                        <form action="proBorrar_EmpresaConfirmacionA.jsp" method="get">
                    <%
                        //  ??? BORRAR  
                        String select_ClienteEmpresa = request.getParameter("select__confirmacion");
                        int id_selectClienteEmpresa = 0;
                        ClienteEmpresa empresa_copia = new ClienteEmpresa();

                        if (select_ClienteEmpresa !=null && !(select_ClienteEmpresa.isEmpty())) {
                            id_selectClienteEmpresa = Integer.parseInt(select_ClienteEmpresa);
                            empresa_copia = ce_rep.getById(id_selectClienteEmpresa);
                            ce_rep.remove(id_selectClienteEmpresa);
                        }
                        
                        if (id_selectClienteEmpresa<=0 || empresa_copia.getId() == 0){
                            response.sendRedirect("../borrar_ClientesEmpresa.jsp");
                        }
                    %> 
                            <table>
                                <tr>
                                    <td><h2> BORRAR EMPRESA </h2>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="select__clienteEmpresa">
                                            <option  disabled selected="true" style="color: black;">
                                                Seleccione la Empresa
                                            </option>
                    <% 
                                        List<ClienteEmpresa>list_select_ClienteEmpresa = ce_rep.getAll();
                                        if (list_select_ClienteEmpresa.isEmpty()|| list_select_ClienteEmpresa == null){
                                            out.print("<option disabled=\"\"> Cargue una Empresa por favor </option>");
                                        } 

                                        for(ClienteEmpresa e: list_select_ClienteEmpresa){
                                                    Recorrido recorrido = re_rep.getById(e.getIdRecorrido());
                                                    out.print("<option value=" +e.getId()+">"   
                                                    +e.getId()+". " 
                                                    +e.getRazon_social()+" | "
                                                    +e.getDireccion()+" - "
                                                    +e.getLocalidad()+" | Recorrido: "
                                                    +recorrido.getNombreZona()+" - " 
                                                    + recorrido.getDia()+" | "
                                                    +e.getMail()+" | "
                                                    +e.getDetalles()
                                                    +"</option>");
                                        }
                    %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="submit" value="BORRAR"/> 
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    
                    <!-- CONFIRMACION -->
                    <div class="container_Confirmacion">
                        <form action="proBorrar_EmpresaConfirmacionB.jsp" method="get">
                            <table style="background-color: rgb(85, 168, 196);">
                                <tr>
                                    <td>
                    <%
                                    
                                    ClienteEmpresa e = ce_rep.getById(id_selectClienteEmpresa);
                                    Recorrido recorrido = re_rep.getById(empresa_copia.getIdRecorrido());
                                    out.print("<h2>Se ha Elimanado exitosamente a la Empresa: </h2>");
                                    out.print("<h3>"   
                                                +empresa_copia.getId()+". " 
                                                +empresa_copia.getRazon_social()+" | "
                                                +empresa_copia.getDireccion()+" - "
                                                +empresa_copia.getLocalidad()+" | Recorrido: "
                                                +recorrido.getNombreZona()+" - " 
                                                +recorrido.getDia()+" | "
                                                +empresa_copia.getMail()+" | "
                                                +empresa_copia.getDetalles()
                                                +"</h3>");
                    %>
                                    </td> 
                                </tr>
                                <tr>
                                    <td>
                                        <input type="submit" value="OK"/> 
                                    </td>
                                </tr>
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