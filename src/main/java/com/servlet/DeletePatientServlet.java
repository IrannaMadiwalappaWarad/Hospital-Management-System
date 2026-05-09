package com.servlet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import com.dao.HospitalDAO;
import com.model.Patient;

@WebServlet("/deletePatient")
public class DeletePatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Patient p = new Patient();
            p.setPatientID(Integer.parseInt(request.getParameter("id")));
            p.setPatientName(request.getParameter("name"));         
            new HospitalDAO().managePatient("delete", p);
            response.sendRedirect("displayPatients");
            System.out.println("Patient_Id: " + p.getPatientID() + " is Deleted from Hospital DB");
        } catch (Exception e) { e.printStackTrace(); }
    }
}