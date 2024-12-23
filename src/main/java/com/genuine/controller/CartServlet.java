package com.genuine.controller;

import com.genuine.dao.ProductDAO;
import com.genuine.model.CartItem;
import com.genuine.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

        if (cartItems == null) {
            cartItems = new ArrayList<>();
        }

        String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        if ("add".equals(action)) {
            Product product = productDAO.getProductById(productId);
            boolean found = false;
            for (CartItem item : cartItems) {
                if (item.getProduct().getProductId() == productId) {
                    item.setQuantity(item.getQuantity() + quantity);
                    found = true;
                    break;
                }
            }
            if (!found) {
                cartItems.add(new CartItem(product, quantity));
            }
        } else if ("remove".equals(action)) {
            cartItems.removeIf(item -> item.getProduct().getProductId() == productId);
        } else if ("update".equals(action)) {
            for (CartItem item : cartItems) {
                if (item.getProduct().getProductId() == productId) {
                    item.setQuantity(quantity);
                    break;
                }
            }
        }

        session.setAttribute("cartItems", cartItems);
        session.setAttribute("cartTotal", calculateCartTotal(cartItems));
        response.sendRedirect("cart.jsp");
    }

    private double calculateCartTotal(List<CartItem> cartItems) {
        double total = 0;
        for (CartItem item : cartItems) {
            total += item.getTotalPrice();
        }
        return total;
    }
}