<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Customer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
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
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
            background-color: rgba(255, 255, 255, 0.5);
            text-align: center;
            
        }
        .input-group {
            margin: 10px 0;
            display: flex;
            align-items: center;
            color:black;
        }
        .input-group label {
            flex: 1;
            margin-right: 10px;
            color: black;
            
        }
        .input-group input {
            flex: 2;
            padding: 8px;
            font-size: 16px;
            width: 80%;
            border: none;
            border-radius: 5px;
            ;
        }
        .button {
            margin: 20px 0;
            padding: 12px 24px;
            font-size: 16px;
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
    <script>
        function confirmDeletion() {
            return confirm("Are you sure you want to delete this customer?");
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Delete Customer</h1>
        <form method="post" action="deleteCustomerAction.jsp" onsubmit="return confirmDeletion();">
            <div class="input-group">
                <label for="account_no">Account Number:</label>
                <input type="text" id="account_no" name="account_no" required>
            </div>
            <div class="input-group">
                <label for="full_name">Full Name:</label>
                <input type="text" id="full_name" name="full_name" required>
            </div>
            <button class="button" type="submit">Delete</button>
        </form>
    </div>
</body>
</html>
