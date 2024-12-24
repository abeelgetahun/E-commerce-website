package com.genuine.controller;

import com.genuine.dao.OrderDAO;
import com.genuine.model.Order;
import com.genuine.model.User;
import com.google.gson.Gson;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/GetOrders")
public class GetOrdersServlet extends HttpServlet {
    private OrderDAO orderDAO = new OrderDAO();
    private Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        User user = (User) request.getSession().getAttribute("user");
        Map<String, Object> jsonResponse = new HashMap<>();

        if (user != null) {
            List<Order> orders = orderDAO.getUserOrders(user.getId());
            jsonResponse.put("orders", orders);
        } else {
            jsonResponse.put("error", "User not logged in");
        }

        response.getWriter().write(gson.toJson(jsonResponse));
    }
}