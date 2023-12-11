package za.co.employee.dao.impl;

import za.co.employee.dao.EmployeeDao;
import za.co.employee.model.Employee;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDaoImpl implements EmployeeDao {

    private static EmployeeDao employeeDao = null;
    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public EmployeeDaoImpl(Connection con) {
        this.con = con;
        
    }

    //--------------------------------------------------------
    public static EmployeeDaoImpl getInstance(Connection dbCon) {
        if (employeeDao == null) {
            employeeDao = new EmployeeDaoImpl(dbCon);
        }
        return (EmployeeDaoImpl) employeeDao;
    }

    @Override
    public List<Employee> getAllEmployees() {
        List<Employee> allEmployees = new ArrayList();
        if (con != null) {
            try {
                ps = con.prepareStatement("SELECT * FROM employee");
                rs = ps.executeQuery();
                while (rs.next()) {
                    allEmployees.add(new Employee(rs.getString("name"), rs.getString("surname"), rs.getDate("birth_date").toLocalDate(), rs.getString("employee_number"), rs.getDouble("salary"), rs.getString("position"), rs.getString("reporting_line_manager"), rs.getString("email")));
                }
            } catch (SQLException ex) {
                System.out.println("Error!!: " + ex.getMessage());
            } finally {
                if (ps != null) {
                    try {
                        ps.close();
                    } catch (SQLException ex) {
                        System.out.println("Could not close: " + ex.getMessage());
                    }
                }
            }
        }
        return allEmployees;
    }

    @Override
    public boolean addEmployee(Employee employee) {
        boolean retVal = false;
        try {
            ps = con.prepareStatement("INSERT INTO employee (name, surname, birth_date, employee_number, salary, position, reporting_line_manager, password, email) values(?,?,?,?,?,?,?,?,?)");

            ps.setString(1, employee.getName());
            ps.setString(2, employee.getSurname());
            ps.setString(3, employee.getBirth_date().toString());
            ps.setString(4, employee.getEmployee_number());
            ps.setDouble(5, employee.getSalary());
            ps.setString(6, employee.getPosition());
            ps.setString(7, employee.getReporting_line_manager());
            ps.setString(8, employee.getPassword());
            ps.setString(9, employee.getEmail());
            if (ps.executeUpdate() > 0) {
                retVal = true;
            }
        } catch (SQLException ex) {
            System.out.println("Add user ERROR: " + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("Close prepared statment ERROR: " + ex.getMessage());
                }
            }
        }
        return retVal;

    }

    @Override
    public boolean editEmployee(Employee employee, String employee_number) {
        boolean retVal = false;
        try {
            ps = con.prepareStatement("UPDATE employee SET name=?, surname=?, birth_date=?, employee_number=?, salary=?, position=?, reporting_line_manager=?,email=? WHERE employee_number=?");

            ps.setString(1, employee.getName());
            ps.setString(2, employee.getSurname());
            ps.setString(3, employee.getBirth_date().toString());
            ps.setString(4, employee.getEmployee_number());
            ps.setDouble(5, employee.getSalary());
            ps.setString(6, employee.getPosition());
            ps.setString(7, employee.getReporting_line_manager());
             ps.setString(8, employee.getEmail());
            ps.setString(9, employee_number);

            retVal = ps.executeUpdate() > 0;

        } catch (SQLException ex) {
            System.out.println("Update user ERROR: " + ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("Close prepared statment ERROR: " + ex.getMessage());
                }
            }
        }
        return retVal;
    }

    @Override
    public boolean deleteEmployee(String employee_number) {
        boolean retVal = false;
        try {
            ps = con.prepareStatement("DELETE FROM employee WHERE employee_number=?");
            ps.setString(1, employee_number);

            int rowsAffected = ps.executeUpdate();

            retVal = rowsAffected > 0;
        } catch (SQLException exception) {
            System.out.println("Delete employee Error!!: " + exception.getMessage());
        }
        return retVal;
    }

    @Override
    public Employee getEmployees(String employee_number) {
        Employee aEmployee = null;
        try {
            ps = con.prepareStatement("Select name, surname, birth_date, employee_number, salary, position, reporting_line_manager, email FROM employee WHERE employee_number=?");
            ps.setString(1, employee_number);
            rs = ps.executeQuery();
            if (rs.next()) {
                aEmployee = new Employee(rs.getString("name"),rs.getString("surname"), rs.getDate("birth_date").toLocalDate(), rs.getString("employee_number"), rs.getDouble("salary"),
                        rs.getString("position"), rs.getString("reporting_line_manager"), rs.getString("email"));
            }
        } catch (SQLException ex) {
            System.out.println("Get User ERROR: " + ex.getMessage());
        }
        return aEmployee;

    }

    public static void main(String[] args) {

        //  System.out.println("Connected");
        Connection myCon = null;
        try {
            String theURL = "jdbc:mysql://localhost:3306/epi_use_africa_assessment_database";
            String userID = "root";
            String passwd = "root";
            myCon = DriverManager.getConnection(theURL, userID, passwd);

            System.out.println("Running....");
            EmployeeDao ed = new EmployeeDaoImpl(myCon);
           
            System.out.println("result: " + ed.addEmployee(new Employee("Akani", "Zitha", LocalDate.of(2000,04,06), "563278", 10000.00, "Accountant", "CEO", "0000", "akani@gmail.com")));
//             EmployeeDaoImpl empdao = new EmployeeDaoImpl(myCon);
//             List<Employee> list = new ArrayList();
//             list = empdao.getAllEmployees();
//             for(Employee myEmp : list){
//               System.out.println(myEmp);
//              }
//            //Employee em = empdao.getEmployees("58679G");
            //  System.out.println(em);
           System.out.println("result: "+ed.deleteEmployee("563278"));
        } catch (SQLException e) {
            System.err.println("Connection Failure: " + e.toString());
        } finally {
// let us now close the connection established
            if (myCon != null) {
                try {
                    myCon.close();
                } catch (SQLException e) {
                }
            }
        }
    }
}
