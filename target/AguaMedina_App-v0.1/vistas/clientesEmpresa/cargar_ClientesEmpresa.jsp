<%@page import="ar.com.aguaMedina.entities.ClienteEmpresa"%>
<%@page import="ar.com.aguaMedina.utils.html.HtmlTable_ClienteEmpresa"%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.ClienteEmpresaRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_ClienteEmpresaRepository"%>
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

        <title>AguaMedina App - Cargar Empresas</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    
        <!-- CSS -->
        <link rel="stylesheet" href="../../css/clienteEmpresaCSS/cargar_ClientesEmpresaCSS.css">
    
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
            <!-- CONTENEDOR PRINCIPAL -->
            <div class="contenedor__principal">

                <!-- CARGAR EMPRESA -->
                <div class="container__cargarEmpresa">
                    
                    <form>
                        <table>
                            <tr>
                                <td>
                                    <h2> CARGAR EMPRESA </h2>
                                </td>
                            </tr>
                            <tr><td><input type="text" name="razon_social" maxlength="35" placeholder="Razon Social"></td></tr>
                            <tr><td><input type="text" maxlength="15" name="cuit" placeholder="CUIT">      </td></tr>
                            <tr><td><input type="text" name="direccion" maxlength="35" placeholder="Direccion">    </td></tr>
                            <tr><td><input type="text" name="localidad" maxlength="35" placeholder="Localidad">    </td></tr>
                            <tr><td><input type="text" name="contacto" maxlength="20" placeholder="Contacto">      </td></tr>
                            <tr><td>
                                    <select name="tipo_servicio">
                                        <option disabled="" selected="true">Seleccione un Tipo de Servicio</option>
                                        <option>Bidon 12 lts</option>
                                        <option>Bidon 20 lts</option>
                                        <option>Servicio Agua</option>
                                    </select>
                                </td>
                            </tr>
                            <tr><td><input type="number" min="0" max="1000" name="bidones" placeholder="Bidones">   </td></tr>
                            <tr><td><input type="number" min="0" max="1000" name="maquinas" placeholder="Maquinas"> </td></tr>
                            <tr><td><input type="number" min="0" max="10000000" name="precio" placeholder="Precio ($)">  </td></tr>
                            <tr>
                                <td>
                                    <select name="idRecorrido">
                                        <option disabled="" selected="true">Seleccione un Recorrido</option>
                                    <% 
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
                            <tr><td><input type="text" maxlength="50" name="mail" placeholder="Mail">                 </td></tr>
                            <tr><td><input type="text" maxlength="10" name="fecha_alta" placeholder="Fecha Alta">     </td></tr>
                            <tr><td><input type="text" maxlength="35" name="detalles" placeholder="Detalles">         </td></tr>
                            <tr>
                                <td><input  type="reset" 
                                            value="RESET" 
                                            style=" width: 42%;  
                                                    height: 100%;  
                                                    padding: 11px; 
                                                    background-color:rgb(159, 197, 58);
                                                    border-color:rgb(183, 206, 53);
                                                    color: white;
                                                    margin-top: 10px;
                                                    font-weight: bolder;"/>  
                                
                                <input  type="submit" 
                                            value="GUARDAR" 
                                            style=" width: 42%;
                                                    height: 100%;
                                                    margin-top: 10px;
                                                    font-weight: bolder;
                                                    padding: 11px; 
                                                    text-align: center;
                                                    background-color:rgb(159, 197, 58);
                                                    border-color:rgb(183, 206, 53);
                                                    color: white;
                                                    "/>  
                                </td>
                            </tr>
                        </table>
                    </form>
    
            <%      
                try {
                    String razon_social = request.getParameter("razon_social");
                    String cuit = request.getParameter("cuit");
                    String direccion = request.getParameter("direccion");
                    String localidad = request.getParameter("localidad");
                    String contacto = request.getParameter("contacto");
                    String tipo_servicio = request.getParameter("tipo_servicio");
                    int bidones = Integer.parseInt(request.getParameter("bidones"));
                    int maquinas = Integer.parseInt(request.getParameter("maquinas"));
                    int precio = Integer.parseInt(request.getParameter("precio"));
                    int idRecorrido = Integer.parseInt(request.getParameter("idRecorrido"));
                    String mail = request.getParameter("mail");
                    String fecha_alta = request.getParameter("fecha_alta");
                    String detalles = request.getParameter("detalles");

                    if (razon_social == null || razon_social.isEmpty() || razon_social.contains("<")){
                        out.print("<h3> Falta ingresar Parametros </h3>");

                    }else{
                        ClienteEmpresa clienteEmpresa = new ClienteEmpresa( razon_social, cuit, direccion, localidad, contacto, 
                                                                            tipo_servicio, bidones, maquinas, precio, idRecorrido,
                                                                            mail, fecha_alta,detalles);
                        ce_rep.save(clienteEmpresa);
                        Recorrido r2 = re_rep.getById(clienteEmpresa.getIdRecorrido());
                        if (clienteEmpresa.getId()!= 0){
                            out.print("<h3>Se guardo exitosamente la Empresa: "+clienteEmpresa.getId()+ " - "
                                + clienteEmpresa.getRazon_social()+" "+ " - " +r2.getNombreZona() + "</h3>" );
                        }else{
                            out.print("<h3> No se pudo guardar la Empresa! </h3>");
                        }
                    }
                } catch (NullPointerException | NumberFormatException e) {
                    out.print("<h3> Completa los datos de la nueva Empresa </h3>" );
                } catch (Exception e) {
                System.out.println("*********************");
                    out.print("<h3>Ocurrio un Error. " + e +"</h3>" );
                System.out.println("*********************");
                }

                %>  
                  
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