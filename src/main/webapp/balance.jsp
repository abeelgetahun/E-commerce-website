<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.genuine.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
    <title>Balance - Genuine Electronics</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="components/styles/common.css">
    <link rel="stylesheet" href="components/styles/navbar.css">
    <style>
        .balance-container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
        }
        .balance-card {
            background: linear-gradient(45deg, #2196F3, #1976D2);
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        .instruction-card {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .notify-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .notify-btn:hover {
            background-color: #45a049;
        }
        .bank-details {
            background: #f5f5f5;
            padding: 15px;
            border-radius: 5px;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <jsp:include page="components/navbar.jsp" />

    <div class="balance-container">
        <div class="balance-card">
            <h2>Welcome, ${user.fullName}</h2>
            <h3>Available Balance: <fmt:formatNumber value="${user.balance}" type="number" minFractionDigits="2" maxFractionDigits="2" /></h3>


        </div>

        <div class="instruction-card">
            <h3>Add Money to Genuify Account</h3>
            <p>Follow these steps to add money to your account:</p>

            <div class="bank-details">
                <p><strong>Bank:</strong> CBE (Commercial Bank of Ethiopia)</p>
                <p><strong>Account Number:</strong> ************</p>
                <p><strong>Account Holder:</strong> [Owner Name]</p>
            </div>

            <ol>
                <li>Transfer the desired amount to the above account</li>
                <li>Take a screenshot of your transfer confirmation</li>
                <li>Upload the screenshot using the button below</li>
                <li>Click notify to inform us about your transfer</li>
            </ol>

            <input type="file" accept="image/*" style="margin: 20px 0;">
            <br>
            <button class="notify-btn" onclick="showNotification()">
                <i class="fas fa-bell"></i> Notify
            </button>
        </div>
    </div>

    <script>
        function showNotification() {
            alert("Notification feature coming soon!");
        }
    </script>
</body>
</html>