package com.genuine.controller;

import com.genuine.dao.OrderDAO;
import com.genuine.model.CartItem;
import com.genuine.model.Order;
import com.genuine.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import com.google.gson.JsonObject;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private final OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

        double totalAmount = cartItems.stream()
                .mapToDouble(CartItem::getTotalPrice)
                .sum();

        // Check and update user balance
        if (orderDAO.checkAndUpdateBalance(user.getId(), totalAmount)) {
            // Create orders for each cart item
            boolean allOrdersSuccessful = true;
            for (CartItem item : cartItems) {
                Order order = new Order();
                order.setUserId(user.getId());
                order.setProductId(item.getProduct().getProductId());
                order.setQuantity(item.getQuantity());
                order.setTotalAmount(item.getTotalPrice());

                if (!orderDAO.createOrder(order)) {
                    allOrdersSuccessful = false;
                    break;
                }
            }

            if (allOrdersSuccessful) {
                // Clear the cart
                session.removeAttribute("cartItems");
                jsonResponse.addProperty("success", true);
                jsonResponse.addProperty("message", "Order placed successfully");
            } else {
                jsonResponse.addProperty("success", false);
                jsonResponse.addProperty("message", "Error creating orders");
            }
        } else {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Insufficient balance");
        }

        response.getWriter().write(jsonResponse.toString());
    }
}