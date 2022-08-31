package ar.com.aguaMedina.repositories.jdbc;

import ar.com.aguaMedina.entities.ClientePersona;
import ar.com.aguaMedina.repositories.interfaces.I_ClientePersonaRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ClientePersonaRepository implements I_ClientePersonaRepository{

    private Connection conn;
    
    
    
    public ClientePersonaRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public String toString() {
        return "ClientePersonaRepository{" + "conn=" + conn + '}';
    }
  
    
    @Override
    public void save(ClientePersona clientePersona) {
        if(clientePersona==null) return;
        String query="insert into clientesPersona (nombre,direccion,localidad,contacto,tipo_servicio,bidones,"
                                                + "maquinas,precio,idRecorrido,mail,fecha_alta,detalles) "
                                                + "values (?,?,?,?,?,?,?,?,?,?,?,?)";
        try (PreparedStatement ps=conn.prepareStatement(query,PreparedStatement.RETURN_GENERATED_KEYS)){
            ps.setString(1, clientePersona.getNombre());
            ps.setString(2, clientePersona.getDireccion());
            ps.setString(3, clientePersona.getLocalidad());
            ps.setString(4, clientePersona.getContacto());
            ps.setString(5, clientePersona.getTipo_servicio());
            ps.setInt   (6, clientePersona.getBidones());
            ps.setInt   (7, clientePersona.getMaquinas());
            ps.setInt   (8, clientePersona.getPrecio());
            ps.setInt   (9, clientePersona.getIdRecorrido());
            ps.setString(10, clientePersona.getMail());
            ps.setString(11, clientePersona.getFecha_alta());
            ps.setString(12, clientePersona.getDetalles());
            ps.execute();
            ResultSet rs=ps.getGeneratedKeys();
            if(rs.next()) clientePersona.setId(rs.getInt(1));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    

    @Override
    public void remove(ClientePersona clientePersona) {
    if(clientePersona==null) return;
        String query="delete from clientesPersona where id="+clientePersona.getId();
        try (Statement st=conn.createStatement()) {
            st.execute(query);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    @Override
    public void remove(int id_clientePersona) {
    if(id_clientePersona<=0) return;
        String query="delete from clientesPersona where id="+id_clientePersona;
        try (Statement st=conn.createStatement()) {
            st.execute(query);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
  
    
    
    @Override
    public void update(ClientePersona clientePersona) {
        if(clientePersona==null) return;
        String query= "update clientesPersona set nombre=?, direccion=?, localidad=?, contacto=?, tipo_servicio=?, bidones=?,"
                    + "maquinas=?, precio=?, idRecorrido=?, mail=?, fecha_alta=?, detalles=? where id=?";
        try (PreparedStatement ps=conn.prepareStatement(query)) {
            ps.setString(1, clientePersona.getNombre());
            ps.setString(2, clientePersona.getDireccion());
            ps.setString(3, clientePersona.getLocalidad());
            ps.setString(4, clientePersona.getContacto());
            ps.setString(5, clientePersona.getTipo_servicio());
            ps.setInt   (6, clientePersona.getBidones());
            ps.setInt   (7, clientePersona.getMaquinas());
            ps.setInt   (8, clientePersona.getPrecio());
            ps.setInt   (9, clientePersona.getIdRecorrido());
            ps.setString(10, clientePersona.getMail());
            ps.setString(11, clientePersona.getFecha_alta());
            ps.setString(12, clientePersona.getDetalles());
            ps.setInt   (13, clientePersona.getId());
            ps.execute();
        } catch (Exception e) {
             System.out.println(e);
        }
    }
    
   
    @Override
    public List<ClientePersona> getAll() {
        List<ClientePersona>list=new ArrayList();
        try (ResultSet rs=conn.createStatement().executeQuery("select * from clientesPersona")){
            while(rs.next()){
                list.add(new ClientePersona(rs.getInt("id"),  
                                            rs.getString("nombre"),
                                            rs.getString("direccion"), 
                                            rs.getString("localidad"), 
                                            rs.getString("contacto"),
                                            rs.getString("tipo_servicio"),
                                            rs.getInt("bidones"),
                                            rs.getInt("maquinas"),
                                            rs.getInt("precio"),
                                            rs.getInt("idRecorrido"),
                                            rs.getString("mail"),
                                            rs.getString("fecha_alta"),
                                            rs.getString("detalles")
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    @Override
    public List<ClientePersona> BuscadorGenerico(String string) {
        List<ClientePersona>list=new ArrayList();
        try (ResultSet rs=conn.createStatement().executeQuery("select * from clientesPersona where "
                                                            + "(nombre LIKE '%"+string+"%') or"
                                                            + "(direccion LIKE '%"+string+"%') or"
                                                            + "(localidad LIKE '%"+string+"%') or"
                                                            + "(contacto LIKE '%"+string+"%') or"
                                                            + "(mail LIKE '%"+string+"%') or"
                                                            + "(fecha_alta LIKE '%"+string+"%') or"
                                                            + "(detalles LIKE '%"+string+"%')"
                                                            )){
            while(rs.next()){
                list.add(new ClientePersona(rs.getInt("id"),  
                                            rs.getString("nombre"),
                                            rs.getString("direccion"), 
                                            rs.getString("localidad"), 
                                            rs.getString("contacto"),
                                            rs.getString("tipo_servicio"),
                                            rs.getInt("bidones"),
                                            rs.getInt("maquinas"),
                                            rs.getInt("precio"),
                                            rs.getInt("idRecorrido"),
                                            rs.getString("mail"),
                                            rs.getString("fecha_alta"),
                                            rs.getString("detalles")
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
/*
    SELECT id_alumno, apellido, nombre, tipo_doc, num_doc FROM alumnos_clase2 WHERE apellido LIKE '%ia%'; 
     nombre varchar(50) not null,
    direccion varchar(50),
    localidad varchar(50),
    contacto varchar(50),
    tipo_servicio varchar(50),
    bidones int,
    maquinas int,
    precio int,
    idRecorrido int,
    mail varchar(50),
    fecha_alta varchar(50),
    detalles varchar(100)
    
    
*/
}
