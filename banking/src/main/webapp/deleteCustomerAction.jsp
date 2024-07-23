<%@ page import="java.sql.*" %>
<%
    String accountNo = request.getParameter("account_no");
    String fullName = request.getParameter("full_name");

    // Database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank1", "root", "Mav#123");

    // Delete customer from customer table
    PreparedStatement pst = con.prepareStatement("DELETE FROM customer WHERE account_no = ? AND full_name = ?");
    pst.setString(1, accountNo);
    pst.setString(2, fullName);
    int rowsAffected = pst.executeUpdate();

    // Delete customer from customer_public table
    pst = con.prepareStatement("DELETE FROM customer WHERE account_no = ? AND full_name = ?");
    pst.setString(1, accountNo);
    pst.setString(2, fullName);
    pst.executeUpdate();

    con.close();

    if (rowsAffected > 0) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Customer deleted successfully');");
        out.println("location='success.jsp';");
        out.println("</script>");
    } else {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('No customer found with the given account number and full name');");
        out.println("location='success.jsp';");
        out.println("</script>");
    }
%>