package model;

import entidad.Doctor;
import entidad.ExamMedicos;
import entidad.Paciente;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import miConexion.MySQLDBConexion;

public class ModeloExammedico {
    
    public int insertarExamMedico(ExamMedicos obj, Paciente obj1, Doctor obj2){
        int salida=-1;
        try { 
            PreparedStatement pstm;
            Connection conn;
            conn = MySQLDBConexion.getConnection();
            String sql="insert into exam_medicos values(null,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getDescexam());
            pstm.setString(2, obj.getFechaexam());
            pstm.setString(3, obj.getFotoexam());
            pstm.setInt(4, obj1.getNrodocumpaciente());
            pstm.setString(5, obj2.getUserdoctor());          
            salida=pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ModeloExammedico.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }
    
    public ArrayList<ExamMedicos> descargarExamMedico(String fecha_exam, String dni) throws IOException{
        ArrayList <ExamMedicos> data = new ArrayList<>();
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = MySQLDBConexion.getConnection();
            ResultSet rs;
            String sql="select e.cod_examen,e.desc_exam,e.fecha_exam,e.fotoexam,d.apedoctor from exam_medicos e inner join doctor d on e.userdoctor=d.userdoctor where fecha_exam=? and nrodocumpaciente=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, fecha_exam);
            pstm.setString(2, dni);
            rs = pstm.executeQuery();
            
            ExamMedicos obj;
            Doctor obj1;

            while(rs.next()){
                obj = new ExamMedicos();
                obj1 = new Doctor();

                obj.setCodexamen(rs.getInt("cod_examen"));
                obj.setDescexam(rs.getString("desc_exam"));
                obj.setFechaexam(rs.getString("fecha_exam"));
                obj.setFotoexam(rs.getString("fotoexam"));
                obj1.setApedoctor(rs.getString("apedoctor"));
                obj.setDoctor(obj1);
                data.add(obj);                

            }
        } catch (SQLException ex) {
            Logger.getLogger(ModeloExammedico.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public ArrayList<ExamMedicos> listaExamMedico(String dni){
        ArrayList <ExamMedicos> data = new ArrayList<>();
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = MySQLDBConexion.getConnection();
            ResultSet rs;
            String sql="select e.cod_examen,e.desc_exam,e.fecha_exam,e.fotoexam,d.apedoctor from exam_medicos e inner join doctor d on e.userdoctor=d.userdoctor where nrodocumpaciente=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, dni);
            rs = pstm.executeQuery();
            
            ExamMedicos obj;
            Doctor obj1;

            while(rs.next()){
                obj = new ExamMedicos();
                obj1 = new Doctor();

                obj.setCodexamen(rs.getInt("cod_examen"));
                obj.setDescexam(rs.getString("desc_exam"));
                obj.setFechaexam(rs.getString("fecha_exam"));
                obj.setFotoexam(rs.getString("fotoexam"));
                obj1.setApedoctor(rs.getString("apedoctor"));                
                obj.setDoctor(obj1);
                data.add(obj);                

            }
        } catch (SQLException ex) {
            Logger.getLogger(ModeloExammedico.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    public int eliminaexammedico(int cod_examen){
        int salida = -1;
        try { 
            Connection conn;
            PreparedStatement pstm;        
            conn = MySQLDBConexion.getConnection();
            String sql = "delete from exam_medicos where cod_examen=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1,cod_examen);
            salida = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ModeloPaciente.class.getName()).log(Level.SEVERE, null, ex);
        }
            return salida;   
    }
    
}
