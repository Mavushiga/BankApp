<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank App</title>
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
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
            background-color: rgba(255, 255, 255, 0.5);
            max-width: 300px;
            width: 100%;
            text-align: center;
            margin-top: 10px;
        }

        h1 {
            margin-bottom: 30px;
            font-size: 2.5em;
            color: #333;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        button {
            padding: 15px 30px;
            font-size: 1.2em;
            cursor: pointer;
            border: none;
            background-color: #32CD32;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Bank App</h1>
        <div class="button-container">
            <button onclick="window.location.href='login.jsp'">Admin</button>
            <button onclick="window.location.href='customerLogin.jsp'">Customer</button>
        </div>
    </div>
</body>
</html>
