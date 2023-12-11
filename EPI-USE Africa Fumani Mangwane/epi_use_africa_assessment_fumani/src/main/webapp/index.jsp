<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EPI-USE HOME</title>
    <style>
        body {
            font-family: 'Pacifico', cursive, 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background: url('https://snacknation.com/wp-content/uploads/2022/12/Employee-Management-Software-e1670371925164.png') no-repeat center center fixed; /* Image URL */
            background-size: cover;
            position: relative;
            overflow: hidden;
        }

        header {
            background: rgba(255, 139, 148, 0.8); /* Pink background with some transparency */
            display: flex;
            justify-content: space-between; /* Space evenly between child elements */
            align-items: center;
            padding: 15px;
        }

        header h1 {
            margin: 0;
            font-size: 36px; /* Larger font size */
            color: #fff; /* White text color */
        }

        nav {
            display: flex;
            align-items: center;
        }

        nav button {
            background-color: #fff; /* White button color */
            color: #ff8b94; /* Pink text color */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
            padding: 10px 20px; /* Adjusted padding */
            transition: background-color 0.3s ease;
        }

        .center-container {
            text-align: center;
            margin-top: 30px;
        }

        h1 {
            color: #ff8b94; /* Pink text color */
            font-size: 32px; /* Larger font size */
        }

        .login-button2 {
            background-color: #fff; /* White button color */
            color: #ff8b94; /* Pink text color */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            padding: 15px 30px; /* Adjusted padding */
            margin-top: 20px;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            width: 60%;
            max-width: 600px;
            text-align: center;
            position: relative;
            margin: 20px auto; /* Center the modal */
        }

        .modal form label {
            margin-top: 15px;
            font-size: 18px; /* Larger font size */
            color: #333;
        }

        .modal form input {
            width: 100%;
            padding: 15px; /* Adjusted padding */
            margin-top: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .modal form button {
            cursor: pointer;
            margin-top: 20px;
            background-color: #ff8b94; /* Pink button color */
            color: #fff; /* White text color */
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            padding: 15px 30px; /* Adjusted padding */
        }

        .close {
            position: absolute;
            top: 15px;
            right: 15px;
            font-size: 24px;
            cursor: pointer;
            color: #333;
        }
    </style>
</head>

<body>

    <header>
        <h1>EPI-USE AFRICA</h1>
        <nav>
            <button class="login-button2" onclick="openModal('loginModal')">Login</button>
        </nav>
    </header>

    <div id="loginModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('loginModal')">&times;</span>
            <form id="loginForm" onsubmit="return validateLogin()">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <button type="submit">Login</button>
            </form>
        </div>
    </div>

    <script>
        function openModal(modalId) {
            document.getElementById(modalId).style.display = 'flex';
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        document.getElementById('loginModal').addEventListener('click', function (event) {
            if (event.target === this) {
                closeModal('loginModal');
            }
        });

        function validateLogin() {
            var username = document.getElementById('username').value;
            var password = document.getElementById('password').value;

            // Check if the provided credentials are valid
            if (username === 'employee' && password === '1234') {
                // Redirect to staffManager.jsp
                window.location.href = 'staffManager.jsp';
                return false; // Prevent the form from submitting
            } else {
                // Show error message
                alert('Invalid credentials entered. Please try again.');
                return false; // Prevent the form from submitting
            }
        }
    </script>

</body>

</html>
