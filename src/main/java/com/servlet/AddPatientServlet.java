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
            
            // WE READ THE AUTO-CALCULATED ID FROM THE JSP
            p.setPatientID(Integer.parseInt(request.getParameter("id")));
            
            p.setPatientName(request.getParameter("name"));
            p.setAge(Integer.parseInt(request.getParameter("age")));
            p.setGender(request.getParameter("gender"));
            p.setAdmissionDate(java.sql.Date.valueOf(request.getParameter("date")));
            p.setAilment(request.getParameter("ailment"));
            p.setAssignedDoctor(request.getParameter("doctor"));

            // Save to Database
            new HospitalDAO().managePatient("add", p);
            
            // Redirect on success
            response.sendRedirect("displayPatients");
            
        } catch (Exception e) { 
            e.printStackTrace(); 
            response.sendRedirect("patientadd.jsp?status=error");
        }
    }
}