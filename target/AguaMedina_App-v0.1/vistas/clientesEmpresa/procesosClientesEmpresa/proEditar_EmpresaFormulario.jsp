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

        <title>AguaMedina App - Editar Empresas</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    
        <!-- CSS -->
        <link rel="stylesheet" href="../../../css/clienteEmpresaCSS/editar_ClienteEmpresaCSS.css">
    
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

                <!-- EDITAR EMPRESAS -->
                <div class="container__EditarEmpresa">
                    
                    
                    <!-- SELECCIONAR EMPRESA -->
                    <div class="container_SelectorEmpresa">
                        <form action="proEditar_EmpresaFormulario.jsp" method="get">
                         <%
                        //  ● EDITAR  
                        String select_ClienteEmpresa = request.getParameter("select__clienteEmpresa");
                        int id_selectClienteEmpresa = 0;
                        
                        if (select_ClienteEmpresa == null || select_ClienteEmpresa.isEmpty()){
                        response.sendRedirect("../editar_ClientesEmpresa.jsp");
                        }else{id_selectClienteEmpresa = Integer.parseInt(select_ClienteEmpresa);
                        }
                        %> 
                            <table>
                                <tr>
                                    <td><h2> EDITAR EMPRESA </h2>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="select__clienteEmpresa">
                                            <option disabled selected style="color: black;">
                                                Seleccione la Empresa
                                            </option>
                                        <% 
                                        List<ClienteEmpresa>list_select_ClienteEmpresa = ce_rep.getAll();
                                        
                                        for(ClienteEmpresa e: list_select_ClienteEmpresa){
                                            Recorrido recorrido = re_rep.getById(e.getIdRecorrido());
                                            
                                            if (e.getId()== id_selectClienteEmpresa){
                                                out.print("<option value=" +e.getId()+" selected=\"true\">" 
                                                                        +e.getId()+". " 
                                                                        +e.getRazon_social()+" | "
                                                                        +e.getDireccion()+" - "
                                                                        +e.getLocalidad()+" | Recorrido: "
                                                                        +recorrido.getNombreZona()+" - " 
                                                                        + recorrido.getDia()+" | "
                                                                        +e.getMail()+" | "
                                                                        +e.getDetalles()
                                                                          +"</option>");
                                            }else{
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
                    
                
                <!-- FORMULARIO PARA EDITAR EMPRESAS -->
                <%           
                //● SELECCION DE CLIENTE EMPRESA  
                ClienteEmpresa empresa = ce_rep.getById(id_selectClienteEmpresa);
                    
                %>
                <div class="formulario_EditarEmpresa">
                    <form action="proEditar_EmpresaConfirmacion.jsp" method="get">
                        <table>
                            <tr><td>
                                <h2> ACTUALIZAR DATOS </h2>
                            </td>
                            </tr>
                            
                            <tr>
                                <td>
                                    <input type="text" name="razon_social" maxlength="35" 
                                           value="<%out.print(empresa.getRazon_social());%>">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="cuit" maxlength="15" 
                                           value="<%out.print(empresa.getCuit());%>">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="direccion" maxlength="35" 
                                           value="<%out.print(empresa.getDireccion());%>">  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="localidad" maxlength="35" 
                                           value="<%out.print(empresa.getLocalidad());%>">        
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="contacto" maxlength="20" 
                                           value="<%out.print(empresa.getContacto());%>">         
                                </td>
                            </tr>
                            <tr><td>
                                    <select name="tipo_servicio">
                                        <option disabled="">Seleccione un Tipo de Servicio</option>
                            <%
                                    if (empresa.getTipo_servicio() == null || empresa.getTipo_servicio().isEmpty() ){
                                        empresa.setTipo_servicio("");
                                    }
                                    if (empresa.getTipo_servicio().equalsIgnoreCase("Bidon 12 lts")){
                                        out.print("<option selected=\"true\">Bidon 12 lts</option> "
                                                + "<option>Bidon 20 lts</option>"
                                                + "<option>Servicio Agua</option>");
                                    }else if (empresa.getTipo_servicio().equalsIgnoreCase("Bidon 20 lts")){
                                        out.print("<option>Bidon 12 lts</option> "
                                                + "<option selected=\"true\">Bidon 20 lts</option>"
                                                + "<option>Servicio Agua</option>");
                                    }else if (empresa.getTipo_servicio().equalsIgnoreCase("Servicio Agua")){
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
                                    <input type="number" min="0" max="1000" name="bidones" 
                                           value="<%out.print(empresa.getBidones());%>">   
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="number" min="0" max="1000" name="maquinas" 
                                           value="<%out.print(empresa.getMaquinas());%>">  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="number" min="0" max="10000000" name="precio" 
                                           value="<%out.print(empresa.getPrecio());%>">  
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
                                            if (empresa.getIdRecorrido()== r.getId()){
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
                                    <input type="text" maxlength="50" name="mail" 
                                           value="<%out.print(empresa.getMail());%>">                 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" maxlength="10" name="fecha_alta" 
                                           value="<%out.print(empresa.getFecha_alta());%>">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" maxlength="35" name="detalles" 
                                           value="<%out.print(empresa.getDetalles());%>">
                                </td>
                            </tr>
                            <tr>
                                <td><input  type="reset" 
                                            value="RESET" 
                                            style=" width: 42%;  
                                                    height: 100%;  
                                                    padding: 11px; 
                                                    margin-top: 8px;
                                                    background-color:rgb(159, 197, 58);
                                                    border-color:rgb(183, 206, 53);
                                                    color: white;
                                                    font-weight: bolder;"/>  
                                
                                <input  type="submit" 
                                            value="GUARDAR" 
                                            style=" width: 42%;
                                                    height: 100%;
                                                    padding: 11px;
                                                    margin-top: 8px;
                                                    text-align: center;
                                                    background-color:rgb(159, 197, 58);
                                                    border-color:rgb(183, 206, 53);
                                                    color: white;
                                                    "/>  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="number" name="id_selectClienteEmpresa" maxlength="35" 
                                           style="visibility:hidden;"
                                           value="<%out.print(id_selectClienteEmpresa);%>">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>

            </div>
        </main>
    </body>
</html>

