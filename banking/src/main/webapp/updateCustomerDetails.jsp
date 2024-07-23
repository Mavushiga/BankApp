<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Customer Details</title>
</head>
<body>
    <%
        String accountNo = request.getParameter("account_no");
        String fullName = request.getParameter("full_name");
        String address = request.getParameter("address");
        String mobileNo = request.getParameter("mobile_no");
        String emailId = request.getParameter("email_id");
        String accountType = request.getParameter("account_type");
        String initialBalance = request.getParameter("initial_balance");
        String dateOfBirth = request.getParameter("date_of_birth");
        String idProof = request.getParameter("id_proof");

        Connection con = null;
        PreparedStatement ps = null;
        String url = "jdbc:mysql://localhost:3306/bank1";
        String user = "root";
        String password = "Mav#123";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            String query = "UPDATE customer SET full_name=?, address=?, mobile_no=?, email_id=?, account_type=?, initial_balance=?, date_of_birth=?, id_proof=? WHERE account_no=?";
            ps = con.prepareStatement(query);
            ps.setString(1, fullName);
            ps.setString(2, address);
            ps.setString(3, mobileNo);
            ps.setString(4, emailId);
            ps.setString(5, accountType);
            ps.setString(6, initialBalance);
            ps.setString(7, dateOfBirth);
            ps.setString(8, idProof);
            ps.setString(9, accountNo);

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
    %>
                <h2>Customer details updated successfully!</h2>
                <p><a href="success.jsp">Back to Admin Panel</a></p>
    <%
            } else {
    %>
                <h2>Error updating customer details. Please try again.</h2>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>