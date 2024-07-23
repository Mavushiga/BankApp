<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
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
            width: 80%;
            margin: 0 auto;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
            text-align: center;
            color: #333;
        }
        .header {
            margin-bottom: 20px;
        }
        .header h1 {
            margin: 0;
        }
        .button-container {
            margin: 20px 0;
        }
        .button-container button {
            padding: 10px 20px;
            font-size: 16px;
            margin: 0 10px;
            border: none;
            border-radius: 5px;
            background-color: #32CD32;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .button-container button:hover {
            background-color: #0056b3;
        }
        .button-container form button {
            background-color: #FF4500;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Customer Dashboard</h1>
        </div>

        <%
            String accountNumber = (String) session.getAttribute("accountNumber");
            String full_name = "";
            double accountBalance = 0.0;

            if (accountNumber == null) {
                response.sendRedirect("customerLogin.jsp");
            } else {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank1", "root", "Mav#123");
                    String query = "SELECT full_name, accountBalance FROM customerLogin WHERE accountNumber = ?";
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1, accountNumber);
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                        full_name = rs.getString("full_name");
                        accountBalance = rs.getDouble("accountBalance");
                    }

                    rs.close();
                    ps.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>

        <p>Welcome, <%= full_name %>!</p>
        <p>Your account balance is: Rs.<%= accountBalance %></p>

        <div class="button-container">
            <button onclick="window.location.href='deposit.jsp'">Deposit</button>
            <button onclick="window.location.href='withdraw.jsp'">Withdraw</button>
            <button onclick="window.location.href='viewTransactions.jsp'">View Transactions</button>
        </div>

        <div class="button-container">
            <form method="post" action="LogoutServlet">
                <button type="submit">Logout</button>
            </form>
        </div>
    </div>
</body>
</html>
