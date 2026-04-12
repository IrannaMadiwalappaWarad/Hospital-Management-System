package com.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import com.dao.HospitalDAO;
import com.model.Patient;

@WebServlet("/updatePatient")
public class UpdatePatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        
        // CRASH PREVENTION: Check if ID is missing or empty
        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect("displayPatients"); // Send them back to safety
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            List<Patient> list = new HospitalDAO().getList("SELECT * FROM Patients WHERE PatientID=" + id, null);
            
            // CRASH PREVENTION: Check if patient actually exists in DB
            if (list != null && !list.isEmpty()) {
                request.setAttribute("p", list.get(0));
                request.getRequestDispatcher("patientupdate.jsp").forward(request, response);
            } else {
                response.sendRedirect("displayPatients");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("displayPatients");
        }
    }

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

            new HospitalDAO().managePatient("update", p);
            response.sendRedirect("displayPatients");
            System.out.println("Id: " + p.getPatientID() + " & Name: " +p.getPatientName()+" is Updated👍👍👍 In Hospital DB");
        } catch (Exception e) { 
            e.printStackTrace(); 
            response.sendRedirect("displayPatients");
        }
    }
}