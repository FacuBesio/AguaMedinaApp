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

        <title>AguaMedina App - Borrar Personas</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    
        <!-- CSS -->
        <link rel="stylesheet" href="../../../css/clientePersonaCSS/borrar_ClientePersonaCSS.css">
    
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
                    <!--  <input type="search" placeholder="Â¿QuÃ© deseas buscar?">-->
                    <h1 style="color: rgb(183, 206, 52)">
                        <strong style="font-weight: 900; color:rgb(0, 147, 180);">Agua</strong>Medina<strong style="font-weight: 800; color:rgb(220, 150, 20);">App</strong>                                                                                
                    </h1>
                </div>
            </div>
    
            <!-- HEADER CONTAINER MENU -->
            <div class="container__menu"> <!-- Representa la lÃ­nea horizontal entera -->
                <!-- MENU -->
                <div class="menu"> <!-- Representa al MenÃº sobre la lÃ­nea horizontal entera -->
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
                            
                            <li><a href="../Home_ClientesPersona.jsp" id="selectedPe">Personas</a>
                                <ul>
                                    <li><a href="../cargar_ClientesPersona.jsp">Cargar Personas</a></li>
                                    <li><a href="../buscar_ClientesPersona.jsp">Buscar Personas</a></li>
                                    <li><a href="../editar_ClientesPersona.jsp">Editar Personas</a></li>
                                    <li><a href="../borrar_ClientesPersona.jsp">Borrar Personas</a></li>
                                </ul>
                            </li>
                            
                            <li><a href="../../clientesEmpresa/Home_ClientesEmpresa.jsp" id="selectedEm">Empresas</a>
                                <ul>
                                    <li><a href="../../clientesEmpresa/cargar_ClientesEmpresa.jsp">Cargar Empresas</a></li>
                                    <li><a href="../../clientesEmpresa/buscar_ClientesEmpresa.jsp">Buscar Empresas</a></li>
                                    <li><a href="../../clientesEmpresa/editar_ClientesEmpresa.jsp">Editar Empresas</a></li>
                                    <li><a href="../../clientesEmpresa/borrar_ClientesEmpresa.jsp">Borrar Empresas</a></li>
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

                <!-- BORRAR PERSONAS -->
                <div class="container__BorrarPersona">
                    
                    <!-- SELECCIONAR PERSONA -->
                    <div class="container_SelectorPersona">
                        <form action="proBorrar_PersonaConfirmacionA.jsp" method="get">
                        <%
                        //  ● BORRAR  
                        String select_ClientePersona = request.getParameter("select__clientePersona");
                        int id_selectClientePersona = 0;
                        
                        if (select_ClientePersona == null || select_ClientePersona.isEmpty()){
                        response.sendRedirect("../borrar_ClientesPersona.jsp");
                        }else{id_selectClientePersona = Integer.parseInt(select_ClientePersona);
                        }
                        %> 
                            <table>
                                <tr>
                                    <td><h2> BORRAR PERSONA </h2>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="select__clientePersona">
                                            <option value="Prueba" disabled="" selected="true" style="color: black;">
                                                Seleccione la Persona
                                            </option>
                                        <% 
                                        List<ClientePersona>list_select_ClientePersona = cp_rep.getAll();
                                        
                                        for(ClientePersona p: list_select_ClientePersona){
                                            Recorrido recorrido = re_rep.getById(p.getIdRecorrido());
                                            if (p.getId()== id_selectClientePersona){
                                            out.print("<option value=" +p.getId()+" selected=\"true\">" 
                                                                        +p.getId()+". " 
                                                                        +p.getNombre()+" | "
                                                                        +p.getDireccion()+" - "
                                                                        +p.getLocalidad()+" | Recorrido: "
                                                                        +p.getIdRecorrido()+" "
                                                                        +recorrido.getNombreZona()+" - " 
                                                                        +recorrido.getDia()+" | "
                                                                        +p.getMail()+" | "
                                                                        +p.getDetalles()
                                                                        +"</option>");
                                            }else{
                                            out.print("<option value=" +p.getId()+">"   
                                                                        +p.getId()+". " 
                                                                        +p.getNombre()+" | "
                                                                        +p.getDireccion()+" - "
                                                                        +p.getLocalidad()+" | Recorrido: "
                                                                        +p.getIdRecorrido()+" "
                                                                        +recorrido.getNombreZona()+" - " 
                                                                        +recorrido.getDia()+" | "
                                                                        +p.getMail()+" | "
                                                                        +p.getDetalles()
                                                                        +"</option>");

                                            }
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
                        <form action="proBorrar_PersonaConfirmacionB.jsp" method="get">
                            <table>
                                <tr>
                                    <td>
                                    <%                          
                                    ClientePersona p = cp_rep.getById(id_selectClientePersona);
                                    Recorrido recorrido = re_rep.getById(p.getIdRecorrido());
                                    out.print("<h2>¿Confirma la ELIMINACIÓN de la Persona?</h2>");
                                    out.print("<h3>"   
                                                    +p.getId()+". " 
                                                    +p.getNombre()+" | "
                                                    +p.getDireccion()+" - "
                                                    +p.getLocalidad()+" | Recorrido: "
                                                    +p.getIdRecorrido()+" "
                                                    +recorrido.getNombreZona()+" - " 
                                                    +recorrido.getDia()+" | "
                                                    +p.getMail()+" | "
                                                    +p.getDetalles()
                                                    +"</h3>");
                                    %>
                                    </td> 
                                </tr>
                                <tr>
                                    <td>
                                        <select name="select__confirmacion">
                                                                <%out.print("<option value=0> NO </option>");%>
                                                                <%out.print("<option value=" +id_selectClientePersona+"> SI </option>");%>
                                        </select>
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