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

        <title>AguaMedina App - Editar Personas</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    
        <!-- CSS -->
        <link rel="stylesheet" href="../../../css/clientePersonaCSS/editar_ClientePersonaCSS.css">
    
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

                <!-- EDITAR PERSONAS -->
                <div class="container__EditarPersona">
                    
                    
                    <!-- SELECCIONAR PERSONA -->
                    <div class="container_SelectorPersona">
                        <form action="proEditar_PersonaFormulario.jsp" method="get">
                        <%
                        //  ● EDITAR  
                        String select_ClientePersona = request.getParameter("select__clientePersona");
                        int id_selectClientePersona = 0;
                        
                        if (select_ClientePersona == null || select_ClientePersona.isEmpty()){
                        response.sendRedirect("../editar_ClientesPersona.jsp");
                        }else{id_selectClientePersona = Integer.parseInt(select_ClientePersona);
                        }
                        %> 
                            <table>
                                <tr>
                                    <td><h2> EDITAR PERSONA </h2>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="select__clientePersona">
                                            <option disabled selected style="color: black;">
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
                                        <input type="submit" value="EDITAR"/> 
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    
                </div>
                    
                <!-- FORMULARIO PARA EDITAR PERSONAS -->
                <%           
                //● SELECCION DE CLIENTE PERSONA  
                ClientePersona persona = cp_rep.getById(id_selectClientePersona);
                    
                %>
                <div class="formulario_EditarPersona">
                    <form action="proEditar_PersonaConfirmacion.jsp" method="get">
                        <table>
                            <tr><td>
                                <h2> ACTUALIZAR DATOS </h2>
                            </td>
                            </tr>
                            
                            <tr>
                                <td>
                                    <input type="text" name="nombre" maxlength="35" placeholder="Nombre"
                                           value="<%out.print(persona.getNombre());%>">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="direccion" maxlength="35" placeholder="Direccion"
                                           value="<%out.print(persona.getDireccion());%>">  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="localidad" maxlength="35" placeholder="Localidad"
                                           value="<%out.print(persona.getLocalidad());%>">        
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="contacto" maxlength="20" placeholder="Contacto"
                                           value="<%out.print(persona.getContacto());%>">         
                                </td>
                            </tr>
                            <tr><td>
                                    <select name="tipo_servicio">
                                        <option disabled="">Seleccione un Tipo de Servicio</option>
                            <%
                                    if (persona.getTipo_servicio() == null || persona.getTipo_servicio().isEmpty() ){
                                        persona.setTipo_servicio("");
                                    }
                                    if (persona.getTipo_servicio().equalsIgnoreCase("Bidon 12 lts")){
                                        out.print("<option selected=\"true\">Bidon 12 lts</option> "
                                                + "<option>Bidon 20 lts</option>"
                                                + "<option>Servicio Agua</option>");
                                    }else if (persona.getTipo_servicio().equalsIgnoreCase("Bidon 20 lts")){
                                        out.print("<option>Bidon 12 lts</option> "
                                                + "<option selected=\"true\">Bidon 20 lts</option>"
                                                + "<option>Servicio Agua</option>");
                                    }else if (persona.getTipo_servicio().equalsIgnoreCase("Servicio Agua")){
                                        out.print("<option>Bidon 12 lts</option> "
                                                + "<option>Bidon 20 lts</option>"
                                                + "<option selected=\"true\">Servicio Agua</option>");
                                    }
                            %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="number" min="0" max="1000" name="bidones" placeholder="Bidones"
                                           value="<%out.print(persona.getBidones());%>">   
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="number" min="0" max="1000" name="maquinas" placeholder="Maquinas"
                                           value="<%out.print(persona.getMaquinas());%>">  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="number" min="0" max="10000000" name="precio" placeholder="Precio ($)"
                                           value="<%out.print(persona.getPrecio());%>">  
                                </td>
                            </tr>
                            <tr><td>
                                    <select name="idRecorrido">
                                        <option disabled="">Seleccione un Recorrido</option>
                                    <% 
                                        List<Recorrido>list = re_rep.getAll();
                                        if (list.isEmpty()|| list == null){
                                            out.print("<option disabled=\"\"> Cargue un Recorrido por favor </option>");
                                            }else{
                                                for(Recorrido r: list){
                                                    if (r.getAsistenteZona()==null){
                                                    r.setAsistenteZona("Sin asistente");
                                                    }
                                                }
                                            }

                                        for(Recorrido r: list){
                                            if (persona.getIdRecorrido()== r.getId()){
                                                out.print("<option value=" +r.getId()+" selected=\"true\">"+
                                                                                            r.getId()+". "+
                                                                                            r.getNombreZona()+", "+
                                                                                            r.getDia()+" ("+
                                                                                            r.getResponsableZona()+" - "+
                                                                                            r.getAsistenteZona()+")"
                                                + "</option>");
                                            }else{
                                                out.print("<option value=" +r.getId()+">"+
                                                                                            r.getId()+". "+
                                                                                            r.getNombreZona()+", "+
                                                                                            r.getDia()+" ("+
                                                                                            r.getResponsableZona()+" - "+
                                                                                            r.getAsistenteZona()+")"
                                                + "</option>");
                                            }
                                        }
                                    %>
                                    </select>
                                </td></tr>
                            <tr>
                                <td>
                                    <input type="text" maxlength="50" name="mail" placeholder="mail@mail.com"
                                           value="<%out.print(persona.getMail());%>">                 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" maxlength="10" name="fecha_alta" placeholder="Fecha Alta"
                                           value="<%out.print(persona.getFecha_alta());%>">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" maxlength="35" name="detalles" placeholder="Detalles"
                                           value="<%out.print(persona.getDetalles());%>">
                                </td>
                            </tr>
                            <tr>
                                <td><input  type="reset" 
                                            value="RESET" 
                                            style=" width: 42%;  
                                                    height: 100%;  
                                                    padding: 15px; 
                                                    margin-top: 10px;
                                                    background-color:rgb(159, 197, 58);
                                                    border-color:rgb(183, 206, 53);
                                                    color: white;
                                                    font-weight: bolder;"/>  
                                
                                <input  type="submit" 
                                            value="GUARDAR" 
                                            style=" width: 42%;
                                                    height: 100%;
                                                    padding: 15px;
                                                    margin-top: 10px;
                                                    text-align: center;
                                                    background-color:rgb(159, 197, 58);
                                                    border-color:rgb(183, 206, 53);
                                                    color: white;
                                                    "/>  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="number" name="id_selectClientePersona" maxlength="35" 
                                           style="visibility:hidden;"
                                           value="<%out.print(id_selectClientePersona);%>">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>

            </div>
        </main>
    </body>
</html>

