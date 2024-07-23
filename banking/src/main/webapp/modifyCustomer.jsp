<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modify Customer</title>
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
            max-width: 800px;;
            margin: 0 auto;
            text-align: left;
            background-color: rgba(255, 255, 255, 0.5);
            padding: 20px;
            border-radius: 10px;
            color: black;
        }
        .input-group {
            margin: 10px 0;
            display: flex;
            align-items: center;
        }
        .input-group label {
            flex: 1;
            margin-right: 10px;
        }
        .input-group input {
            flex: 2;
            padding: 5px;
            font-size: 16px;
            width: 50%;
            border: none;
            border-radius: 5px;
        }
        .button-group {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }
        .button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            color: white;
            background-color: #32CD32;
            border: none;
            border-radius: 5px;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Modify Customer</h1>
        <form method="post" action="modifyCustomerDetails.jsp">
            <div class="input-group">
                <label for="account_no">Account Number:</label>
                <input type="text" id="account_no" name="account_no" required>
            </div>
            <div class="button-group">
                <button class="button" type="submit">Search</button>
            </div>
        </form>
    </div>
</body>
</html>