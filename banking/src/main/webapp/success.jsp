<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url("https://getlegalindia.com/wp-content/uploads/2021/10/what-is-provident-fund.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            background-position: center calc(40% - 5px);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 30px;
            text-align: left;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
            color: #333;
        }
        .header {
            text-align: center;
            padding-bottom: 20px;
        }
        .button-container {
            text-align: center;
            margin-bottom: 20px;
        }
        .button-container button {
            padding: 10px 20px;
            font-size: 18px;
            background-color: #32CD32;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-right: 10px;
        }
        .button-container button:last-child {
            margin-right: 0;
        }
        .button-container button.active {
            background-color: #32CD32;
        }
        #content {
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .button {
            margin: 20px 0;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .input-group {
            margin: 15px 0;
            display: flex;
            align-items: center;
        }
        .input-group label {
            flex: 1;
            margin-right: 10px;
            color: #666;
        }
        .input-group input,
        .input-group select {
            flex: 2;
            padding: 10px;
            font-size: 16px;
            width: 80%;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#btnRegister").click(function() {
                $("#content").load("registerCustomer.jsp");
                $(".button-container button").removeClass("active");
                $(this).addClass("active");
            });
            $("#btnViewCustomer").click(function() {
                $("#content").load("viewCustomer.jsp");
                $(".button-container button").removeClass("active");
                $(this).addClass("active");
            });
            $("#btnModifyCustomer").click(function() {
                $("#content").load("modifyCustomer.jsp");
                $(".button-container button").removeClass("active");
                $(this).addClass("active");
            });
            $("#btnDeleteCustomer").click(function() {
                $("#content").load("deleteCustomer.jsp");
                $(".button-container button").removeClass("active");
                $(this).addClass("active");
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Admin Panel</h1>
        </div>
        <div class="button-container">
            <button id="btnRegister" class="active">Register</button>
            <button id="btnViewCustomer">View Customer</button>
            <button id="btnModifyCustomer">Modify Customer</button>
            <button id="btnDeleteCustomer">Delete Customer</button>
        </div>
        <div id="content">
            <!-- Content will be dynamically loaded here -->
        </div>
    </div>
</body>
</html>
