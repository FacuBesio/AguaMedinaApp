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
                        String select_ClienteEmpresa = request.getParameter("id_selectClienteEmpresa");
                        int id_selectClienteEmpresa = 0;
                        
                        if (select_ClienteEmpresa == null || select_ClienteEmpresa.isEmpty()){
                        //response.sendRedirect("../editar_ClientesEmpresa.jsp");
                        }else{id_selectClienteEmpresa = Integer.parseInt(select_ClienteEmpresa);
                        }
                        
             
                        //● INGRESO DE PARAMETROS
                        ClienteEmpresa Empresa_update = new ClienteEmpresa();
                        Recorrido recorrido_update = new Recorrido();
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
                                  Empresa_update.setId(id_selectClienteEmpresa);
                                  Empresa_update.setRazon_social(razon_social);
                                  Empresa_update.setCuit(cuit);
                                  Empresa_update.setDireccion(direccion);
                                  Empresa_update.setLocalidad(localidad);
                                  Empresa_update.setContacto(contacto);
                                  Empresa_update.setTipo_servicio(tipo_servicio);
                                  Empresa_update.setBidones(bidones);
                                  Empresa_update.setMaquinas(maquinas);
                                  Empresa_update.setPrecio(precio);
                                  Empresa_update.setIdRecorrido(idRecorrido);
                                  Empresa_update.setMail(mail);
                                  Empresa_update.setFecha_alta(fecha_alta);
                                  Empresa_update.setDetalles(detalles);
                            }
                        } catch (NullPointerException | NumberFormatException e) {
                        //out.print("<h3> Por favor complete los Campos </h3>" );
                        } catch (Exception e) {
                        System.out.println("*********************");
                            out.print("<h3>Ocurrio un Error. " + e +"</h3>" );
                        System.out.println("*********************");
                        }
                        
                        ce_rep.update(Empresa_update);


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
                                                Seleccione una Empresa
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
                                        <input type="submit" value="EDITAR"/> 
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    
                    <!-- CONFIRMACION -->
                    <div class="container_Confirmacion">
                        <form action="../editar_ClientesEmpresa.jsp" method="get">
                            <table>
                                <tr>
                                    <td>
                                        <h2>Se ha EDITADO exitosamente a la Persona:</h2>
                                        <h3>
                                        <%
                                        recorrido_update = re_rep.getById(Empresa_update.getIdRecorrido());
                                        out.print(
                                                    Empresa_update.getId()+". " 
                                                    +Empresa_update.getRazon_social()+" | "
                                                    +Empresa_update.getDireccion()+" - "
                                                    +Empresa_update.getLocalidad()+" | Recorrido: "
                                                    +recorrido_update.getNombreZona()+" - " 
                                                    +recorrido_update.getDia()+" | "
                                                    +Empresa_update.getMail()+" | "
                                                    +Empresa_update.getDetalles()
                                                    +"</option>"
                                        );
                                        
                                        %>
                                        </h3>
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
