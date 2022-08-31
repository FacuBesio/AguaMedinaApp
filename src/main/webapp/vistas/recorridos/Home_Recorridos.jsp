<%@page import="ar.com.aguaMedina.utils.html.HtmlTable_Recorrido"%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.ClienteEmpresaRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_ClienteEmpresaRepository"%>
<%@page import="ar.com.aguaMedina.entities.ClienteEmpresa"%>
<%@page import="java.util.ArrayList"%>
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
<%I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());%>
<%I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());%>
<%I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>AguaMedina App - Recorridos</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    
        <!-- CSS -->
        <link rel="stylesheet" href="../../css/recorridosCSS/Home_RecorridosCSS.css">
    
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
<%
            long recorridos_Total = re_rep.getAll().stream().count();
            
            //LUNES
            List <Recorrido> recorridos_Lunes  = new ArrayList();
            int bidones_Lunes = 0;
            int maquinas_Lunes = 0;
            
            recorridos_Lunes =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Lunes"))
                                            .collect(Collectors.toList());
            
            long recorridos_LunesCantidad = recorridos_Lunes.stream().count();
                                            
            for (Recorrido r : recorridos_Lunes){
                
                for (ClientePersona p : cp_rep.getAll()){
                    if (p.getIdRecorrido() == r.getId()){
                        bidones_Lunes = bidones_Lunes + p.getBidones();
                        maquinas_Lunes = maquinas_Lunes + p.getMaquinas();
                    }
                }
                
                for (ClienteEmpresa e : ce_rep.getAll()){
                    if (e.getIdRecorrido() == r.getId()){
                        bidones_Lunes = bidones_Lunes + e.getBidones();
                        maquinas_Lunes = maquinas_Lunes + e.getMaquinas();
                    }
                }
            }
            

            //MARTES
            List <Recorrido> recorridos_Martes  = new ArrayList();
            int bidones_Martes = 0;
            int maquinas_Martes = 0;
            
            recorridos_Martes =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Martes"))
                                            .collect(Collectors.toList());
            
            long recorridos_MartesCantidad = recorridos_Martes.stream().count();
                                            
            for (Recorrido r : recorridos_Martes){
                
                for (ClientePersona p : cp_rep.getAll()){
                    if (p.getIdRecorrido() == r.getId()){
                        bidones_Martes = bidones_Martes + p.getBidones();
                        maquinas_Martes = maquinas_Martes + p.getMaquinas();
                    }
                }
                
                for (ClienteEmpresa e : ce_rep.getAll()){
                    if (e.getIdRecorrido() == r.getId()){
                        bidones_Martes = bidones_Martes + e.getBidones();
                        maquinas_Martes = maquinas_Martes + e.getMaquinas();
                    }
                }
            }

            //MIERCOLES
            List <Recorrido> recorridos_Miercoles  = new ArrayList();
            int bidones_Miercoles = 0;
            int maquinas_Miercoles = 0;
            
            recorridos_Miercoles =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Miercoles"))
                                            .collect(Collectors.toList());
            
            long recorridos_MiercolesCantidad = recorridos_Miercoles.stream().count();
                                            
            for (Recorrido r : recorridos_Miercoles){
                
                for (ClientePersona p : cp_rep.getAll()){
                    if (p.getIdRecorrido() == r.getId()){
                        bidones_Miercoles = bidones_Miercoles + p.getBidones();
                        maquinas_Miercoles = maquinas_Miercoles + p.getMaquinas();
                    }
                }
                
                for (ClienteEmpresa e : ce_rep.getAll()){
                    if (e.getIdRecorrido() == r.getId()){
                        bidones_Miercoles = bidones_Miercoles + e.getBidones();
                        maquinas_Miercoles = maquinas_Miercoles + e.getMaquinas();
                    }
                }
            }

            //JUEVES
            List <Recorrido> recorridos_Jueves = new ArrayList();
            int bidones_Jueves = 0;
            int maquinas_Jueves = 0;
            
            recorridos_Jueves =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Jueves"))
                                            .collect(Collectors.toList());
            
            long recorridos_JuevesCantidad = recorridos_Jueves.stream().count();
                                            
            for (Recorrido r : recorridos_Jueves){
                
                for (ClientePersona p : cp_rep.getAll()){
                    if (p.getIdRecorrido() == r.getId()){
                        bidones_Jueves = bidones_Jueves + p.getBidones();
                        maquinas_Jueves = maquinas_Jueves + p.getMaquinas();
                    }
                }
                
                for (ClienteEmpresa e : ce_rep.getAll()){
                    if (e.getIdRecorrido() == r.getId()){
                        bidones_Jueves = bidones_Jueves + e.getBidones();
                        maquinas_Jueves = maquinas_Jueves + e.getMaquinas();
                    }
                }
            }

            //VIERNES
            List <Recorrido> recorridos_Viernes = new ArrayList();
            int bidones_Viernes = 0;
            int maquinas_Viernes = 0;
            
            recorridos_Viernes =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Viernes"))
                                            .collect(Collectors.toList());
            
            long recorridos_ViernesCantidad = recorridos_Viernes.stream().count();
                                            
            for (Recorrido r : recorridos_Viernes){
                
                for (ClientePersona p : cp_rep.getAll()){
                    if (p.getIdRecorrido() == r.getId()){
                        bidones_Viernes = bidones_Viernes + p.getBidones();
                        maquinas_Viernes = maquinas_Viernes + p.getMaquinas();
                    }
                }
                
                for (ClienteEmpresa e : ce_rep.getAll()){
                    if (e.getIdRecorrido() == r.getId()){
                        bidones_Viernes = bidones_Viernes + e.getBidones();
                        maquinas_Viernes = maquinas_Viernes + e.getMaquinas();
                    }
                }
            }

            //SABADOS
            List <Recorrido> recorridos_Sabados = new ArrayList();
            int bidones_Sabados = 0;
            int maquinas_Sabados = 0;
            
            recorridos_Sabados =  re_rep.getAll()
                                            .stream()
                                            .filter(a->a.getDia().toString().equalsIgnoreCase("Sabados"))
                                            .collect(Collectors.toList());
            
            long recorridos_SabadosCantidad = recorridos_Sabados.stream().count();
                                            
            for (Recorrido r : recorridos_Sabados){
                
                for (ClientePersona p : cp_rep.getAll()){
                    if (p.getIdRecorrido() == r.getId()){
                        bidones_Sabados = bidones_Sabados + p.getBidones();
                        maquinas_Sabados = maquinas_Sabados + p.getMaquinas();
                    }
                }
                
                for (ClienteEmpresa e : ce_rep.getAll()){
                    if (e.getIdRecorrido() == r.getId()){
                        bidones_Sabados = bidones_Sabados + e.getBidones();
                        maquinas_Sabados = maquinas_Sabados + e.getMaquinas();
                    }
                }
            }


            int bidones_total = bidones_Lunes + bidones_Martes + bidones_Miercoles + bidones_Jueves + bidones_Viernes 
                                + bidones_Sabados;
            int maquinas_total = maquinas_Lunes + maquinas_Martes + maquinas_Miercoles + maquinas_Jueves 
                                + maquinas_Viernes + maquinas_Sabados;
