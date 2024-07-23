package genpact;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/withdraw")
public class WithdrawServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String accountNumber = (String) session.getAttribute("accountNumber");
        if (accountNumber == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        double amount = Double.parseDouble(request.getParameter("amount"));

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank1", "root", "Mav#123")) {
                String selectQuery = "SELECT accountBalance FROM customerLogin WHERE accountNumber = ?";
                try (PreparedStatement selectStmt = conn.prepareStatement(selectQuery)) {
                    selectStmt.setString(1, accountNumber);
                    try (ResultSet rs = selectStmt.executeQuery()) {
                        if (rs.next()) {
                            double currentBalance = rs.getDouble("accountBalance");

                            if (currentBalance >= amount) {
                                double newBalance = currentBalance - amount;

                                String updateQuery = "UPDATE customerLogin SET accountBalance = ? WHERE accountNumber = ?";
                                try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                                    updateStmt.setDouble(1, newBalance);
                                    updateStmt.setString(2, accountNumber);
                                    updateStmt.executeUpdate();
                                }

                                // Insert transaction record
                                String insertTransactionSql = "INSERT INTO transactions (accountNumber, type, amount) VALUES (?, 'withdraw', ?)";
                                try (PreparedStatement transactionStmt = conn.prepareStatement(insertTransactionSql)) {
                                    transactionStmt.setString(1, accountNumber);
                                    transactionStmt.setDouble(2, amount);
                                    transactionStmt.executeUpdate();
                                }

                                session.setAttribute("accountBalance", newBalance);
                                response.sendRedirect("customerDashboard.jsp");
                            } else {
                                response.getWriter().println("Insufficient funds");
                            }
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }
}