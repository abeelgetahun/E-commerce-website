<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.genuine.model.User" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.genuine.model.Product" %>
<%@ page import="com.genuine.dao.ProductDAO" %>
<%@ page import="java.util.HashMap" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
    if(cart == null) {
        cart = new HashMap<>();
        session.setAttribute("cart", cart);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart - Genuine Electronics</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="components/styles/common.css">
    <link rel="stylesheet" href="components/styles/navbar.css">
    <link rel="stylesheet" href="components/styles/cart.css">
</head>
<body>
    <jsp:include page="components/navbar.jsp" />

    <div class="cart-container">
        <h1>Shopping Cart</h1>

        <div class="cart-content">
            <div class="cart-items" id="cartItems">
                <!-- Cart items will be loaded here dynamically -->
            </div>

            <div class="cart-summary">
                <h2>Order Summary</h2>
                <div class="summary-item">
                    <span>Subtotal:</span>
                    <span id="subtotal">$0.00</span>
                </div>
                <div class="summary-item">
                    <span>Shipping:</span>
                    <span id="shipping">$0.00</span>
                </div>
                <div class="summary-item total">
                    <span>Total:</span>
                    <span id="total">$0.00</span>
                </div>
                <button class="checkout-btn" onclick="proceedToCheckout()">
                    Proceed to Checkout
                </button>
            </div>
        </div>
    </div>

    <script src="js/cart.js"></script>
</body>
</html>