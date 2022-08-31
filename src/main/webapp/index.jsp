<%@page import="ar.com.aguaMedina.repositories.jdbc.ClienteEmpresaRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_ClienteEmpresaRepository"%>
<%@page import="ar.com.aguaMedina.entities.ClienteEmpresa"%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.RecorridoRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_RecorridoRepository"%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.ClientePersonaRepository"%>
<%@page import="ar.com.aguaMedina.connectors.Conector"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_ClientePersonaRepository"%>                    
<%@page import="java.util.stream.Collectors"%>
<%@page import="ar.com.aguaMedina.entities.ClientePersona"%>
<%@page import="ar.com.aguaMedina.entities.Recorrido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ar.com.aguaMedina.utils.html.HtmlTable_ClientePersona"%>
<%I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());%>
<%I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());%>
<%I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>AguaMedina App - Home</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    <!-- CSS -->
        <link rel="stylesheet" href="css/indexCSS.css">
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
                    <img src="imagenes/logoAguaMedina.png" alt="">
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
            <div class="container__menu"> 
                <!-- MENU -->
                <div class="menu"> 
                   
                    <nav>
                        <ul>
                            <li><a href="index.jsp" style="background-color: rgb(183, 206, 53);" id="selected">     </a>
                            </li>
                            
                            <li><a href="vistas/recorridos/Home_Recorridos.jsp">Recorridos           </a>
                                <ul>
                                    <li><a href="vistas/recorridos/cargar_Recorridos.jsp">Cargar Recorridos</a></li>
                                    <li><a href="vistas/recorridos/buscar_Recorridos.jsp">Buscar Recorridos</a></li>
                                    <li><a href="vistas/recorridos/editar_Recorridos.jsp">Editar Recorridos</a></li>
                                    <li><a href="vistas/recorridos/borrar_Recorridos.jsp">Borrar Recorridos</a></li>
                                </ul>
                            </li>
                            
                            <li><a href="vistas/clientesPersona/Home_ClientesPersona.jsp">Personas</a>
                                <ul>
                                    <li><a href="vistas/clientesPersona/cargar_ClientesPersona.jsp">Cargar Personas</a></li>
                                    <li><a href="vistas/clientesPersona/buscar_ClientesPersona.jsp">Buscar Personas</a></li>
                                    <li><a href="vistas/clientesPersona/editar_ClientesPersona.jsp">Editar Personas</a></li>
                                    <li><a href="vistas/clientesPersona/borrar_ClientesPersona.jsp">Borrar Personas</a></li>
                                </ul>
                            </li>
                            
                            <li><a href="vistas/clientesEmpresa/Home_ClientesEmpresa.jsp">Empresas</a>
                                <ul>
                                    <li><a href="vistas/clientesEmpresa/cargar_ClientesEmpresa.jsp">Cargar Empresas</a></li>
                                    <li><a href="vistas/clientesEmpresa/buscar_ClientesEmpresa.jsp">Buscar Empresas</a></li>
                                    <li><a href="vistas/clientesEmpresa/editar_ClientesEmpresa.jsp">Editar Empresas</a></li>
                                    <li><a href="vistas/clientesEmpresa/borrar_ClientesEmpresa.jsp">Borrar Empresas</a></li>
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
                
                <!-- CONTAINER IZQUIERDO -->
                <div class="container__mainIzquierdo">
                    <form action="vistas/recorridos/procesosRecorridos/proBuscar_Recorrido_Result.jsp" method="get">
                    <table>
                        <tr><td><a href="vistas/recorridos/Home_Recorridos.jsp"
                                   style="font-size: 30px;
                                          color: #2E2E2E;
                                          font-weight: 900;
                                          background: #E8BD78;">RECORRIDOS         </a></td></tr>
                        
                        <tr><td><a href="vistas/recorridos/cargar_Recorridos.jsp">Cargar</a></td></tr>
                        <tr><td><a href="vistas/recorridos/buscar_Recorridos.jsp">Buscar</a></td></tr>
                        <tr><td><a href="vistas/recorridos/editar_Recorridos.jsp">Editar</a></td></tr>
                        <tr><td><a href="vistas/recorridos/borrar_Recorridos.jsp">Borrar</a></td></tr>
                        <tr><td><input type="text" name="buscadorGenericoRecorridos" placeholder="Buscar en Recorridos"></td></tr>
                    </table>
                    </form>
                </div>

                <!-- CONTAINER CENTRO -->
                <div class="container__mainCentro">
                    <form action="vistas/clientesPersona/procesosClientesPersona/proBuscar_Persona_Result.jsp" method="get">
                    <table>
                        <tr><td><a href="vistas/clientesPersona/Home_ClientesPersona.jsp"
                                   style="font-size: 30px;
                                          color: #2E2E2E;
                                          font-weight: 900;
                                          background: #96C0CE;">PERSONAS</a></td></tr>
                        
                        <tr><td><a href="vistas/clientesPersona/cargar_ClientesPersona.jsp">Cargar</a></td></tr>
                        <tr><td><a href="vistas/clientesPersona/buscar_ClientesPersona.jsp">Buscar</a></td></tr>
                        <tr><td><a href="vistas/clientesPersona/editar_ClientesPersona.jsp">Editar</a></td></tr>
                        <tr><td><a href="vistas/clientesPersona/borrar_ClientesPersona.jsp">Borrar</a></td></tr>
                        <tr><td><input type="text" name="buscadorGenericoPersonas" placeholder="Buscar en Personas"></td></tr>
                    </table>
                    </form>
                </div>
                    
                <!-- CONTAINER DERECHO -->
                <div class="container__mainDerecho">
                    <form action="vistas/clientesEmpresa/procesosClientesEmpresa/proBuscar_Empresa_Result.jsp" method="get">
                    <table>
                        <tr><td><a href="vistas/clientesEmpresa/Home_ClientesEmpresa.jsp"
                                   style="font-size: 30px;
                                          color: #2E2E2E;
                                          font-weight: 900;
                                          background: #C8D778;">EMPRESAS</a></td></tr>
                        
                        <tr><td><a href="vistas/clientesEmpresa/cargar_ClientesEmpresa.jsp">Cargar</a></td></tr>
                        <tr><td><a href="vistas/clientesEmpresa/buscar_ClientesEmpresa.jsp">Buscar</a></td></tr>
                        <tr><td><a href="vistas/clientesEmpresa/editar_ClientesEmpresa.jsp">Editar</a></td></tr>
                        <tr><td><a href="vistas/clientesEmpresa/borrar_ClientesEmpresa.jsp">Borrar</a></td></tr>
                        <tr><td><input type="text" name="buscadorGenericoEmpresas" placeholder="Buscar en Empresas"></td></tr>
                    </table>
                    </form>
                </div>

            </div>
        </main>
    </body>
</html>