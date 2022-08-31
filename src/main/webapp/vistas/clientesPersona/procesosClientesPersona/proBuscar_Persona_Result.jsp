<%@page import="java.util.ArrayList"%>
<%@page import="ar.com.aguaMedina.enums.Dia"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.List"%>
<%@page import="ar.com.aguaMedina.utils.html.HtmlTable_ClientePersona"%>
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

        <title>AguaMedina App - Buscar Personas</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    
        <!-- CSS -->
        <link rel="stylesheet" href="../../../css/clientePersonaCSS/buscar_ClientePersonaCSS.css">
    
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

                <!-- BUSCADOR -->
                <div class="container__Buscador">
                    
                    <!-- SELECCIONAR FILTRO -->
                    <div class="container_Selector_filtro">
                        <form action="proBuscar_Persona_Filtro.jsp" method="get">
                            <table>
                                <tr>
                                    <td><h2> BUSCAR PERSONA </h2>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="filtro">
                                            <option value="Prueba" disabled="" selected="true">
                                                Seleccione un Filtro
                                            </option>
                                            <option value="Nombre" >Nombre          </option>
                                            <option value="Direccion">Dirección     </option>
                                            <option value="Localidad">Localidad     </option>
                                            <option value="Servicio">Servicio       </option>
                                            <option value="Recorrido">Recorrido     </option> 
                                            <option value="Dia">Dí­a                 </option> 
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
                        <form>
                            <table>
    <%                      
                            boolean testigo = false; 
                            
                            //  ♦ BUSCADOR GENERICO
                            String buscadorGenerico;
                            buscadorGenerico = request.getParameter("buscadorGenericoPersonas");
                            if (buscadorGenerico != null && !(buscadorGenerico.isEmpty())){
                                testigo= true;
                            
    %>                      
                            <tr><td><h2><%out.print("Resultados que contengan: '" + buscadorGenerico+"'");%></h2></td></tr>
    <%                      }
        
                            //  ♦ NOMBRE
                            String buscadorNombre;
                            buscadorNombre = request.getParameter("buscarNombre");
                            if (buscadorNombre != null && !(buscadorNombre.isEmpty())){
                                testigo= true;
    %>                      
                            <tr><td><h2><%out.print("NOMBRES que contengan: '" + buscadorNombre+"'");%></h2></td></tr>
    <%      
                            }

                        //  ♦ DIRECCIÓN
                            String buscadorDireccion;
                            buscadorDireccion = request.getParameter("buscarDireccion");
                            if (buscadorDireccion != null && !(buscadorDireccion.isEmpty())){
                                testigo= true;
    %>          
                            <tr><td><h2><%out.print("DIRECCIÓNES que contengan: ' " + buscadorDireccion+" '");%></h2></td></tr>
    <%
                            }

                        //  ♦ LOCALIDAD
                            String buscadorLocalidad;
                            buscadorLocalidad = request.getParameter("buscarLocalidad");
                            if (buscadorLocalidad != null && !(buscadorLocalidad.isEmpty())){
                                testigo= true;
    %>          
                            <tr><td><h2><%out.print("LOCALIDADES que contengan: ' " + buscadorLocalidad+" '");%></h2></td></tr>
    <%
                            }

                        //  ♦ TIPO DE SERVICIO
                            String buscadorServicio;
                            buscadorServicio = request.getParameter("buscarServicio");
                            if (buscadorServicio != null && !(buscadorServicio.isEmpty())){
                                testigo= true;
    %>          
                            <tr><td><h2><%out.print("Resultados TIPO DE SERVICIO: ' " + buscadorServicio+" '");%></h2></td></tr>
    <%
                            } 

                        //  ♦ RECORRIDO
                            String buscadorRecorrido;
                            buscadorRecorrido = request.getParameter("buscarRecorrido");
                            if (buscadorRecorrido != null && !(buscadorRecorrido.isEmpty())){
                                testigo= true;
                                Recorrido r = re_rep.getById(Integer.parseInt(buscadorRecorrido));
    %>          
                            <tr><td><h2><%out.print("Resultados RECORRIDO: ' "+ r.getId()+". "+r.getNombreZona()
                                    +", "+r.getDia()+" '");%></h2></td></tr>
    <%
                            } 

                        //  ♦ DIA 
                            String buscadorDia;
                            buscadorDia = request.getParameter("buscarDia");
                           if (buscadorDia != null && !(buscadorDia.isEmpty())){
                                testigo= true;
    %>          
                            <tr><td><h2><%out.print("Resultados DÍA: ' " + buscadorDia+" '");%></h2></td></tr>
    <%
                            }
                            
                            
                            if ((buscadorServicio == null || buscadorRecorrido == null || buscadorDia == null) & testigo == false){
                                response.sendRedirect("../buscar_ClientesPersona.jsp");
                            }
    %>   
                            </table>
                        </form>
                    </div>
                </div>
                    
                <!-- TABLA -->
                <div class="tabla_ClientesPersona">
                <%
            //  ♦ BUSCADOR GENERICO
                buscadorGenerico = request.getParameter("buscadorGenericoPersonas");
                if (buscadorGenerico != null && !(buscadorGenerico.isEmpty())){
                    out.print(HtmlTable_ClientePersona.tabla_Personas_BuscadoGenerico(buscadorGenerico));
                }
                
            //  ♦ NOMBRE
                buscadorNombre = request.getParameter("buscarNombre");
                if (buscadorNombre != null && !(buscadorNombre.isEmpty())){
                    out.print(HtmlTable_ClientePersona.tabla_ClientesPersonaLikeNombre(buscadorNombre));
                }

            //  ♦ DIRECCIÓN
                buscadorDireccion = request.getParameter("buscarDireccion");
               if (buscadorDireccion != null && !(buscadorDireccion.isEmpty())){
                    out.print(HtmlTable_ClientePersona.tabla_ClientesPersonaLikeDireccion(buscadorDireccion));
                }

            //  ♦ LOCALIDAD
                buscadorLocalidad = request.getParameter("buscarLocalidad");
               if (buscadorLocalidad != null && !(buscadorLocalidad.isEmpty())){
                    out.print(HtmlTable_ClientePersona.tabla_ClientesPersonaLikeLocalidad(buscadorLocalidad));
                }

            //  ♦ TIPO DE SERVICIO
                buscadorServicio = request.getParameter("buscarServicio");
               if (buscadorServicio != null && !(buscadorServicio.isEmpty())){
                    out.print(HtmlTable_ClientePersona.tabla_ClientesPersonaLikeTipoServicio(buscadorServicio));
                }

            //  ♦ RECORRIDO
                buscadorRecorrido = request.getParameter("buscarRecorrido");
                if (buscadorRecorrido != null && !(buscadorRecorrido.isEmpty())){
                    Recorrido r = re_rep.getById(Integer.parseInt(buscadorRecorrido));
                    out.print(HtmlTable_ClientePersona.tabla_ClientesPersonaRecorrido(Integer.parseInt(buscadorRecorrido)));
                }

            //  ♦ DIA 
                buscadorDia = request.getParameter("buscarDia");
                if (buscadorDia != null && !(buscadorDia.isEmpty())){
                    out.print(HtmlTable_ClientePersona.tabla_ClientesPersonaDia(buscadorDia));
                }
    %>   
                </div>

            </div>
        </main>
    </body>
</html>