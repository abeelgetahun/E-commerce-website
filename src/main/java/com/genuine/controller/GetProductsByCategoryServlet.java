package com.genuine.controller;

import com.genuine.dao.ProductDAO;
import com.genuine.model.Product;
import com.google.gson.Gson;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/GetProductsByCategory")
public class GetProductsByCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String category = request.getParameter("category");
        ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.getProductsByCategory(category);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        String jsonProducts = gson.toJson(products);

        response.getWriter().write(jsonProducts);
    }
}