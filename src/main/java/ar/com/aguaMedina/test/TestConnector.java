// ● JAVA 2 Standard 11 Web Programming - CLASE 6 - CARLOS RIOS
package ar.com.aguaMedina.test;

import ar.com.aguaMedina.connectors.Conector;
import java.sql.ResultSet;

public class TestConnector {
    public static void main(String[] args) {
        /*ResulSet es un 'Conjunto de Registros'. Al ejecutar executeQuery("select version ()"), vamos a solicitar un 
        conjunto de registros, es por este motivo que debemos guardar el resultado final en una variable ResulSet, para que
        puede contener a ese Conjunto de Registros.*/
        
        try{
            ResultSet rs= Conector.
                          getConecction(). //Se llama al método estatico 'getConecction()'  de nuestra Clase Conector. 
                          createStatement(). //creo un Objeto sentencia
                          executeQuery("select version ()"); // Ejecuta la Consulta indicada en executeQuery().
            if(rs.next()) System.out.println("SE CONECTO A: " + rs.getString(1)); /*Con este if(rs.next()) preguntamos si
            rs tuvo algun tipo de resultado, lo que hace 'rs.next()'es posicionarse en el primer lugar de la consulta. Si 
            tiene un valor entonces se realizo la Conexión.
            Si la Conexion se logro relizar satisfactoriamente rs va indicar el valor
            de la version a la estemos conectados. */
            else System.out.println("No se pudo conectar!");/*Si rs no tiene un valor, quiere decir que la coxión fallo por lo
            tanto se va a indicr en consola 'No se pudo conectar'*/
        }catch (Exception e){
            System.out.println(e);
        }

    }
    
}
