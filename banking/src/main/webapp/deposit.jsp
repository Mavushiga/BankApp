<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deposit</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            background-image: url("https://getlegalindia.com/wp-content/uploads/2021/10/what-is-provident-fund.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            background-position: center calc(40% - 5px);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }
        .container {
            width:400px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .form-group {
            margin: 15px 0;
        }
        .form-group label {
            display: block;
            font-size: 18px;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .button {
            padding: 10px 20px;
            font-size: 18px;
            background-color: #32CD32;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Deposit</h1>
        <form action="deposit" method="post">
            <div class="form-group">
                <label for="depositAmount">Deposit Amount:</label>
                <input type="number" id="depositAmount" name="amount" step="0.01" required>
            </div>
            <button type="submit" class="button">Deposit</button>
        </form>
    </div>
</body>
</html>