%>

            <!-- CONTENEDOR PRINCIPAL -->
            <div class="contenedor__principal">

                <!-- CLIENTES PERSONA -->
                <div class="container__main_ClientesPersona">
                    <table>
                        <tr>
                            <td>
                                <a href="procesosRecorridos/proBuscar_Recorrido_Result.jsp?buscarDia=Lunes">Lunes</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                    <%
                        out.print("Recorridos: "+ recorridos_LunesCantidad 
                                    +" - Bidones: "+ bidones_Lunes
                                    +" - Maquinas: "+ maquinas_Lunes);
                    %>
                                </h4>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <a href="procesosRecorridos/proBuscar_Recorrido_Result.jsp?buscarDia=Martes">Martes</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                    <%
                        out.print("Recorridos: "+ recorridos_MartesCantidad
                                        +" - Bidones: "+ bidones_Martes
                                        +" - Maquinas: "+ maquinas_Martes);
                    %>
                                </h4>
                            </td>
                        </tr>
    
                        <tr>
                            <td>
                                <a href="procesosRecorridos/proBuscar_Recorrido_Result.jsp?buscarDia=Miercoles">Miércoles</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                   <%
                        out.print("Recorridos: "+ recorridos_MiercolesCantidad
                                        +" - Bidones: "+ bidones_Miercoles
                                        +" - Maquinas: "+ maquinas_Miercoles);
                    %>
                                </h4>
                            </td>
                        </tr>
                    
                        <tr>
                            <td>
                                <a href="procesosRecorridos/proBuscar_Recorrido_Result.jsp?buscarDia=Jueves">Jueves</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                   <%
                        out.print("Recorridos: "+ recorridos_JuevesCantidad
                                        +" - Bidones: "+ bidones_Jueves
                                        +" - Maquinas: "+ maquinas_Jueves);
                    %>
                                </h4>
                            </td>
                        </tr>
                    
                        <tr>
                            <td>
                                <a href="procesosRecorridos/proBuscar_Recorrido_Result.jsp?buscarDia=Viernes">Viernes</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                   <%
                        out.print("Recorridos: "+ recorridos_ViernesCantidad 
                                        +" - Bidones: "+ bidones_Viernes
                                        +" - Maquinas: "+ maquinas_Viernes);
                    %>
                                </h4>
                            </td>
                        </tr>
    
                        <tr>
                            <td>
                                <a href="procesosRecorridos/proBuscar_Recorrido_Result.jsp?buscarDia=Sabados">Sábados</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4>
                   <%
                        out.print("Recorridos: "+ recorridos_SabadosCantidad
                                        +" - Bidones: "+ bidones_Sabados
                                        +" - Maquinas: "+ maquinas_Sabados);
                    %>
                                </h4>
                            </td>
                        </tr>
                        
                        
                        
                        <tr>
                            <td>
                                <h2 style="margin-top: -5px;"><%out.print("BIDONES: " + bidones_total);%> </h2>
                            </td>
                        </tr>
                        <tr><td><h2><%out.print("MÁQUINAS: " + maquinas_total);%> </h2></td></tr>
                        <tr>
                            <td>
                                <h3><%out.print("TOTAL RECORRIDOS: "+ recorridos_Total);%></h3>
                            </td>
                        </tr>
                    </table>
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