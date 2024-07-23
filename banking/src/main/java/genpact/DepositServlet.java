package genpact;

import java.io.IOException;
import java.math.BigDecimal;
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

@WebServlet("/deposit")
public class DepositServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/bank1";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Mav#123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("deposit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accountNumber = (String) session.getAttribute("accountNumber");
        BigDecimal depositAmount = new BigDecimal(request.getParameter("amount"));

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                BigDecimal currentBalance = getCurrentBalance(conn, accountNumber);
                BigDecimal newBalance = currentBalance.add(depositAmount);
                updateBalance(conn, accountNumber, newBalance);

                // Log the transaction
                logTransaction(conn, accountNumber, depositAmount);

                session.setAttribute("accountBalance", newBalance); // Update session with new balance
                response.sendRedirect("customerDashboard.jsp");
            }
        } catch (ClassNotFoundException e) {
            throw new ServletException("JDBC Driver not found", e);
        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }

    private BigDecimal getCurrentBalance(Connection conn, String accountNumber) throws SQLException {
        String query = "SELECT accountBalance FROM customerLogin WHERE accountNumber = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, accountNumber);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getBigDecimal("accountBalance");
                } else {
                    throw new SQLException("Account not found: " + accountNumber);
                }
            }
        }
    }

    private void updateBalance(Connection conn, String accountNumber, BigDecimal newBalance) throws SQLException {
        String query = "UPDATE customerLogin SET accountBalance = ? WHERE accountNumber = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setBigDecimal(1, newBalance);
            stmt.setString(2, accountNumber);
            stmt.executeUpdate();
        }
    }

    private void logTransaction(Connection conn, String accountNumber, BigDecimal amount) throws SQLException {
        String insertTransactionSql = "INSERT INTO transactions (accountNumber, type, amount) VALUES (?, 'deposit', ?)";
        try (PreparedStatement transactionStmt = conn.prepareStatement(insertTransactionSql)) {
            transactionStmt.setString(1, accountNumber);
            transactionStmt.setBigDecimal(2, amount);
            transactionStmt.executeUpdate();
        }
    }
}