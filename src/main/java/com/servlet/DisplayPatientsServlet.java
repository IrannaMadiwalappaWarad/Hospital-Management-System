package com.servlet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import com.dao.HospitalDAO;

@WebServlet("/displayPatients")
public class DisplayPatientsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String val = request.getParameter("val");
        String sql = "SELECT * FROM Patients";
        String title = "CORE_RECORDS // ALL PATIENTS";

        if("doctor".equals(type)) {
            sql = "SELECT * FROM Patients WHERE AssignedDoctor = ?";
            title = "REPORT // DR. " + val.toUpperCase();
            
        } else if("ailment".equals(type)) {
            sql = "SELECT * FROM Patients WHERE Ailment = ?";
            title = "REPORT // " + val.toUpperCase();
            
        }
        request.setAttribute("title", title);
        request.setAttribute("list", new HospitalDAO().getList(sql, val));
        request.getRequestDispatcher("patientdisplay.jsp").forward(request, response);
    }
}