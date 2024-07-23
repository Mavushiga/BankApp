package genpact;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/viewTransactions")
public class ViewTransactionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String accountNumber = (String) session.getAttribute("accountNumber");
        if (accountNumber == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Transaction> transactions = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank1", "root", "Mav#123")) {
                String selectQuery = "SELECT * FROM transactions WHERE accountNumber = ? ORDER BY transaction_date DESC LIMIT 10";
                try (PreparedStatement selectStmt = conn.prepareStatement(selectQuery)) {
                    selectStmt.setString(1, accountNumber);
                    try (ResultSet rs = selectStmt.executeQuery()) {
                        while (rs.next()) {
                            Transaction transaction = new Transaction();
                            transaction.setId(rs.getInt("id"));
                            transaction.setAccountNumber(rs.getString("accountNumber"));
                            transaction.setType(rs.getString("type"));
                            transaction.setAmount(rs.getDouble("amount"));
                            transaction.setTransactionDate(rs.getTimestamp("transaction_date"));
                            transactions.add(transaction);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("Database access error", e);
        }

        request.setAttribute("transactions", transactions);
        request.getRequestDispatcher("viewTransactions.jsp").forward(request, response);
    }
}
