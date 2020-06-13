package model;

import entidad.Paciente;
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


public class ModeloPaciente {
    
    //metodo insertar
    public int insertarPaciente(Paciente obj){
        int salida=-1;
        try { 
            PreparedStatement pstm;
            Connection conn;
            conn = MySQLDBConexion.getConnection();
            String sql="insert into paciente values(null,?,?,?,?,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, obj.getNrodocumpaciente());
            pstm.setString(2, obj.getPasspaciente());
            pstm.setString(3, obj.getNompaciente());
            pstm.setString(4, obj.getApepaciente());
            pstm.setInt(5, obj.getTelefpaciente());
            pstm.setString(6, obj.getDirecpaciente());
            pstm.setString(7, obj.getFnacipaciente());
            pstm.setString(8, obj.getSexopaciente());
            pstm.setString(9, obj.getFotopaciente());
            
            salida=pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ModeloPaciente.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }
    
    public Paciente validarpaciente(String usuariop, String clavep) throws IOException{
        Paciente obj = null;
        //byte[] imgData = null;
        //Blob img = null;
        try {
            Connection conn;
            PreparedStatement pstm;
            ResultSet rs;
            
            conn = MySQLDBConexion.getConnection();
            String sql="select * from paciente where nrodocumpaciente=? and passpaciente=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, usuariop);
            pstm.setString(2, clavep);
            
            rs = pstm.executeQuery();
            
            if(rs.next()){
                obj = new Paciente();
                obj.setNrodocumpaciente(rs.getInt("nrodocumpaciente"));
                obj.setPasspaciente(rs.getString("passpaciente"));
                obj.setNompaciente(rs.getString("nompaciente"));
                obj.setApepaciente(rs.getString("apepaciente"));
                obj.setTelefpaciente(rs.getInt("telefpaciente"));
                obj.setDirecpaciente(rs.getString("direcpaciente"));               
                obj.setFnacipaciente(rs.getString("fechanacpaciente"));
                obj.setSexopaciente(rs.getString("sexopaciente"));               
                obj.setFotopaciente(rs.getString("fotopaciente"));
            }
            
        } catch (SQLException ex){
            Logger.getLogger(ModeloPaciente.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }
    
    public Paciente buscaPaciente(int nrodocumpaciente) throws IOException{
        Paciente obj = null;
        byte[] imgData = null;
        Blob img = null;
        try {
            Connection conn;
            PreparedStatement pstm;
            ResultSet rs;
            
            conn = MySQLDBConexion.getConnection();
            String sql="select * from paciente where nrodocumpaciente=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, nrodocumpaciente);
            
            rs = pstm.executeQuery();
            
            if(rs.next()){
                obj = new Paciente();
                obj.setCodpaciente(rs.getInt("codpaciente"));
                obj.setNrodocumpaciente(rs.getInt("nrodocumpaciente"));
                obj.setNompaciente(rs.getString("nompaciente"));
                obj.setApepaciente(rs.getString("apepaciente"));
                obj.setTelefpaciente(rs.getInt("telefpaciente"));
                obj.setDirecpaciente(rs.getString("direcpaciente"));
                obj.setFnacipaciente(rs.getString("fechanacpaciente"));
                obj.setSexopaciente(rs.getString("sexopaciente"));                
                obj.setFotopaciente(rs.getString("fotopaciente"));
            }
            
        } catch (SQLException ex){
            Logger.getLogger(ModeloPaciente.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }
    
    public int eliminapaciente(int codpaciente){
        int salida = -1;
        try { 
            Connection conn;
            PreparedStatement pstm;        
            conn = MySQLDBConexion.getConnection();
            String sql = "delete from paciente where codpaciente=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1,codpaciente);
            salida = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ModeloPaciente.class.getName()).log(Level.SEVERE, null, ex);
        }
            return salida;   
    }
    
    public int actualizaPaciente(Paciente obj){
        int salida = -1;
        try {
            Connection conn;
            PreparedStatement pstm;
            conn = MySQLDBConexion.getConnection();
            String sql = "update paciente set nompaciente=?, apepaciente=?, telefpaciente=?, direcpaciente=? where nrodocumpaciente=?";
            pstm =conn.prepareStatement(sql);
            pstm.setString(1, obj.getNompaciente());
            pstm.setString(2, obj.getApepaciente());
            pstm.setInt(3, obj.getTelefpaciente());
            pstm.setString(4, obj.getDirecpaciente());
            pstm.setInt(5, obj.getNrodocumpaciente());
            salida = pstm.executeUpdate();
        } catch (SQLException ex){
            Logger.getLogger(ModeloPaciente.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }
    
}
