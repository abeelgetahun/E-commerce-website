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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Balance - Genuine Electronics</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="components/styles/common.css">
    <link rel="stylesheet" href="components/styles/navbar.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-green: #4CAF50;
            --hover-green: #45a049;
            --light-gray: #f5f5f5;
        }

        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #fff;
        }

        .balance-container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
        }

        .balance-card {
            color: white;
            padding: 30px;
            border-radius: 15px;
            margin-bottom: 30px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .balance-card:hover {
            transform: translateY(-5px);
        }

        .instruction-card {
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            font-family: 'Roboto', sans-serif;
        }

        .instruction-card h3 {
            font-size: 24px;
            color: var(--primary-green);
            margin-bottom: 15px;
        }

        .instruction-card p {
            font-size: 16px;
            line-height: 1.5;
        }

        .notify-btn {
            background-color: var(--primary-green);
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .notify-btn:hover {
            background-color: var(--hover-green);
            transform: scale(1.05);
        }

        .bank-details {
            background: var(--light-gray);
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            border-left: 5px solid var(--primary-green);
        }

        .file-input-wrapper {
            margin: 20px 0;
            position: relative;
        }

        .file-input {
            opacity: 0;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }

        .file-input-label {
            display: inline-block;
            padding: 10px 20px;
            background-color: var(--primary-green);
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .file-input-label:hover {
            background-color: var(--hover-green);
        }

        .steps-list {
            padding-left: 20px;
        }

        .steps-list li {
            margin-bottom: 10px;
        }

        @media (max-width: 600px) {
            .balance-container {
                padding: 10px;
            }
        }

        @keyframes gradientAnimation {
            0% {
                background: linear-gradient(135deg, #333, #000);
            }
            50% {
                background: linear-gradient(135deg, #555, #333);
            }
            100% {
                background: linear-gradient(135deg, #333, #000);
            }
        }

        .balance-card {
            animation: gradientAnimation 5s ease infinite;
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
            <h3>Quick Fund Your Genuify Account</h3>
            <p>Follow these simple steps to add money:</p>

            <div class="bank-details">
                <p><strong>Bank:</strong> CBE (Commercial Bank of Ethiopia)</p>
                <p><strong>Account:</strong> ************</p>
                <p><strong>Holder:</strong> [Owner Name]</p>
            </div>

            <ol class="steps-list">
                <li>Transfer funds to the account above</li>
                <li>Screenshot your transfer confirmation</li>
                <li>Upload the screenshot below</li>
                <li>Click 'Notify' to confirm your transfer</li>
            </ol>

            <div class="file-input-wrapper">
                <input type="file" id="fileInput" accept="image/*" class="file-input">
                <label for="fileInput" class="file-input-label">
                    <i class="fas fa-upload"></i> Upload Screenshot
                </label>
                <span id="fileName"></span>
            </div>

            <button class="notify-btn" onclick="showNotification()">
                <i class="fas fa-bell"></i> Notify
            </button>
        </div>
    </div>

    <script>
        document.getElementById('fileInput').addEventListener('change', function(e) {
            var fileName = e.target.files[0].name;
            document.getElementById('fileName').textContent = fileName;
        });

        function showNotification() {
            const fileInput = document.getElementById('fileInput');
            if (fileInput.files.length > 0) {
                alert("Thank you for your notification. We'll process your transfer soon!");
            } else {
                alert("Please upload a screenshot of your transfer before notifying.");
            }
        }
    </script>
</body>
</html>

