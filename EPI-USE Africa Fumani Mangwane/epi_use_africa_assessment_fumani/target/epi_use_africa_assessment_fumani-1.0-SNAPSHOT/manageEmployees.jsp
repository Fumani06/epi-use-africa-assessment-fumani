<%@page import="za.co.employee.model.Employee"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MANAGE EMPLOYEES</title>
        <style>
            /* Updated styles for navigation bar */
            .navbar {
                background-color: #ff66b2; /* Pink color */

                font-family: 'YourCursiveFont', cursive;
            }

            /* Updated styles for table borders */
            table {
                border-collapse: collapse;
                width: 100%;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #ff66b2; /* Pink border */
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #ff66b2; /* Pink background for header */
                color: white;

                font-family: 'YourCursiveFont', cursive;
            }

            /* Updated styles for buttons */
            .custom-btn {
                background-color: #ff66b2; /* Pink color */
                color: white;
                border: 1px solid #ff66b2; /* Pink border */
                padding: 10px 20px;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 4px; /* Rounded corners */
                background-color: #ff66b2; /* Pink color */
                font-family: 'YourCursiveFont', cursive;
            }

            /* Updated styles for modal */
            .modal-content {
                background-color: #fff1f4; /* Light pink background */
                margin: 10% auto;
                padding: 20px;
                border: 1px solid #ff66b2; /* Pink border */
                width: 80%;
                max-width: 400px;
                border-radius: 8px;
            }

            /* Updated styles for form container */
            .form-container {
                max-width: 400px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ff66b2; /* Pink border */
                border-radius: 8px;
            }

            /* Updated styles for form labels and inputs */
            .form-label {
                display: block;
                margin-bottom: 8px;
                color: #ff66b2; /* Pink color */
            }

            .form-input,
            .form-select {
                width: 100%;
                padding: 8px;
                margin-bottom: 16px;
                box-sizing: border-box;
                border: 1px solid #ff66b2; /* Pink border */
                border-radius: 4px;
            }

            /* Updated styles for form submit button */
            .form-submit {
                background-color: #ff66b2; /* Pink color */
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .form-submit:hover {
                background-color: #ff3385; /* Darker pink color on hover */
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp" style="font-size: 50px; color: black;">EPI-USE AFRICA</a>

        </nav>

        <div class="row">
            <div class="container">
                <h3 class="text-center">Employees Portal</h3>
                <hr>

                <div id="addEmployeeModal" class="modal">
                    <div class="modal-content">
                        <span class="close" onclick="closeModal()">&times;</span>
                        <form action="addEmployee" method="POST" class="form-container">
                            <label for="name" class="form-label">Name:</label>
                            <input type="text" name="name" class="form-input" required>

                            <label for="surname" class="form-label">Surname:</label>
                            <input type="text" name="surname" class="form-input" required>

                            <label for="birth_date" class="form-label">Date of Birth:</label>
                            <input type="date" name="birth_date" class="form-input" required>

                            <label for="email" class="form-label">Email:</label>
                            <input type="email" name="email" class="form-input" required>

                            <label for="password" class="form-label">Password:</label>
                            <input type="text" name="password" class="form-input" required>

                            <label for="employee_number" class="form-label">Employee No:</label>
                            <input type="text" name="employee_number" class="form-input" required>

                            <label for="salary" class="form-label">Salary:</label>
                            <input type="text" name="salary" class="form-input" required>

                            <label for="position" class="form-label">Position:</label>
                            <input type="text" name="position" class="form-input" required>

                            <label for="reporting_line_manager" class="form-label">Reporting line manager:</label>
                            <select name="reporting_line_manager" class="form-select">
                                <option value="CEO">CEO</option>
                                <option value="Team Manager">Team Manager</option>
                                <option value="Project Manager">Project Manager</option>
                            </select>

                            <input type="submit" class="form-submit" value="Submit">
                        </form>
                    </div>
                </div>

                <div class="container justify-content-left">
                    <div class="row justify-content-left">
                        <div class="col-lg-4 col-md-6 mt-3">
                            <a href="javascript:void(0);" class="custom-btn" onclick="openModal()">Add An Employee</a>
                        </div>
                    </div>
                </div>

                <!-- Exit button -->
                <div class="container justify-content-right">
                    <div class="row justify-content-right">
                        <div class="col-lg-4 col-md-6 mt-3">
                            <a href="staffManager.jsp" class="custom-btn">Exit</a>
                        </div>
                    </div>
                </div>

                <form action="ShowEmpList" method="GET">
                    <div>
                        <label for="filterInput">Filter by Name:</label>
                        <input type="text" id="filterInput" onkeyup="filterTable()">
                    </div>
                    <br>
                    <div>
                        <label for="sortInput">Sort Alphabetical:</label>
                        <input type="text" id="sortInput" onkeyup="filterAndSortTable()">
                    </div>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Surname</th>
                                <th>Date of Birth</th>
                                <th>Employee No</th>
                                <th>Email</th>                                
                                <th>Role</th>
                                <th>Reports to.</th>
                                <th>Salary</th>
                                <th>Action</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <%
                            List<Employee> myEmpList = (List<Employee>) request.getAttribute("employeesList");
                            for (Employee list : myEmpList) {%>
                        <tr>
                            <td><%= list.getName()%></td>
                            <td><%= list.getSurname()%></td>
                            <td><%= list.getBirth_date()%></td>
                            <td><%= list.getEmployee_number()%></td>
                            <td><%= list.getEmail()%></td>
                            <td><%= list.getPosition()%></td>
                            <td><%= list.getReporting_line_manager()%></td>
                            <td><%= list.getSalary() + "0"%></td>
                            <td>
                                <a href="EditEmployee?employee_number=<%=list.getEmployee_number()%>" class="custom-btn">
                                    <i class="fas fa-pen"></i> 
                                </a>
                            </td>

                            <!-- Delete button with trash bin icon -->
                            <td>
                                <a href="DeleteEmployee?employee_number=<%=list.getEmployee_number()%>" class="custom-btn">
                                    <i class="fas fa-trash"></i> 
                                </a>
                            </td>
                        </tr>
                        <% }%>
                    </table>
                </form>
            </div>
        </div>

        <script>
            function openModal() {
                var modal = document.getElementById("addEmployeeModal");
                modal.style.display = "block";
            }

            function closeModal() {
                var modal = document.getElementById("addEmployeeModal");
                modal.style.display = "none";
            }

            // Close the modal if the user clicks outside the form
            window.onclick = function (event) {
                var modal = document.getElementById("addEmployeeModal");
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
            function filterTable() {
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("filterInput");
                filter = input.value.toUpperCase();
                table = document.querySelector("table");
                tr = table.getElementsByTagName("tr");
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[0]; // Change the index to the desired column
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }

            function filterAndSortTable() {
                var input, filter, table, tr, td, i, txtValues;
                input = document.getElementById("sortInput");
                filter = input.value.toUpperCase();
                table = document.querySelector("table");
                tr = table.getElementsByTagName("tr");

                // Create an array to store table rows
                var rows = [];

                for (i = 1; i < tr.length; i++) {  // Start from index 1 to exclude the heading row
                    txtValues = [];
                    td = tr[i].getElementsByTagName("td");

                    // Store the text content of each column in txtValues array
                    for (var j = 0; j < td.length; j++) {
                        txtValues.push(td[j].textContent || td[j].innerText);
                    }

                    // Check if any column contains the filter value
                    if (txtValues.some(value => value.toUpperCase().indexOf(filter) > -1)) {
                        tr[i].style.display = "";
                        rows.push(tr[i]);
                    } else {
                        tr[i].style.display = "none";
                    }
                }

                // Sort the rows alphabetically based on the first column
                rows.sort(function (a, b) {
                    var textA = a.getElementsByTagName("td")[0].textContent || a.getElementsByTagName("td")[0].innerText;
                    var textB = b.getElementsByTagName("td")[0].textContent || b.getElementsByTagName("td")[0].innerText;
                    return textA.localeCompare(textB);
                });

                // Clear the table
                for (i = 1; i < tr.length; i++) {  // Start from index 1 to exclude the heading row
                    table.removeChild(tr[i]);
                }

                // Append the sorted rows back to the table
                for (i = 0; i < rows.length; i++) {
                    table.appendChild(rows[i]);
                }
            }


        </script>
    </body>
</html>
