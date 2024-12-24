package com.genuine.controller;

import com.genuine.dao.DBConnection;
import com.genuine.model.User;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
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

@WebServlet("/GetOrders")
public class GetOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        JsonObject jsonResponse = new JsonObject();
        JsonArray orders = new JsonArray();

        if (user != null) {
            String sql = "SELECT o.*, p.name as product_name, p.company, p.image_path " +
                    "FROM orders o " +
                    "JOIN products p ON o.product_id = p.product_id " +
                    "WHERE o.user_id = ? " +
                    "ORDER BY o.order_date DESC";

            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

                pstmt.setInt(1, user.getId());
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    JsonObject order = new JsonObject();
                    order.addProperty("orderId", rs.getInt("order_id"));
                    order.addProperty("productName", rs.getString("product_name"));
                    order.addProperty("company", rs.getString("company"));
                    order.addProperty("quantity", rs.getInt("quantity"));
                    order.addProperty("orderDate", rs.getTimestamp("order_date").toString());
                    order.addProperty("totalAmount", rs.getDouble("total_amount"));
                    order.addProperty("imagePath", rs.getString("image_path"));

                    orders.add(order);
                }

            } catch (SQLException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                jsonResponse.addProperty("error", "Database error occurred");
                sendResponse(response, jsonResponse);
                return;
            }
        }

        jsonResponse.add("orders", orders);
        sendResponse(response, jsonResponse);
    }

    private void sendResponse(HttpServletResponse response, JsonObject jsonResponse) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }
}