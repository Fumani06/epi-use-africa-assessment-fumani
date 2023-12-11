<%-- 
    Document   : editEmployeeForm
    Created on : Dec 9, 2023, 5:52:27 PM
    Author     : User73
--%>

<%@page import="za.co.employee.model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Employee data = (Employee) request.getAttribute("data");

%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Form</title>
        <style>
            form {
                border: #fff1f4; 
                padding: 10px;
                width: 300px; /* Adjust the width as needed */
                margin: auto;
                
            }

            label {
                display: block;
                margin-bottom: 5px;
                color: #ff3385;
            }

            input {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                box-sizing: border-box;
                border: 1px solid green;
                border-radius: 4px;
            }

            input.custom-btn {
                background-color: #ff66b2;;
                color: white;
                cursor: pointer;
            }
        </style>
    </head>
    <body>

        <form action="UpdateEmployee" method="POST">
            <caption>Edit An Employee</caption>

            <label for="name">Name: </label>
            <input type="text" name="name" value="<%= data.getName()%>" required>

            <label for="surname">Surname:</label>
            <input type="text" name="surname" value="<%= data.getSurname()%>" required>

            <label for="birth_date">Date of Birth:</label>
            <input type="text" name="birth_date" value="<%= data.getBirth_date()%>" required>

            <label for="email">Email:</label>
            <input type="text" name="email" value="<%= data.getEmail()%>" required>

            <label for="employee_number">Employee No:</label>
            <input type="text" name="employee_number" value="<%= data.getEmployee_number()%>" required>

            <label for="salary">Salary:</label>
            <input type="text" name="salary" value="<%= data.getSalary()%>" required>

            <label for="position">Position:</label>
            <input type="text" name="position" value="<%= data.getPosition()%>" required><!-- comment -->

            <label for="reporting_line_manager">Reporting line manager:</label>
            <input type="text" name="reporting_line_manager" value="<%= data.getReporting_line_manager()%>" required>

            <input type="submit" class="custom-btn" value="Update">
        </form>

        <!-- Add your scripts and other body elements as needed -->
    </body>
</html>
