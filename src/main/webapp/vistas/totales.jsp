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
<%
        /****************************************** CLIENTES PERSONAS ************************************************/
        //LUNES
        List <Recorrido> recorridos_Lunes  = new ArrayList();
        List <ClientePersona> clientesPersona_Lunes = new ArrayList();
        int bidones_Lunes = 0;
        int maquinas_Lunes = 0;
        recorridos_Lunes =  re_rep.getAll()
                                        .stream()
                                        .filter(a->a.getDia().toString().equalsIgnoreCase("Lunes"))
                                        .collect(Collectors.toList());
        for (Recorrido r : recorridos_Lunes){
            for (ClientePersona p : cp_rep.getAll()){
                if (p.getIdRecorrido() == r.getId()){
                    clientesPersona_Lunes.add(p);
                    bidones_Lunes = bidones_Lunes + p.getBidones();
                    maquinas_Lunes = maquinas_Lunes + p.getMaquinas();
                }
            }
        }
        //clientesPersona_Lunes.forEach(System.out::println);
        //System.out.println("");
        //recorridos_Lunes.forEach(System.out::println);
        long clientesPersona_LunesCantidad = clientesPersona_Lunes.stream().count();


        //MARTES
        List <Recorrido> recorridos_Martes  = new ArrayList();
        List <ClientePersona> clientesPersona_Martes = new ArrayList();
        int bidones_Martes = 0;
        int maquinas_Martes = 0;
        recorridos_Martes =  re_rep.getAll()
                                        .stream()
                                        .filter(a->a.getDia().toString().equalsIgnoreCase("Martes"))
                                        .collect(Collectors.toList());
        for (Recorrido r : recorridos_Martes){
            for (ClientePersona p : cp_rep.getAll()){
                if (p.getIdRecorrido() == r.getId()){
                    clientesPersona_Martes.add(p);
                    bidones_Martes = bidones_Martes + p.getBidones();
                    maquinas_Martes = maquinas_Martes + p.getMaquinas();
                }
            }
        }
        //clientesPersona_Martes.forEach(System.out::println);
        //System.out.println("");
        //recorridos_Martes.forEach(System.out::println);
        long clientesPersona_MartesCantidad = clientesPersona_Martes.stream().count();

        //MIERCOLES
        List <Recorrido> recorridos_Miercoles  = new ArrayList();
        List <ClientePersona> clientesPersona_Miercoles = new ArrayList();
        int bidones_Miercoles = 0;
        int maquinas_Miercoles = 0;
        recorridos_Miercoles =  re_rep.getAll()
                                        .stream()
                                        .filter(a->a.getDia().toString().equalsIgnoreCase("Miercoles"))
                                        .collect(Collectors.toList());
        for (Recorrido r : recorridos_Miercoles){
            for (ClientePersona p : cp_rep.getAll()){
                if (p.getIdRecorrido() == r.getId()){
                    clientesPersona_Miercoles.add(p);
                    bidones_Miercoles = bidones_Miercoles + p.getBidones();
                    maquinas_Miercoles = maquinas_Miercoles + p.getMaquinas();
                }
            }
        }
        //clientesPersona_Miercoles.forEach(System.out::println);
        //System.out.println("");
        //recorridos_Miercoles.forEach(System.out::println);
        long clientesPersona_MiercolesCantidad = clientesPersona_Miercoles.stream().count();

        //JUEVES
        List <Recorrido> recorridos_Jueves  = new ArrayList();
        List <ClientePersona> clientesPersona_Jueves = new ArrayList();
        int bidones_Jueves = 0;
        int maquinas_Jueves = 0;
        recorridos_Jueves =  re_rep.getAll()
                                        .stream()
                                        .filter(a->a.getDia().toString().equalsIgnoreCase("Jueves"))
                                        .collect(Collectors.toList());
        for (Recorrido r : recorridos_Jueves){
            for (ClientePersona p : cp_rep.getAll()){
                if (p.getIdRecorrido() == r.getId()){
                    clientesPersona_Jueves.add(p);
                    bidones_Jueves = bidones_Jueves + p.getBidones();
                    maquinas_Jueves = maquinas_Jueves + p.getMaquinas();
                }
            }
        }
        //lientesPersona_Jueves.forEach(System.out::println);
        //System.out.println("");
        //recorridos_Jueves.forEach(System.out::println);
        long clientesPersona_JuevesCantidad = clientesPersona_Jueves.stream().count();
        //System.out.println(clientesPersona_JuevesCantidad);

        //VIERNES
        List <Recorrido> recorridos_Viernes  = new ArrayList();
        List <ClientePersona> clientesPersona_Viernes = new ArrayList();
        int bidones_Viernes = 0;
        int maquinas_Viernes = 0;
        recorridos_Viernes =  re_rep.getAll()
                                        .stream()
                                        .filter(a->a.getDia().toString().equalsIgnoreCase("Viernes"))
                                        .collect(Collectors.toList());
        for (Recorrido r : recorridos_Viernes){
            for (ClientePersona p : cp_rep.getAll()){
                if (p.getIdRecorrido() == r.getId()){
                    clientesPersona_Viernes.add(p);
                    bidones_Viernes = bidones_Viernes + p.getBidones();
                    maquinas_Viernes = maquinas_Viernes + p.getMaquinas();
                }
            }
        }
        clientesPersona_Viernes.forEach(System.out::println);
        //System.out.println("");
        //recorridos_Viernes.forEach(System.out::println);
        long clientesPersona_ViernesCantidad = clientesPersona_Viernes.stream().count();
        //System.out.println(clientesPersona_ViernesCantidad);

        //SABADOS
        List <Recorrido> recorridos_Sabados  = new ArrayList();
        List <ClientePersona> clientesPersona_Sabados = new ArrayList();
        int bidones_Sabados = 0;
        int maquinas_Sabados = 0;
        recorridos_Sabados =  re_rep.getAll()
                                        .stream()
                                        .filter(a->a.getDia().toString().equalsIgnoreCase("Sabados"))
                                        .collect(Collectors.toList());
        for (Recorrido r : recorridos_Sabados){
            for (ClientePersona p : cp_rep.getAll()){
                if (p.getIdRecorrido() == r.getId()){
                    clientesPersona_Sabados.add(p);
                    bidones_Sabados = bidones_Sabados + p.getBidones();
                    maquinas_Sabados = maquinas_Sabados + p.getMaquinas();
                }
            }
        }
        //clientesPersona_Sabados.forEach(System.out::println);
        //System.out.println("");
        //recorridos_Sabados.forEach(System.out::println);
        long clientesPersona_SabadosCantidad = clientesPersona_Sabados.stream().count();
        //System.out.println(clientesPersona_SabadosCantidad);
        /****************************************** CLIENTES PERSONA ************************************************/


        /****************************************** CLIENTES EMPRESA ************************************************/
        //LUNES
        List <Recorrido> recorridos_LunesEmpresa  = new ArrayList();
        List <ClienteEmpresa> clientesEmpresa_Lunes = new ArrayList();
        int bidones_LunesEmpresa = 0;
        int maquinas_LunesEmpresa = 0;
        recorridos_LunesEmpresa =  re_rep.getAll()
                                        .stream()
                                        .filter(a->a.getDia().toString().equalsIgnoreCase("Lunes"))
                                        .collect(Collectors.toList());
        for (Recorrido r : recorridos_LunesEmpresa){
            for (ClienteEmpresa e : ce_rep.getAll()){
                if (e.getIdRecorrido() == r.getId()){
                    clientesEmpresa_Lunes.add(e);
                    bidones_LunesEmpresa = bidones_LunesEmpresa + e.getBidones();
                    maquinas_LunesEmpresa = maquinas_LunesEmpresa + e.getMaquinas();
                }
            }
        }
        //clientesPersona_Lunes.forEach(System.out::println);
        //System.out.println("");
        //recorridos_Lunes.forEach(System.out::println);
        long clientesEmpresa_LunesCantidad = clientesEmpresa_Lunes.stream().count();


        //MARTES
        List <Recorrido> recorridos_MartesEmpresa  = new ArrayList();
        List <ClienteEmpresa> clientesEmpresa_Martes = new ArrayList();
        int bidones_MartesEmpresa = 0;
        int maquinas_MartesEmpresa = 0;
        recorridos_MartesEmpresa =  re_rep.getAll()
                                        .stream()
                                        .filter(a->a.getDia().toString().equalsIgnoreCase("Martes"))
                                        .collect(Collectors.toList());
        for (Recorrido r : recorridos_MartesEmpresa){
            for (ClienteEmpresa e : ce_rep.getAll()){
                if (e.getIdRecorrido() == r.getId()){
                    clientesEmpresa_Martes.add(e);
                    bidones_MartesEmpresa = bidones_MartesEmpresa + e.getBidones();
                    maquinas_MartesEmpresa = maquinas_MartesEmpresa + e.getMaquinas();
                }
            }
        }
        //clientesPersona_Martes.forEach(System.out::println);
        //System.out.println("");
        //recorridos_Martes.forEach(System.out::println);
        long clientesEmpresa_MartesCantidad = clientesEmpresa_Martes.stream().count();

        //MIERCOLES
        List <Recorrido> recorridos_MiercolesEmpresa  = new ArrayList();
        List <ClienteEmpresa> clientesEmpresa_Miercoles = new ArrayList();
        int bidones_MiercolesEmpresa = 0;
        int maquinas_MiercolesEmpresa = 0;
        recorridos_MiercolesEmpresa =  re_rep.getAll()
                                        .stream()
                                        .filter(a->a.getDia().toString().equalsIgnoreCase("Miercoles"))
                                        .collect(Collectors.toList());
        for (Recorrido r : recorridos_MiercolesEmpresa){
            for (ClienteEmpresa e : ce_rep.getAll()){
                if (e.getIdRecorrido() == r.getId()){
                    clientesEmpresa_Miercoles.add(e);
                    bidones_MiercolesEmpresa = bidones_MiercolesEmpresa + e.getBidones();
                    maquinas_MiercolesEmpresa = maquinas_MiercolesEmpresa + e.getMaquinas();
                }
            }
        }
        //clientesPersona_Miercoles.forEach(System.out::println);
        //System.out.println("");
        //recorridos_Miercoles.forEach(System.out::println);
        long clientesEmpresa_MiercolesCantidad = clientesEmpresa_Miercoles.stream().count();

        //JUEVES
        List <Recorrido> recorridos_JuevesEmpresa  = new ArrayList();
        List <ClienteEmpresa> clientesEmpresa_Jueves = new ArrayList();
        int bidones_JuevesEmpresa = 0;
        int maquinas_JuevesEmpresa = 0;
        recorridos_JuevesEmpresa =  re_rep.getAll()
                                        .stream()
                                        .filter(a->a.getDia().toString().equalsIgnoreCase("Jueves"))
                                        .collect(Collectors.toList());
        for (Recorrido r : recorridos_JuevesEmpresa){
            for (ClienteEmpresa e : ce_rep.getAll()){
                if (e.getIdRecorrido() == r.getId()){
                    clientesEmpresa_Jueves.add(e);
                    bidones_JuevesEmpresa = bidones_JuevesEmpresa + e.getBidones();
                    maquinas_JuevesEmpresa = maquinas_JuevesEmpresa + e.getMaquinas();
                }
            }
        }
        //lientesPersona_Jueves.forEach(System.out::println);
        //System.out.println("");
        //recorridos_Jueves.forEach(System.out::println);
        long clientesEmpresa_JuevesCantidad = clientesEmpresa_Jueves.stream().count();
        //System.out.println(clientesPersona_JuevesCantidad);

        //VIERNES
        List <Recorrido> recorridos_ViernesEmpresa  = new ArrayList();
        List <ClienteEmpresa> clientesEmpresa_Viernes = new ArrayList();
        int bidones_ViernesEmpresa = 0;
        int maquinas_ViernesEmpresa = 0;
        recorridos_ViernesEmpresa =  re_rep.getAll()
                                        .stream()
                                        .filter(a->a.getDia().toString().equalsIgnoreCase("Viernes"))
                                        .collect(Collectors.toList());
        for (Recorrido r : recorridos_ViernesEmpresa){
            for (ClienteEmpresa e : ce_rep.getAll()){
                if (e.getIdRecorrido() == r.getId()){
                    clientesEmpresa_Viernes.add(e);
                    bidones_ViernesEmpresa = bidones_ViernesEmpresa + e.getBidones();
                    maquinas_ViernesEmpresa = maquinas_ViernesEmpresa + e.getMaquinas();
                }
            }
        }
        //clientesPersona_Viernes.forEach(System.out::println);
        //System.out.println("");
        //recorridos_Viernes.forEach(System.out::println);
        long clientesEmpresa_ViernesCantidad = clientesEmpresa_Viernes.stream().count();
        //System.out.println(clientesPersona_ViernesCantidad);

        //SABADOS
        List <Recorrido> recorridos_SabadosEmpresa  = new ArrayList();
        List <ClienteEmpresa> clientesEmpresa_Sabados = new ArrayList();
        int bidones_SabadosEmpresa = 0;
        int maquinas_SabadosEmpresa = 0;
        recorridos_SabadosEmpresa =  re_rep.getAll()
                                        .stream()
                                        .filter(a->a.getDia().toString().equalsIgnoreCase("Sabados"))
                                        .collect(Collectors.toList());
        for (Recorrido r : recorridos_SabadosEmpresa){
            for (ClienteEmpresa e : ce_rep.getAll()){
                if (e.getIdRecorrido() == r.getId()){
                    clientesEmpresa_Sabados.add(e);
                    bidones_SabadosEmpresa = bidones_SabadosEmpresa + e.getBidones();
                    maquinas_SabadosEmpresa = maquinas_SabadosEmpresa + e.getMaquinas();
                }
            }
        }
        //clientesPersona_Sabados.forEach(System.out::println);
        //System.out.println("");
        //recorridos_Sabados.forEach(System.out::println);
        long clientesEmpresa_SabadosCantidad = clientesEmpresa_Sabados.stream().count();
        //System.out.println(clientesPersona_SabadosCantidad);


        int bidones_totalEmpresa = bidones_LunesEmpresa + bidones_MartesEmpresa + bidones_MiercolesEmpresa 
                            + bidones_JuevesEmpresa + bidones_ViernesEmpresa + bidones_SabadosEmpresa;
        int maquinas_totalEmpresa = maquinas_LunesEmpresa + maquinas_MartesEmpresa + maquinas_MiercolesEmpresa 
                                    + maquinas_JuevesEmpresa + maquinas_ViernesEmpresa + maquinas_SabadosEmpresa;

        long clientesEmpresa_Total = ce_rep.getAll().stream().count();


        /****************************************** CLIENTES EMPRESA ************************************************/
