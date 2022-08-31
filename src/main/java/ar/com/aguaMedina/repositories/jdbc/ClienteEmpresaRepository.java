package ar.com.aguaMedina.repositories.jdbc;

import ar.com.aguaMedina.entities.ClienteEmpresa;
import ar.com.aguaMedina.entities.ClientePersona;
import ar.com.aguaMedina.repositories.interfaces.I_ClienteEmpresaRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ClienteEmpresaRepository implements I_ClienteEmpresaRepository{
    
    private Connection conn;
    

    
    public ClienteEmpresaRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public String toString() {
        return "ClienteEmpresaRepository{" + "conn=" + conn + '}';
    }

    
    /*
    id int auto_increment primary key,
    razon_social varchar(25) not null,
    cuit varchar(50),
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
    @Override
    public void save(ClienteEmpresa clienteEmpresa) {
        if(clienteEmpresa==null) return;
        String query="insert into clientesEmpresa (razon_social,cuit,direccion,localidad,contacto,tipo_servicio,bidones,"
                                                + "maquinas,precio,idRecorrido,mail,fecha_alta,detalles) "
                                                + "values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try (PreparedStatement ps=conn.prepareStatement(query,PreparedStatement.RETURN_GENERATED_KEYS)){
            ps.setString(1, clienteEmpresa.getRazon_social());
            ps.setString(2, clienteEmpresa.getCuit());
            ps.setString(3, clienteEmpresa.getDireccion());
            ps.setString(4, clienteEmpresa.getLocalidad());
            ps.setString(5, clienteEmpresa.getContacto());
            ps.setString(6, clienteEmpresa.getTipo_servicio());
            ps.setInt   (7, clienteEmpresa.getBidones());
            ps.setInt   (8, clienteEmpresa.getMaquinas());
            ps.setInt   (9, clienteEmpresa.getPrecio());
            ps.setInt   (10, clienteEmpresa.getIdRecorrido());
            ps.setString(11, clienteEmpresa.getMail());
            ps.setString(12, clienteEmpresa.getFecha_alta());
            ps.setString(13, clienteEmpresa.getDetalles());
            ps.execute();
            ResultSet rs=ps.getGeneratedKeys();
            if(rs.next()) clienteEmpresa.setId(rs.getInt(1));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    

    @Override
    public void remove(ClienteEmpresa clienteEmpresa) {
    if(clienteEmpresa==null) return;
        String query="delete from clientesEmpresa where id="+clienteEmpresa.getId();
        try (Statement st=conn.createStatement()) {
            st.execute(query);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    @Override
    public void remove(int id_clienteEmpresa) {
    if(id_clienteEmpresa<=0) return;
        String query="delete from clientesEmpresa where id="+id_clienteEmpresa;
        try (Statement st=conn.createStatement()) {
            st.execute(query);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
  
    
    
    @Override
    public void update(ClienteEmpresa clienteEmpresa) {
        if(clienteEmpresa==null) return;
        String query= "update clientesEmpresa set razon_social=?, cuit=?, direccion=?, localidad=?, contacto=?, "
                    + "tipo_servicio=?, bidones=?, maquinas=?, precio=?, idRecorrido=?, mail=?, fecha_alta=?, detalles=? "
                    + " where id=?";
        try (PreparedStatement ps=conn.prepareStatement(query)) {
            ps.setString(1, clienteEmpresa.getRazon_social());
            ps.setString(2, clienteEmpresa.getCuit());
            ps.setString(3, clienteEmpresa.getDireccion());
            ps.setString(4, clienteEmpresa.getLocalidad());
            ps.setString(5, clienteEmpresa.getContacto());
            ps.setString(6, clienteEmpresa.getTipo_servicio());
            ps.setInt   (7, clienteEmpresa.getBidones());
            ps.setInt   (8, clienteEmpresa.getMaquinas());
            ps.setInt   (9, clienteEmpresa.getPrecio());
            ps.setInt   (10, clienteEmpresa.getIdRecorrido());
            ps.setString(11, clienteEmpresa.getMail());
            ps.setString(12, clienteEmpresa.getFecha_alta());
            ps.setString(13, clienteEmpresa.getDetalles());
            ps.setInt   (14, clienteEmpresa.getId());
            ps.execute();
        } catch (Exception e) {
             System.out.println(e);
        }
    }
    
   

    @Override
    public List<ClienteEmpresa> getAll() {
        List<ClienteEmpresa>list=new ArrayList();
        try (ResultSet rs=conn.createStatement().executeQuery("select * from clientesEmpresa")){
            while(rs.next()){
                list.add(new ClienteEmpresa(rs.getInt("id"),  
                                            rs.getString("razon_social"),
                                            rs.getString("cuit"),
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
    public List<ClienteEmpresa> BuscadorGenerico(String string) {
        List<ClienteEmpresa>list=new ArrayList();
        try (ResultSet rs=conn.createStatement().executeQuery("select * from clientesEmpresa where "
                                                            + "(razon_social LIKE '%"+string+"%') or "
                                                            + "(cuit LIKE '%"+string+"%') or"
                                                            + "(direccion LIKE '%"+string+"%') or "
                                                            + "(localidad LIKE '%"+string+"%') or "
                                                            + "(contacto LIKE '%"+string+"%') or "
                                                            + "(mail LIKE '%"+string+"%') or "
                                                            + "(fecha_alta LIKE '%"+string+"%') or "
                                                            + "(detalles LIKE '%"+string+"%')"
                                                            )){
            while(rs.next()){
                list.add(new ClienteEmpresa(rs.getInt("id"),  
                                            rs.getString("razon_social"),
                                            rs.getString("cuit"),
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
}
