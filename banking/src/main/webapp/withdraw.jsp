<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Withdraw</title>
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
            width:400px;
            margin: 0 auto;
            padding: 30px;
            text-align: center;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
            color: #333;
        }
        .form-group {
            margin: 15px 0;
            text-align: left;
        }
        .form-group label {
            display: block;
            font-size: 18px;
            margin-bottom: 5px;
            color: #666;
        }
        .form-group input {
            padding: 10px;
            width: 100%;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
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
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Withdraw</h1>
        <form action="withdraw" method="post">
            <div class="form-group">
                <label for="withdrawAmount">Withdraw Amount:</label>
                <input type="number" id="withdrawAmount" name="amount" step="0.01" required>
            </div>
            <button type="submit" class="button">Withdraw</button>
        </form>
    </div>
</body>
</html>