%>
            <!-- CONTENEDOR PRINCIPAL -->
            <div class="contenedor__principal">

                <!-- CONTAINER IZQUIERDO -->
                <div class="container__mainIzquierdo">
                    <table>
                        <tr><td><h3> Lunes </h3></td></tr>
                        <tr>
                            <td>
                                <h4>
                    <%
                        out.print("Clientes: " + (clientesPersona_LunesCantidad + clientesEmpresa_LunesCantidad)
                            +" - Bidones: "+ (bidones_Lunes + bidones_LunesEmpresa)
                            +" - Máquinas: "+ (maquinas_Lunes + maquinas_LunesEmpresa));
                    %>
                                </h4>
                            </td>
                        </tr>
                        
                        <tr><td><h3> Martes </h3></td></tr>
                        <tr>
                            <td>
                                <h4>
                    <%
                        out.print("Clientes: "+ (clientesPersona_MartesCantidad + clientesEmpresa_MartesCantidad)
                            +" - Bidones: " + (bidones_Martes + bidones_MartesEmpresa)
                            +" - Máquinas: "+ (maquinas_Martes + maquinas_MartesEmpresa));
                    %>
                                </h4>
                            </td>
                        </tr>
                        
                        <tr><td><h3> Miércoles </h3></td></tr>
                        <tr>
                            <td>
                                <h4>
                    <%
                        out.print("Clientes: "+ (clientesPersona_MiercolesCantidad + clientesEmpresa_MiercolesCantidad)
                            +" - Bidones: "+ (bidones_Miercoles + bidones_MiercolesEmpresa)
                            +" - Máquinas: "+ (maquinas_Miercoles + maquinas_MiercolesEmpresa));
                    %>
                                </h4>
                            </td>
                        </tr>
                        
                        <tr><td><h3> Jueves </h3></td></tr>
                        <tr>
                            <td>
                                <h4>
                    <%
                        out.print("Clientes: "+ (clientesPersona_JuevesCantidad + clientesEmpresa_JuevesCantidad)
                            +" - Bidones: "+ (bidones_Jueves + bidones_JuevesEmpresa)
                            +" - Máquinas: "+ (maquinas_Jueves + maquinas_JuevesEmpresa));
                    %>
                                </h4>
                            </td>
                        </tr>
                        
                        <tr><td><h3> Viernes </h3></td></tr>
                        <tr>
                            <td>
                                <h4>
                    <%
                        out.print("Peronas: "+ (clientesPersona_ViernesCantidad + clientesEmpresa_ViernesCantidad )
                            +" - Bidones: "+ (bidones_Viernes + bidones_ViernesEmpresa)
                            +" - Máquinas: "+ (maquinas_Viernes + maquinas_ViernesEmpresa));
                    %>
                                </h4>
                            </td>
                        </tr>
                        
                        <tr><td><h3> Sábados </h3></td></tr>
                        <tr>
                            <td>
                                <h4>
                    <%
                        out.print("Clientes: "+ (clientesPersona_SabadosCantidad + clientesEmpresa_SabadosCantidad)
                            +" - Bidones: "+ (bidones_Sabados + bidones_SabadosEmpresa)
                            +" - Maquinas: "+ (maquinas_Sabados + maquinas_SabadosEmpresa));
                    %>
                                </h4>
                            </td>
                        </tr>
                    </table>
                </div>
                    
                <!-- CONTAINER DERECHO -->
                <div class="container__mainDerecho">
    <%      
                long clientesPersona_Total = cp_rep.getAll().stream().count();
                
                long totalClientes = clientesEmpresa_Total + clientesPersona_Total;
                
                
                int bidones_total = bidones_Lunes + bidones_Martes + bidones_Miercoles + bidones_Jueves + bidones_Viernes 
                                    + bidones_Sabados + bidones_totalEmpresa ;
                int maquinas_total = maquinas_Lunes + maquinas_Martes + maquinas_Miercoles + maquinas_Jueves 
                                    + maquinas_Viernes + maquinas_Sabados + maquinas_totalEmpresa;
    %>
          
                    <table>
                        <tr><td><%out.print("TOTAL CLIENTES: "+totalClientes);%></td></tr>
                        <tr><td><%out.print("BIDONES: "+bidones_total);%></td></tr>
                        <tr><td><%out.print("MAQUINAS: "+maquinas_total);%></td></tr>
                    </table>
                </div>

            </div>
        </main>
    </body>
</html>