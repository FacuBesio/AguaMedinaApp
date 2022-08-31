<%@page import="ar.com.aguaMedina.utils.html.HtmlTable_Recorrido"%>
<%@page import="ar.com.aguaMedina.enums.Dia"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.List"%>
<%@page import="ar.com.aguaMedina.entities.Recorrido"%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.RecorridoRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_RecorridoRepository"%>
<%@page import="ar.com.aguaMedina.connectors.Conector"%>
<%@page import="ar.com.aguaMedina.utils.html.HtmlTable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>AguaMedina App - Cargar Recorridos</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    
        <!-- CSS -->
        <link rel="stylesheet" href="../../css/recorridosCSS/cargar_RecorridosCSS.css">
    
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
                            
                            <li><a href="Home_Recorridos.jsp"id="selectedRe">Recorridos           </a>
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
            <!-- CONTENEDOR PRINCIPAL -->
            <div class="contenedor__principal">

                <!-- CARGAR RECORRIDO -->
                <div class="container__cargarRecorrido">
                    
                    <form>
                        <table>
                            <tr>
                                <td>
                                    <h2> CARGAR RECORRIDO </h2>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="nombreZona" maxlength="35" placeholder="Nombre Zona">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <select name="dia">
                            <%    for(Dia d: Dia.values())
                                out.print("<option value=" +d+">"+d.toString().toLowerCase()+"</option>");
                            %>
                                    </select>
                                </td>
                            </tr>
                            <tr><td><input type="text" name="responsable" maxlength="35" placeholder="Responsable">    </td></tr>
                            <tr><td><input type="text" name="asistente" maxlength="20" placeholder="Asistente">      </td></tr>
                            <tr>
                                <td><input  type="reset" 
                                            value="RESET" 
                                            style=" width: 42%;  
                                                    height: 100%;  
                                                    padding: 25px; 
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
                                                    padding: 25px; 
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
                    String nombreZona = request.getParameter("nombreZona");
                    Dia dia = Dia.valueOf(request.getParameter("dia"));
                    String responsableZona = request.getParameter("responsable");
                    String asistenteZona = request.getParameter("asistente");

                    if (nombreZona == null || nombreZona.isEmpty() || responsableZona == null || responsableZona.isEmpty()
                        || asistenteZona == null || asistenteZona.isEmpty() || nombreZona.contains("<") || 
                        responsableZona.contains("<") || asistenteZona.contains("<")
                    ){
                        out.print("<h3> Falta ingresar Parametros </h3>");
                    }else{
                        Recorrido recorrido = new Recorrido(nombreZona, dia, responsableZona, asistenteZona);
                        re_rep.save(recorrido);
                        if (recorrido.getId()!= 0){
                            out.print("<h3>Se guardo exitosamente el Recorrido "+recorrido.getId()+": "
                                            +recorrido.getNombreZona()+" "+recorrido.getDia()
                                            +" ("+recorrido.getResponsableZona()+" - "
                                            +recorrido.getAsistenteZona()+")</h3>");
                        }else{
                            out.print("<h3> No se pudo guardar el Recorrido! </h3>");
                        }
                    }
                } catch (NullPointerException | NumberFormatException e) {
                    out.print("<h3> Completa los datos del nuevo Recorrido </h3>" );
                } catch (Exception e) {
                System.out.println("*********************");
                    out.print("<h3>Ocurrio un Error. " + e +"</h3>" );
                System.out.println("*********************");
                }

        %>  
                  
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