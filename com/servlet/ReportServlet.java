package com.servlet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import com.dao.HospitalDAO;

@WebServlet("/generateReport")
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String start = request.getParameter("startDate");
        String end = request.getParameter("endDate");
        String sql = "SELECT * FROM Patients WHERE AdmissionDate BETWEEN '" + start + "' AND '" + end + "'";
        
        request.setAttribute("title", "REPORT // ADMISSIONS: " + start + " TO " + end);
        request.setAttribute("list", new HospitalDAO().getList(sql, null));
        request.getRequestDispatcher("patientdisplay.jsp").forward(request, response);

    }
}