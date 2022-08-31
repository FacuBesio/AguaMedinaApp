package ar.com.aguaMedina.repositories.jdbc;

import ar.com.aguaMedina.entities.Recorrido;
import ar.com.aguaMedina.enums.Dia;
import ar.com.aguaMedina.repositories.interfaces.I_RecorridoRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RecorridoRepository implements I_RecorridoRepository{
    
    Connection conn;

    public RecorridoRepository(Connection conn) {
        this.conn = conn;
    }
    
    /* @Override
    public void save(Alumno alumno) {
        if(alumno==null) return;
        String query="insert into alumnos (nombre,apellido,edad,idCurso) values (?,?,?,?)";
        try (PreparedStatement ps=conn.prepareStatement(query,PreparedStatement.RETURN_GENERATED_KEYS)){
            ps.setString(1, alumno.getNombre());
            ps.setString(2, alumno.getApellido());
            ps.setInt(3, alumno.getEdad());
            ps.setInt(4, alumno.getIdCurso());
            ps.execute();
            ResultSet rs=ps.getGeneratedKeys();
            if(rs.next()) alumno.setId(rs.getInt(1));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }*/
    
    @Override
    public void save(Recorrido recorrido) {
        if(recorrido==null) return;
        String query="insert into recorridos (nombreZona,dia,responsable,asistente) values (?,?,?,?)";
        try (PreparedStatement ps=conn.prepareStatement(query,PreparedStatement.RETURN_GENERATED_KEYS)){
            ps.setString(1, recorrido.getNombreZona());
            ps.setString(2, recorrido.getDia().toString());
            ps.setString(3, recorrido.getResponsableZona());
            ps.setString(4, recorrido.getAsistenteZona());
            ps.execute();
            ResultSet rs=ps.getGeneratedKeys();
            if(rs.next()) recorrido.setId(rs.getInt(1));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /*create table recorridos(
    id int auto_increment primary key,
    nombreZona varchar(25) not null,
    dia enum('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES','SABADO'),
    responsable varchar(25) not null,
    asistente varchar(25) not null*/
    

    @Override
    public void remove(Recorrido recorrido) {
        if(recorrido==null) return;
        String query="delete from recorridos where id="+recorrido.getId();
        try (Statement st=conn.createStatement()) {
            st.execute(query);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    @Override
    public void remove(int id_recorrido) {
    if(id_recorrido<=0) return;
        String query="delete from recorridos where id="+id_recorrido;
        try (Statement st=conn.createStatement()) {
            st.execute(query);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    

    @Override
    public void update(Recorrido recorrido) {
        if(recorrido==null) return;
        String query= "update recorridos set nombreZona=?, dia=?, responsable=?, asistente=? where id=?";
        try (PreparedStatement ps=conn.prepareStatement(query)) {
            ps.setString(1, recorrido.getNombreZona());
            ps.setString(2, recorrido.getDia().toString());
            ps.setString(3, recorrido.getResponsableZona());
            ps.setString(4, recorrido.getAsistenteZona());
            ps.setInt(5, recorrido.getId());
            ps.execute();
        } catch (Exception e) {
             System.out.println(e);
        }
    }
    

    @Override
    public List<Recorrido> getAll() {
     List<Recorrido>list=new ArrayList();
        try (ResultSet rs=conn.createStatement().executeQuery("select * from recorridos")){
            while(rs.next()){
                Recorrido recorrido = new Recorrido(
                        rs.getInt("id"), 
                        rs.getString("nombreZona"), 
                        Dia.valueOf(rs.getString("dia")),  
                        rs.getString("responsable"), 
                        rs.getString("asistente")
                );
                if (recorrido.getAsistenteZona()==null)
                recorrido.setAsistenteZona("Sin asistente");
                list.add(recorrido);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    @Override
    public List<Recorrido> BuscadorGenerico(String string) {
        List<Recorrido>list=new ArrayList();
        try (ResultSet rs=conn.createStatement().executeQuery("select * from recorridos where "
                                                            + "(nombreZona LIKE '%"+string+"%') or"
                                                            + "(dia LIKE '%"+string+"%') or"
                                                            + "(responsable LIKE '%"+string+"%') or"
                                                            + "(asistente LIKE '%"+string+"%')"
                                                            )){
            while(rs.next()){
                list.add(new Recorrido(
                                        rs.getInt("id"), 
                                        rs.getString("nombreZona"), 
                                        Dia.valueOf(rs.getString("dia")),  
                                        rs.getString("responsable"), 
                                        rs.getString("asistente")
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    
    
    

}
