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
                        String select_ClientePersona = request.getParameter("id_selectClientePersona");
                        //out.print(select_ClientePersona);
                        int id_selectClientePersona = 0;
                        
                        if (select_ClientePersona == null || select_ClientePersona.isEmpty()){
                        //response.sendRedirect("../editar_ClientesPersona.jsp");
                        }else{id_selectClientePersona = Integer.parseInt(select_ClientePersona);
                        }
                        //out.print(id_selectClientePersona);
             
                        //● INGRESO DE PARAMETROS
                        ClientePersona Persona_update = new ClientePersona();
                        Recorrido recorrido_update = new Recorrido();
                        try {
                            String nombre = request.getParameter("nombre");
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
                            if (nombre == null || nombre.isEmpty() || nombre.contains("<")){
                                out.print("<h3> Falta ingresar Parametros </h3>");
                            }else{
                                  Persona_update.setId(id_selectClientePersona);
                                  Persona_update.setNombre(nombre);
                                  Persona_update.setDireccion(direccion);
                                  Persona_update.setLocalidad(localidad);
                                  Persona_update.setContacto(contacto);
                                  Persona_update.setTipo_servicio(tipo_servicio);
                                  Persona_update.setBidones(bidones);
                                  Persona_update.setMaquinas(maquinas);
                                  Persona_update.setPrecio(precio);
                                  Persona_update.setIdRecorrido(idRecorrido);
                                  Persona_update.setMail(mail);
                                  Persona_update.setFecha_alta(fecha_alta);
                                  Persona_update.setDetalles(detalles);
                            }
                        } catch (NullPointerException | NumberFormatException e) {
                        //out.print("<h3> Por favor complete los Campos </h3>" );
                        } catch (Exception e) {
                        System.out.println("*********************");
                            out.print("<h3>Ocurrio un Error. " + e +"</h3>" );
                        System.out.println("*********************");
                        }
                        
                        cp_rep.update(Persona_update);


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
                        <form action="../editar_ClientesPersona.jsp" method="get">
                            <table>
                                <tr>
                                    <td>
                                        <h2>Se ha EDITADO exitosamente a la Persona:</h2>
                                        <h3>
                                        <%
                                            recorrido_update = re_rep.getById(Persona_update.getIdRecorrido());
                                            out.print(
                                                Persona_update.getId()+". " 
                                                +Persona_update.getNombre()+" | "
                                                +Persona_update.getDireccion()+" - "
                                                +Persona_update.getLocalidad()+" | Recorrido: "
                                                +Persona_update.getIdRecorrido()+" "
                                                +recorrido_update.getNombreZona()+" - " 
                                                +recorrido_update.getDia()+" | "
                                                +Persona_update.getMail()+" | "
                                                +Persona_update.getDetalles()
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

