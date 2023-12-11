package controller;

import db.listener.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.co.employee.dao.impl.EmployeeDaoImpl;
import za.co.employee.model.Employee;
import za.co.employee.service.impl.EmployeeServiceImpl;

@WebServlet(name = "UpdateEmployee", urlPatterns = {"/UpdateEmployee"})
public class UpdateEmployee extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DBManager dbm = (DBManager) request.getServletContext().getAttribute("dbman");
        Connection con = dbm.getConnection();
        EmployeeServiceImpl emp = new EmployeeServiceImpl(new EmployeeDaoImpl(con));

        boolean retVal = false;

        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String birth_date = request.getParameter("birth_date");
            String employee_number = request.getParameter("employee_number");
            String salary = request.getParameter("salary");
            String position = request.getParameter("position");
            String reporting_line_manager = request.getParameter("reporting_line_manager");
            String email = request.getParameter("email");

            retVal = emp.editEmployee(new Employee(name, surname, LocalDate.parse(birth_date), employee_number, Double.parseDouble(salary),position, reporting_line_manager, email), employee_number);

            if (retVal != false) {
                out.print("Employee updated");
                response.sendRedirect("http://localhost:8080/epi_use_africa_assessment_fumani/ShowEmpList");

            } else {
                out.print("failed to update employee");
                // RequestDispatcher rd = request.getRequestDispatcher("updateCategoryForm.jsp");
                // rd.forward(request, response);
            }
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // Add this method to handle GET requests if necessary
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
