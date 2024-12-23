package com.genuine.controller;

import com.genuine.dao.ProductDAO;
import com.genuine.model.Product;
import com.google.gson.JsonObject;
import com.google.gson.JsonArray;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/GetCartItems")
public class GetCartItemsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        ProductDAO productDAO = new ProductDAO();

        JsonObject jsonResponse = new JsonObject();
        JsonArray items = new JsonArray();
        double subtotal = 0;

        if (cart != null) {
            for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
                Product product = productDAO.getProductById(entry.getKey());
                if (product != null) {
                    JsonObject item = new JsonObject();
                    item.addProperty("productId", product.getProductId());
                    item.addProperty("name", product.getName());
                    item.addProperty("company", product.getCompany());
                    item.addProperty("price", product.getPrice());
                    item.addProperty("imagePath", product.getImagePath());
                    item.addProperty("quantity", entry.getValue());

                    items.add(item);
                    subtotal += product.getPrice() * entry.getValue();
                }
            }
        }

        double shipping = subtotal > 0 ? 10.00 : 0.00; // Example shipping calculation

        jsonResponse.add("items", items);
        jsonResponse.addProperty("subtotal", subtotal);
        jsonResponse.addProperty("shipping", shipping);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }
}