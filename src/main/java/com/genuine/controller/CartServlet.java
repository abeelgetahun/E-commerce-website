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

@WebServlet("/cart")//to define and configure servlets and It simplifies the process of servlet declaration by eliminating the need for entries in the web.xml deployment descriptor
public class CartServlet extends HttpServlet {
    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            //We Throw Any Servlet Andd IO Exception Tha Can Occur
            throws ServletException, IOException {
        HttpSession session = request.getSession();//Create Session object to keep track of customers interaction
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");//adds the Product Purchased by the customer to the session
        //If The Session Is Empty We Assign It As a New Empty Arraylist
        if (cartItems == null) {
            cartItems = new ArrayList<>();
        }

        String action = request.getParameter("action");//Retrieves The Value Of The Action Parameter From The Request.
        int productId = Integer.parseInt(request.getParameter("productId"));//Retrieves the productId parameter from the request and converts it to an integer.
        int quantity = Integer.parseInt(request.getParameter("quantity"));//retrieves the quantity parameter from the request and converts it to an integer.

        if ("add".equals(action))//Checks if the action parameter is "add". {
            Product product = productDAO.getProductById(productId);//Retrieves the product with the specified productId from the database
            boolean found = false;//Initializes a flag to check if the product is already in the cart.
                for (CartItem item : cartItems)//Iterates over the items in the cart to see if the product is already there. {
                if (item.getProduct().getProductId() == productId)//Checks if the current item in the cart matches the productId. {
                    item.setQuantity(item.getQuantity() + quantity);//If the product is found, updates the quantity of the item in the cart.
                    found = true;//Sets the flag to true indicating the product was found.
                    break;//Exits the loop once the product is found.
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