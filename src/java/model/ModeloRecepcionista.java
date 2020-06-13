package model;

import entidad.Recepcionista;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;
import miConexion.MySQLDBConexion;


public class ModeloRecepcionista {
    
    //metodo insertar
    public int insertarRecep(Recepcionista obj){
        int salida=-1;
        try { 
            PreparedStatement pstm;
            Connection conn;
            conn = MySQLDBConexion.getConnection();
            String sql="insert into recepcionista values(null,?,?,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getUserrecep());
            pstm.setString(2, obj.getPassrecep());
            pstm.setString(3, obj.getNomrecep());
            pstm.setString(4, obj.getAperecep());
            pstm.setInt(5, obj.getTelefrecep());
            pstm.setString(6, obj.getSexorecep());
            pstm.setString(7, obj.getFotorecep());
            
            salida=pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ModeloRecepcionista.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }
    
    public Recepcionista validarrecep(String usuarior, String claver) throws IOException{
        Recepcionista obj = null;
        //byte[] imgData = null;
        //Blob img = null;
        try {
            Connection conn;
            PreparedStatement pstm;
            ResultSet rs;
            
            conn = MySQLDBConexion.getConnection();
            String sql="select * from recepcionista where userrecep=? and passrecep=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, usuarior);
            pstm.setString(2, claver);
            
            rs = pstm.executeQuery();
            
            if(rs.next()){
                obj = new Recepcionista();
                obj.setUserrecep(rs.getString("userrecep"));
                obj.setPassrecep(rs.getString("passrecep"));
                obj.setNomrecep(rs.getString("nomrecep"));
                obj.setAperecep(rs.getString("aperecep"));
                obj.setTelefrecep(rs.getInt("telefrecep"));
                obj.setSexorecep(rs.getString("sexorecep"));               
                obj.setFotorecep(rs.getString("fotorecep"));
            }
            
        } catch (SQLException ex){
            Logger.getLogger(ModeloRecepcionista.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }
    
}
