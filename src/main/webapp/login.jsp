<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        .login-container {
            width: 300px;
            margin: 100px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #000000;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #000000;
            font-weight: 600;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus {
            border-color: #2ecc71;
            outline: none;
        }

        .button {
            background-color: #2ecc71;
            color: white;
            padding: 12px 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #27ae60;
        }

        .error {
            color: #e74c3c;
            margin-bottom: 20px;
            text-align: center;
            font-size: 14px;
        }

        .signup-link {
            text-align: center;
            margin-top: 20px;
            color: #000000;
        }

        .signup-link a {
            color: #2ecc71;
            text-decoration: none;
            font-weight: 600;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }

        .admin-button {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #000000;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 6px;
            margin-top: 20px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .admin-button:hover {
            background-color: #333333;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <%
        if(request.getAttribute("error") != null) {
        %>
            <div class="error">${error}</div>
        <% } %>
        <form action="/E_commerce/login" method="post">
            <div class="form-group">
                <label>Username or Email</label>
                <input type="text" name="loginId" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required>
            </div>
            <div class="form-group">
                <button type="submit" class="button">Login</button>
            </div>
        </form>
        <div class="signup-link">
            Don't have an account?
            <a href="${pageContext.request.contextPath}/signup.jsp">Sign Up</a>
        </div>
        <a href="${pageContext.request.contextPath}/adminLogin.jsp" class="admin-button">Admin Login</a>
    </div>
</body>
</html>