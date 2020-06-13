package model;

import entidad.Doctor;
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


public class ModeloDoctor {
    
    //metodo insertar
    public int insertarDoctor(Doctor obj){
        int salida=-1;
        try { 
            PreparedStatement pstm;
            Connection conn;
            conn = MySQLDBConexion.getConnection();
            String sql="insert into doctor values(null,?,?,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getUserdoctor());
            pstm.setString(2, obj.getPassdoctor());
            pstm.setString(3, obj.getNomdoctor());
            pstm.setString(4, obj.getApedoctor());
            pstm.setInt(5, obj.getTelefdoctor());
            pstm.setString(6, obj.getSexodoctor());
            pstm.setString(7, obj.getFotodoctor());
            
            salida=pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ModeloDoctor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }
    
    public Doctor validardoctor(String usuariod, String claved) throws IOException{
        Doctor obj = null;
        //byte[] imgData = null;
        //Blob img = null;
        try {
            Connection conn;
            PreparedStatement pstm;
            ResultSet rs;
            
            conn = MySQLDBConexion.getConnection();
            String sql="select * from doctor where userdoctor=? and passdoctor=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, usuariod);
            pstm.setString(2, claved);
            
            rs = pstm.executeQuery();
            
            if(rs.next()){
                obj = new Doctor();
                obj.setUserdoctor(rs.getString("userdoctor"));
                obj.setPassdoctor(rs.getString("passdoctor"));
                obj.setNomdoctor(rs.getString("nomdoctor"));
                obj.setApedoctor(rs.getString("apedoctor"));
                obj.setTelefdoctor(rs.getInt("telefdoctor"));
                obj.setSexodoctor(rs.getString("sexodoctor"));               
                obj.setFotodoctor(rs.getString("fotodoctor"));
            }
            
        } catch (SQLException ex){
            Logger.getLogger(ModeloDoctor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }
    
    public Doctor buscaDoctor(String userdoctor) throws IOException{
        Doctor obj = null;
        byte[] imgData = null;
        Blob img = null;
        try {
            Connection conn;
            PreparedStatement pstm;
            ResultSet rs;
            
            conn = MySQLDBConexion.getConnection();
            String sql="select * from doctor where userdoctor=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, userdoctor);
            
            rs = pstm.executeQuery();
            
            if(rs.next()){
                obj = new Doctor();
                obj.setUserdoctor(rs.getString("userdoctor"));
                obj.setPassdoctor(rs.getString("passdoctor"));
                obj.setNomdoctor(rs.getString("nomdoctor"));
                obj.setApedoctor(rs.getString("apedoctor"));
                obj.setTelefdoctor(rs.getInt("telefdoctor"));            
                obj.setSexodoctor(rs.getString("sexodoctor"));
                obj.setFotodoctor(rs.getString("fotodoctor"));
            }
            
        } catch (SQLException ex){
            Logger.getLogger(ModeloDoctor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }

    public void eliminardoctor(int parseInt) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void actualizardoctor(Doctor a) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Object buscardoctor(int parseInt) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void eliminardoctor(String user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
