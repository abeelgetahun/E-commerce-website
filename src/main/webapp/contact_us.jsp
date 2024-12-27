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
    <link rel="stylesheet" href="components/styles/footer.css">
</head>
<body>
    <jsp:include page="components/navbar.jsp" />

    <!-- Add contact us form -->

    <footer>
        <jsp:include page="components/footer.jsp" />
    </footer>

    <script src="js/cart.js"></script>
</body>
</html>