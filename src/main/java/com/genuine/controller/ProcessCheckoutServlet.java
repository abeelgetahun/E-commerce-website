package com.genuine.controller;

import com.genuine.dao.ProductDAO;
import com.genuine.model.Product;
import com.genuine.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;
import com.google.gson.JsonObject;

@WebServlet("/processCheckout")
public class ProcessCheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        ProductDAO productDAO = new ProductDAO();

        JsonObject jsonResponse = new JsonObject();

        if (user == null || cart == null || cart.isEmpty()) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Invalid session or empty cart");
            sendResponse(response, jsonResponse);
            return;
        }

        // Calculate total amount
        double totalAmount = 0;
        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
            Product product = productDAO.getProductById(entry.getKey());
            if (product != null) {
                totalAmount += product.getPrice() * entry.getValue();
            }
        }

        // Add shipping cost
        totalAmount += totalAmount > 0 ? 10.00 : 0.00;

        // Check if user has enough balance
        if (user.getBalance() < totalAmount) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Insufficient balance. Required: $" + String.format("%.2f", totalAmount));
            sendResponse(response, jsonResponse);
            return;
        }

        // Process the order
        try (Connection conn = com.genuine.dao.DBConnection.getConnection()) {
            conn.setAutoCommit(false);
            try {
                // Update user's balance
                String updateBalanceSQL = "UPDATE users SET balance = balance - ? WHERE id = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(updateBalanceSQL)) {
                    pstmt.setDouble(1, totalAmount);
                    pstmt.setInt(2, user.getId());
                    pstmt.executeUpdate();
                }

                // Insert orders
                String insertOrderSQL = "INSERT INTO orders (user_id, product_id, quantity, total_amount) VALUES (?, ?, ?, ?)";
                try (PreparedStatement pstmt = conn.prepareStatement(insertOrderSQL)) {
                    for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
                        Product product = productDAO.getProductById(entry.getKey());
                        if (product != null) {
                            pstmt.setInt(1, user.getId());
                            pstmt.setInt(2, entry.getKey());
                            pstmt.setInt(3, entry.getValue());
                            pstmt.setDouble(4, product.getPrice() * entry.getValue());
                            pstmt.executeUpdate();
                        }
                    }
                }

                // Clear the cart
                cart.clear();
                session.setAttribute("cart", cart);

                // Update user's balance in session
                user.setBalance(user.getBalance() - totalAmount);
                session.setAttribute("user", user);

                conn.commit();

                jsonResponse.addProperty("success", true);
                jsonResponse.addProperty("message", "Order placed successfully!");

            } catch (SQLException e) {
                conn.rollback();
                throw e;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Error processing order: " + e.getMessage());
        }

        sendResponse(response, jsonResponse);
    }

    private void sendResponse(HttpServletResponse response, JsonObject jsonResponse) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }
}