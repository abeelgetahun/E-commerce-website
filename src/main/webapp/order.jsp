<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.genuine.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Orders - Genuine Electronics</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="components/styles/common.css">
    <link rel="stylesheet" href="components/styles/navbar.css">
    <link rel="stylesheet" href="components/styles/orders.css">
    <link rel="stylesheet" href="components/styles/footer.css">
</head>
<body>
    <jsp:include page="components/navbar.jsp" />

    <div class="orders-container">
        <h1>My Orders</h1>
        <div class="orders-content" id="ordersContent">
            <!-- Orders will be loaded here dynamically -->
        </div>
    </div>

    <footer>
        <jsp:include page="components/footer.jsp" />
    </footer>

    <script src="js/orders.js"></script>
</body>
</html>