package com.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import com.dao.HospitalDAO;
import com.model.Patient;

@WebServlet("/reportCriteria")
public class ReportCriteriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String sql = "";
        String param = null;
        String title = "REPORT_RESULTS";

        // Logic based on which form was submitted in report_form.jsp
        if ("date".equals(action)) {
            String start = request.getParameter("start");
            String end = request.getParameter("end");
            sql = "SELECT * FROM Patients WHERE AdmissionDate BETWEEN '" + start + "' AND '" + end + "'";
            title = "RESULTS: " + start + " TO " + end;
        } 
        else if ("doctor".equals(action)) {
            param = request.getParameter("docName");
            sql = "SELECT * FROM Patients WHERE AssignedDoctor = ?";
            title = "RESULTS: DOCTOR " + param.toUpperCase();
        } 
        else if ("ailment".equals(action)) {
            param = request.getParameter("ailmentName");
            sql = "SELECT * FROM Patients WHERE Ailment = ?";
            title = "RESULTS: AILMENT " + param.toUpperCase();
        }

        // Use the DAO we created earlier to fetch the data
        HospitalDAO dao = new HospitalDAO();
        List<Patient> list = dao.getList(sql, param);

        // Send data to the dedicated report_result.jsp file
        request.setAttribute("reportTitle", title);
        request.setAttribute("reportList", list);
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}