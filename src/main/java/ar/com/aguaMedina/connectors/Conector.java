// ● JAVA 2 Standard 11 Web Programming - CLASE 6 - CARLOS RIOS

package ar.com.aguaMedina.connectors;

import java.sql.Connection; 
import java.sql.DriverManager;
/*Se crea la Clase 'Conector' para poder establecer una Conexión con la Base de Datos a través de un Objeto de la misma 
en un ambiente controlado. Es decir, para conectar nuestro JAVA a la Base de Datos SQL creada (en este caso). Para pobrar si 
esta Clase funciona correctamente se crea dentro del paquete 'ar.com.eduit.curso.java.test' el archivo 'TestConnector'.
*/

public class Conector {
    
    private static String driver="org.mariadb.jdbc.Driver";
    
    private static String url="jdbc:mariadb://localhost:3306/BaseDeDatos?serverTimezone=UTC";
    private static String user="root"; //Usuario
    private static String pass=""; // Password
    /*
    private static String url="jdbc:mariadb://node101145-env-2558840.jelastic.saveincloud.net:3306/BaseDeDatos?serverTimezone=UTC";
    private static String user="root"; //Usuario
    private static String pass="59ZhTRtvZV"; // Password
    */
    private static Connection conn=null; 
    
    private Conector(){} // Se declara el Constructor Privado.
    

    public synchronized static Connection getConecction(){ /* Método Pulico que devuelve un Objeto Connection (la conexión).
        La va a devovler bajo un entorno controlado. Con la palabra reservada 'synchronized' evito que dos procesos entren a 
        la vez. Entra primero uno y depsues el otro, se brinda mas estabilidad.*/
        try {
            if(conn==null || conn.isClosed()){ // Prgunto si es Nula o esta cerrada. Si es asi, se crea un nueva Conexion. 
                Class.forName(driver);         /*Para poder utlizar DriverManager y crar la Conexión primero se debe,
                                                 Registrar el 'driver' a través de la sentencia Class.forName().*/
                conn=DriverManager.getConnection(url, user, pass); /*DriverManager es quien crea la Conexión. Envia la url,
                usuario y password y retorna la Conexion a traves del Objeto Conecction 'conn'*/
                
            }
        } catch (Exception e) {
                System.out.println(e);
            }
     return conn;                             // Retorno de Conexión. 
    }                                  

/*  Realizando todos estos procedimientos previos antes de crear una nueva Conexion se evita estar abriendo multiples 
    conexiones, o abriendo y cerrando constamente la conexión. Si la conexion no tiene valor Nulo o ya esta creada y no se 
    cerro, continua con la misma conexion ya generada. Se evita el abrir y cerrar, y se gana tiempo. 
*/  


}
