package com.genuine.controller;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/UpdateCartQuantity")
public class UpdateCartQuantityServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

        int productId = Integer.parseInt(request.getParameter("productId"));
        int change = Integer.parseInt(request.getParameter("change"));

        if (cart != null && cart.containsKey(productId)) {
            int currentQuantity = cart.get(productId);
            int newQuantity = currentQuantity + change;

            if (newQuantity > 0) {
                cart.put(productId, newQuantity);
            } else {
                cart.remove(productId);
            }
        }

        response.setContentType("application/json");
        response.getWriter().write("{\"success\": true}");
    }
}