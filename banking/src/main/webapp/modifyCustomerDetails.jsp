<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modify Customer Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            color: #333;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            text-align: left;
            background-color: #f2f2f2;
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
        .input-group input,
        .input-group select {
            flex: 2;
            padding: 5px;
            font-size: 16px;
            width: 80%;
            border: none;
            border-radius: 5px;
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
    </style>
</head>
<body>
    <div class="container">
        <h1>Modify Customer Details</h1>
        <%
            String accountNo = request.getParameter("account_no");
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String url = "jdbc:mysql://localhost:3306/bank1";
            String user = "root";
            String password = "Mav#123";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, user, password);
                String query = "SELECT * FROM customer WHERE account_no = ?";
                ps = con.prepareStatement(query);
                ps.setString(1, accountNo);
                rs = ps.executeQuery();

                if (rs.next()) {
        %>
        <form method="post" action="updateCustomerDetails.jsp">
            <div class="input-group">
                <label for="account_no">Account Number:</label>
                <input type="text" id="account_no" name="account_no" value="<%= rs.getString("account_no") %>" readonly>
            </div>
            <div class="input-group">
                <label for="full_name">Full Name:</label>
                <input type="text" id="full_name" name="full_name" value="<%= rs.getString("full_name") %>" required>
            </div>
            <div class="input-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="<%= rs.getString("address") %>" required>
            </div>
            <div class="input-group">
                <label for="mobile_no">Mobile No:</label>
                <input type="text" id="mobile_no" name="mobile_no" value="<%= rs.getString("mobile_no") %>" required>
            </div>
            <div class="input-group">
                <label for="email_id">Email ID:</label>
                <input type="email" id="email_id" name="email_id" value="<%= rs.getString("email_id") %>" required>
            </div>
            <div class="input-group">
                <label for="account_type">Account Type:</label>
                <select id="account_type" name="account_type" required>
                    <option value="Savings" <%= rs.getString("account_type").equals("Savings") ? "selected" : "" %>>Savings</option>
                    <option value="Current" <%= rs.getString("account_type").equals("Current") ? "selected" : "" %>>Current</option>
                </select>
            </div>
            <div class="input-group">
                <label for="initial_balance">Initial Balance:</label>
                <input type="number" id="initial_balance" name="initial_balance" value="<%= rs.getString("initial_balance") %>" min="1000" required>
            </div>
            <div class="input-group">
                <label for="date_of_birth">Date of Birth:</label>
                <input type="date" id="date_of_birth" name="date_of_birth" value="<%= rs.getString("date_of_birth") %>" required>
            </div>
            <div class="input-group">
                <label for="id_proof">ID Proof:</label>
                <input type="text" id="id_proof" name="id_proof" value="<%= rs.getString("id_proof") %>" required>
            </div>
            <button class="button" type="submit">Update</button>
        </form>
        <%
                } else {
                    out.println("<p>No customer found with account number: " + accountNo + "</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
</body>
</html>