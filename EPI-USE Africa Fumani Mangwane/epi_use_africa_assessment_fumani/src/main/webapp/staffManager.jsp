<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>EMPLOYEES MANAGER</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Pacifico', cursive, 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .background-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background: url('http://www.syntacticsinc.com/wp-content/uploads/2021/01/Must-Have-Technical-Skills-of-a-Website-Project-Manager-Project-Manager-Facilitating-a-Meeting-with-Development-Team.jpg') fixed center;
            background-size: cover;
            filter: blur(5px);
            opacity: 0.7;
        }

        .navbar {
            background-color: #ff80ab; /* Girly navbar color */
            z-index: 1; /* Ensure navbar is above background */
        }

        .navbar-brand {
            color: #2c3e50; /* Dark text color for contrast */
        }

        .navbar-toggler-icon {
            background-color: #2c3e50; /* Dark color for the toggle icon */
        }

        .navbar-nav .nav-link {
            color: #2c3e50; /* Dark text color for contrast */
        }

        h3 {
            margin-top: 20px;
            color: #2c3e50; /* Dark text color for contrast */
        }

        .card {
            background-color: #ffb6c1; /* Light pink card background */
            margin-top: 20px;
        }

        .card-title {
            color: #2c3e50; /* Dark text color for contrast */
        }

        .btn-light {
            background-color: #ff80ab; /* Girly button color */
            color: #2c3e50; /* Dark text color for contrast */
        }
    </style>
</head>
<body>
<div class="background-container"></div>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index.jsp">EPI-USE AFRICA</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container mt-4">
    <h5 class="card-title">Optimize Team Dynamics</h5>
    <hr>

    <div class="row justify-content-center">
        <div class="col-lg-4 col-md-6 mt-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Effortlessly Oversee Your Team</h5>
                    <p class="card-text">Seamlessly Add, Edit, Delete</p>
                    <a href="http://localhost:8080/epi_use_africa_assessment_fumani/ShowEmpList" class="btn btn-light">EXPLORE</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
