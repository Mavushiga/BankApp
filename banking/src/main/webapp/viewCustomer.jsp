<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Customers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            color: #333;
        }
        .container {
            width: 90%;
            margin: 0 auto;
            text-align: left;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            color: black;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>View Customers</h1>
        <table>
            <thead>
                <tr>
                    <th>Account Number</th>
                    <th>Full Name</th>
                    <th>Address</th>
                    <th>Mobile No</th>
                    <th>Email ID</th>
                    <th>Account Type</th>
                    <th>Initial Balance</th>
                    <th>Date of Birth</th>
                    <th>ID Proof</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank1", "root", "Mav#123");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT account_no, full_name, address, mobile_no, email_id, account_type, initial_balance, date_of_birth, id_proof FROM customer");

                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("account_no") %></td>
                    <td><%= rs.getString("full_name") %></td>
                    <td><%= rs.getString("address") %></td>
                    <td><%= rs.getString("mobile_no") %></td>
                    <td><%= rs.getString("email_id") %></td>
                    <td><%= rs.getString("account_type") %></td>
                    <td><%= rs.getString("initial_balance") %></td>
                    <td><%= rs.getString("date_of_birth") %></td>
                    <td><%= rs.getString("id_proof") %></td>
                </tr>
                <%
                    }
                    con.close();
                %>
            </tbody>
        </table>
    </div>
</body>
</html>