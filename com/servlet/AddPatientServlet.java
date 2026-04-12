package com.servlet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import com.dao.HospitalDAO;
import com.model.Patient;

@WebServlet("/addPatient")
public class AddPatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Patient p = new Patient();
            p.setPatientID(Integer.parseInt(request.getParameter("id")));
            p.setPatientName(request.getParameter("name"));
            p.setAge(Integer.parseInt(request.getParameter("age")));
            p.setGender(request.getParameter("gender"));
            p.setAdmissionDate(Date.valueOf(request.getParameter("date")));
            p.setAilment(request.getParameter("ailment"));
            p.setAssignedDoctor(request.getParameter("doctor"));
            
            new HospitalDAO().managePatient("add", p);
            response.sendRedirect("displayPatients");
            System.out.println("Id: " + p.getPatientID() + " & Name: " +p.getPatientName()+" is Inserted In Hospital DB");
        } catch (Exception e) { 
        	e.printStackTrace(); 
        	}
    }
}