<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.UUID" %>
<%
    // Retrieve form parameters
    String fullName = request.getParameter("full_name");
    String address = request.getParameter("address");
    String mobileNo = request.getParameter("mobile_no");
    String emailId = request.getParameter("email_id");
    String accountType = request.getParameter("account_type");
    String initialBalance = request.getParameter("initial_balance");
    String dateOfBirth = request.getParameter("date_of_birth");
    String idProof = request.getParameter("id_proof");

    // Generate account number and temporary password
    String accountNo = UUID.randomUUID().toString().replace("-", "").substring(0, 10);
    String tempPassword = UUID.randomUUID().toString().replace("-", "").substring(0, 8);

    Connection conn = null;
    PreparedStatement ps = null;
    PreparedStatement psPublic = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank1", "root", "Mav#123");

        // Insert customer details into the database
        String sql = "INSERT INTO Customer (full_name, address, mobile_no, email_id, account_type, initial_balance, date_of_birth, id_proof, account_no, temp_password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, fullName);
        ps.setString(2, address);
        ps.setString(3, mobileNo);
        ps.setString(4, emailId);
        ps.setString(5, accountType);
        ps.setString(6, initialBalance);
        ps.setString(7, dateOfBirth);
        ps.setString(8, idProof);
        ps.setString(9, accountNo);
        ps.setString(10, tempPassword);
        ps.executeUpdate();

        String sqlPublic = "INSERT INTO customer_public (full_name, address, mobile_no, email_id, account_type, initial_balance, date_of_birth, id_proof) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        psPublic = conn.prepareStatement(sqlPublic);
        psPublic.setString(1, fullName);
        psPublic.setString(2, address);
        psPublic.setString(3, mobileNo);
        psPublic.setString(4, emailId);
        psPublic.setString(5, accountType);
        psPublic.setString(6, initialBalance);
        psPublic.setString(7, dateOfBirth);
        psPublic.setString(8, idProof);
        psPublic.executeUpdate();

        // Redirect to confirmation page with account details
        request.setAttribute("accountNo", accountNo);
        request.setAttribute("tempPassword", tempPassword);
        request.setAttribute("emailId", emailId);
        request.getRequestDispatcher("registerConfirmation.jsp").forward(request, response);
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h1>Error registering customer. Please try again.</h1>");
    } finally {
        if (ps != null) ps.close();
        if (psPublic != null) psPublic.close();
        if (conn != null) conn.close();
    }
%>