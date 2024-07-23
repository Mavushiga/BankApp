<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="java.util.ArrayList, java.util.List, java.util.Date, genpact.Transaction" %>
<%@ page import="java.io.StringWriter, java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Transactions</title>
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
            max-width: 800px;
            margin: 0 auto;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
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
        label {
            display: block;
            margin-bottom: 5px;
            font-size: 18px;
        }
        input[type="text"], input[type="submit"] {
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>View Transactions</h1>
        <form action="" method="get">
            <label for="accountNumber">Account Number:</label>
            <input type="text" id="accountNumber" name="accountNumber" required>
            <input type="submit" value="View Transactions">
        </form>
        <table>
            <thead>
                <tr>
                    <th>Transaction ID</th>
                    <th>Type</th>
                    <th>Amount</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String accountNumber = request.getParameter("accountNumber");

                    if (accountNumber == null || accountNumber.isEmpty()) {
                        out.println("<tr><td colspan='4'>Account number is missing.</td></tr>");
                    } else {
                        List<Transaction> transactions = new ArrayList<>();

                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank1", "root", "Mav#123");

                            String query = "SELECT * FROM transactions WHERE accountNumber = ? ORDER BY transaction_date DESC LIMIT 10";
                            pstmt = conn.prepareStatement(query);
                            pstmt.setString(1, accountNumber);
                            rs = pstmt.executeQuery();

                            while (rs.next()) {
                                Transaction transaction = new Transaction();
                                transaction.setId(rs.getInt("id"));
                                transaction.setType(rs.getString("type"));
                                transaction.setAmount(rs.getDouble("amount"));
                                transaction.setTransactionDate(new Date(rs.getTimestamp("transaction_date").getTime()));
                                transaction.setAccountNumber(rs.getString("accountNumber")); // Set account number
                                transactions.add(transaction);
                            }

                            if (!transactions.isEmpty()) {
                                for (Transaction transaction : transactions) {
                        %>
                        <tr>
                            <td><%= transaction.getId() %></td>
                            <td><%= transaction.getType() %></td>
                            <td><%= transaction.getAmount() %></td>
                            <td><%= transaction.getTransactionDate() %></td>
                        </tr>
                        <%
                                }
                            } else {
                                out.println("<tr><td colspan='4'>No transactions available for account number: " + accountNumber + ".</td></tr>");
                            }
                        } catch (ClassNotFoundException e) {
                            StringWriter sw = new StringWriter();
                            PrintWriter pw = new PrintWriter(sw);
                            e.printStackTrace(pw);
                            out.println("<tr><td colspan='4'>Error: JDBC Driver not found.<br>" + sw.toString() + "</td></tr>");
                        } catch (SQLException e) {
                            StringWriter sw = new StringWriter();
                            PrintWriter pw = new PrintWriter(sw);
                            e.printStackTrace(pw);
                            out.println("<tr><td colspan='4'>Error: Database access error.<br>" + sw.toString() + "</td></tr>");
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    }
                %>
            </tbody>
        </table>
        <button class="button" onclick="window.print()">Print</button>
    </div>
</body>
</html>