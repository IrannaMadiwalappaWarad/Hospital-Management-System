package com.dao;
import java.sql.*;
import java.util.*;
import com.model.Patient;

public class HospitalDAO {
	//I created database = HospitalDB in MySQL
    private String url = "jdbc:mysql://---------/HospitalDB";
    private String user = "root";
    private String pass = "XXXXXXX";

    protected Connection getConnection() throws Exception{
        Connection connection = null;
        try {
            // 1. Load the MySQL Driver you put in the WEB-INF/lib folder
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // 2. Get the connection to the database
            //Here I used DriverManager: is the traditional way to get a connection.
            connection = DriverManager.getConnection(url, user, pass);
            System.out.println("You are the Luckiest person, Iranna!.YOUR Database(HospitalDB) Connection Successful!");
            
        } catch (ClassNotFoundException e) {
            System.out.println("Error: MySQL Driver not found. Did you put the JAR in WEB-INF/lib?");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Error: Could not connect to the database. Check your password and URL.");
            e.printStackTrace();
        }
        return connection;
    }
   
    
    //method to manage Patient details like ADD,UPDATE,DELETE
    public void managePatient(String action, Patient p) throws Exception {
        String sql = "";
        if(action.equals("add")) {
            sql = "INSERT INTO Patients VALUES (?,?,?,?,?,?,?)"; // Query to insert Patients records
            //System.out.println("The add action is taken place in your database");
        } else if(action.equals("update")) {
            // Note the order: Name(1), Age(2), Gender(3), Date(4), Ailment(5), Doctor(6), ID(7)
            sql = "UPDATE Patients SET PatientName=?, Age=?, Gender=?, AdmissionDate=?, Ailment=?, AssignedDoctor=? WHERE PatientID=?";
        } else if(action.equals("delete")) {
            sql = "DELETE FROM Patients WHERE PatientID=?"; // Query to delete the Unwanted patient details
        }

        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            
            if(action.equals("add")) {    
                ps.setInt(1, p.getPatientID());
                ps.setString(2, p.getPatientName());
                ps.setInt(3, p.getAge());
                ps.setString(4, p.getGender());
                ps.setDate(5, p.getAdmissionDate());
                ps.setString(6, p.getAilment());
                ps.setString(7, p.getAssignedDoctor());
                
            } else if(action.equals("update")) {
                // For Update, the ? marks are in a different order!
                ps.setString(1, p.getPatientName());
                ps.setInt(2, p.getAge());
                ps.setString(3, p.getGender());
                ps.setDate(4, p.getAdmissionDate());
                ps.setString(5, p.getAilment());
                ps.setString(6, p.getAssignedDoctor());
                ps.setInt(7, p.getPatientID()); // ID goes last for the WHERE clause
                
            } else if(action.equals("delete")) {
                ps.setInt(1, p.getPatientID());
            }
            
            // Execute the query
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
