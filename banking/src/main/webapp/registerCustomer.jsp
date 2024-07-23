<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Customer</title>
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
            max-width: 1000px;
            margin: 0 auto;
            padding: 70px;
            text-align: left;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
            color: #333;
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
        .button-group {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }
        .button {
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            text-decoration: none;
            color: white;
            background-color: #32CD32;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Register Customer</h1>
        <form method="post" action="registerCustomerAction.jsp">
            <div class="input-group">
                <label for="full_name">Full Name:</label>
                <input type="text" id="full_name" name="full_name" required>
            </div>
            <div class="input-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="input-group">
                <label for="mobile_no">Mobile No:</label>
                <input type="text" id="mobile_no" name="mobile_no" required>
            </div>
            <div class="input-group">
                <label for="email_id">Email ID:</label>
                <input type="email" id="email_id" name="email_id" required>
            </div>
            <div class="input-group">
                <label for="account_type">Account Type:</label>
                <select id="account_type" name="account_type" required>
                    <option value="Savings">Savings</option>
                    <option value="Current">Current</option>
                </select>
            </div>
            <div class="input-group">
                <label for="initial_balance">Initial Balance:</label>
                <input type="number" id="initial_balance" name="initial_balance" min="1000" required>
            </div>
            <div class="input-group">
                <label for="date_of_birth">Date of Birth:</label>
                <input type="date" id="date_of_birth" name="date_of_birth" required>
            </div>
            <div class="input-group">
                <label for="id_proof">ID Proof:</label>
                <input type="text" id="id_proof" name="id_proof" required>
            </div>
            <div class="button-group">
                <button class="button" type="submit">Register</button>
            </div>
        </form>
    </div>
</body>
</html>