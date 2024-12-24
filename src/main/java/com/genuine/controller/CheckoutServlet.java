package com.genuine.controller;

import com.genuine.dao.DBConnection;
import com.genuine.model.CartItem;
import com.genuine.model.User;
import com.google.gson.JsonObject;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/processCheckout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

        JsonObject jsonResponse = new JsonObject();
        response.setContentType("application/json");

        if (user == null || cartItems == null || cartItems.isEmpty()) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Invalid session or empty cart");
            response.getWriter().write(jsonResponse.toString());
            return;
        }

        // Calculate total amount
        double totalAmount = cartItems.stream()
                .mapToDouble(CartItem::getTotalPrice)
                .sum();

        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);  // Start transaction

            // Check user balance
            String balanceQuery = "SELECT balance FROM users WHERE user_id = ? FOR UPDATE";
            try (PreparedStatement pstmt = conn.prepareStatement(balanceQuery)) {
                pstmt.setInt(1, user.getId());
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    double currentBalance = rs.getDouble("balance");

                    if (currentBalance >= totalAmount) {
                        // Update user balance
                        String updateBalanceSQL = "UPDATE users SET balance = balance - ? WHERE user_id = ?";
                        try (PreparedStatement updateStmt = conn.prepareStatement(updateBalanceSQL)) {
                            updateStmt.setDouble(1, totalAmount);
                            updateStmt.setInt(2, user.getId());
                            updateStmt.executeUpdate();
                        }

                        // Create orders
                        String orderSQL = "INSERT INTO orders (user_id, product_id, quantity, total_amount) VALUES (?, ?, ?, ?)";
                        try (PreparedStatement orderStmt = conn.prepareStatement(orderSQL)) {
                            for (CartItem item : cartItems) {
                                orderStmt.setInt(1, user.getId());
                                orderStmt.setInt(2, item.getProduct().getProductId());
                                orderStmt.setInt(3, item.getQuantity());
                                orderStmt.setDouble(4, item.getTotalPrice());
                                orderStmt.executeUpdate();
                            }
                        }

                        conn.commit();
                        session.removeAttribute("cartItems");  // Clear cart

                        jsonResponse.addProperty("success", true);
                        jsonResponse.addProperty("message", "Order placed successfully!");
                    } else {
                        conn.rollback();
                        jsonResponse.addProperty("success", false);
                        jsonResponse.addProperty("message", "Insufficient balance!");
                    }
                }
            }
        } catch (SQLException e) {
            try {
                if (conn != null) conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Error processing order: " + e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.setAutoCommit(true);
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        response.getWriter().write(jsonResponse.toString());
    }
}