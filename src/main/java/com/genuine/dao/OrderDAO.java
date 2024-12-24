package com.genuine.dao;


import com.genuine.model.Order;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    public boolean createOrder(Order order) {
        String sql = "INSERT INTO orders (user_id, product_id, quantity, total_amount) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, order.getUserId());
            pstmt.setInt(2, order.getProductId());
            pstmt.setInt(3, order.getQuantity());
            pstmt.setDouble(4, order.getTotalAmount());

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean checkAndUpdateBalance(int userId, double totalAmount) {
        String checkBalanceSql = "SELECT balance FROM users WHERE user_id = ?";
        String updateBalanceSql = "UPDATE users SET balance = balance - ? WHERE user_id = ? AND balance >= ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkBalanceSql);
             PreparedStatement updateStmt = conn.prepareStatement(updateBalanceSql)) {

            // Check balance
            checkStmt.setInt(1, userId);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                double currentBalance = rs.getDouble("balance");
                if (currentBalance >= totalAmount) {
                    // Update balance
                    updateStmt.setDouble(1, totalAmount);
                    updateStmt.setInt(2, userId);
                    updateStmt.setDouble(3, totalAmount);

                    int affectedRows = updateStmt.executeUpdate();
                    return affectedRows > 0;
                }
            }
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}