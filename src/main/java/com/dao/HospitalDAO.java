
package com.dao;
import java.sql.*;
import java.util.*;
import com.model.Patient;

public class HospitalDAO {
    private String url = "jdbc:mysql://localhost:3306/HospitalDB";
    private String user = "root";
    private String pass = "xxxxx";

    protected Connection getConnection() throws Exception{
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
   
    public void managePatient(String action, Patient p) throws Exception {
        String sql = "";
        if(action.equals("add")) {
            // FIX: We need 7 question marks, one for each column including the ID
            sql = "INSERT INTO Patients VALUES (?,?,?,?,?,?,?)"; 
        } else if(action.equals("update")) {
            sql = "UPDATE Patients SET PatientName=?, Age=?, Gender=?, AdmissionDate=?, Ailment=?, AssignedDoctor=? WHERE PatientID=?";
        } else if(action.equals("delete")) {
            sql = "DELETE FROM Patients WHERE PatientID=?";
        }

        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            
            if(action.equals("add")) {    
                // FIX: We set the ID in the first column!
                ps.setInt(1, p.getPatientID());
                ps.setString(2, p.getPatientName());
                ps.setInt(3, p.getAge());
                ps.setString(4, p.getGender());
                ps.setDate(5, p.getAdmissionDate());
                ps.setString(6, p.getAilment());
                ps.setString(7, p.getAssignedDoctor());
                
            } else if(action.equals("update")) {
                ps.setString(1, p.getPatientName());
                ps.setInt(2, p.getAge());
                ps.setString(3, p.getGender());
                ps.setDate(4, p.getAdmissionDate());
                ps.setString(5, p.getAilment());
                ps.setString(6, p.getAssignedDoctor());
                ps.setInt(7, p.getPatientID()); 
                
            } else if(action.equals("delete")) {
                ps.setInt(1, p.getPatientID());
            }
            
            ps.executeUpdate();
        }
    }

    public List<Patient> getList(String sql, String param) {
        List<Patient> list = new ArrayList<>();
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            if(param != null) ps.setString(1, param);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Patient p = new Patient();
                p.setPatientID(rs.getInt(1)); p.setPatientName(rs.getString(2));
                p.setAge(rs.getInt(3)); p.setGender(rs.getString(4));
                p.setAdmissionDate(rs.getDate(5)); p.setAilment(rs.getString(6));
                p.setAssignedDoctor(rs.getString(7));
                list.add(p);
            }
        } catch(Exception e) { e.printStackTrace(); }
        return list;
    }
}