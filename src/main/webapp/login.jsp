<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <!-- Add Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&family=Montserrat:wght@700&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        .login-container {
            width: 500px;
            margin: 80px auto;
            padding: 40px 50px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #000000;
            text-align: center;
            margin-bottom: 35px;
            font-family: 'Montserrat', sans-serif;
            font-size: 32px;
            letter-spacing: 0.5px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            color: #000000;
            font-weight: 500;
            font-size: 15px;
            letter-spacing: 0.3px;
        }

        .form-group input {
            width: 100%;
            padding: 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            box-sizing: border-box;
            transition: all 0.3s ease;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
        }

        .form-group input:focus {
            border-color: #2ecc71;
            outline: none;
            box-shadow: 0 0 0 3px rgba(46, 204, 113, 0.1);
        }

        .button {
            background-color: #2ecc71;
            color: white;
            padding: 15px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .button:hover {
            background-color: #27ae60;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(46, 204, 113, 0.2);
        }

        .error {
            color: #e74c3c;
            margin-bottom: 25px;
            text-align: center;
            font-size: 14px;
            font-weight: 500;
            padding: 10px;
            background-color: rgba(231, 76, 60, 0.1);
            border-radius: 6px;
        }

        .signup-link {
            text-align: center;
            margin-top: 25px;
            color: #000000;
            font-size: 15px;
        }

        .signup-link a {
            color: #2ecc71;
            text-decoration: none;
            font-weight: 600;
            margin-left: 5px;
            transition: all 0.3s ease;
        }

        .signup-link a:hover {
            color: #27ae60;
            text-decoration: underline;
        }

        .admin-button {
            display: block;
            width: 100%;
            padding: 15px;
            background-color: #000000;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            margin-top: 25px;
            font-weight: 600;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 14px;
        }

        .admin-button:hover {
            background-color: #333333;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        /* Add responsive design */
        @media (max-width: 600px) {
            .login-container {
                width: 90%;
                margin: 40px auto;
                padding: 30px 20px;
            }

            h2 {
                font-size: 28px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Welcome Back</h2>
        <%
        if(request.getAttribute("error") != null) {
        %>
            <div class="error">${error}</div>
        <% } %>
        <form action="/E_commerce/login" method="post">
            <div class="form-group">
                <label>Username or Email</label>
                <input type="text" name="loginId" required placeholder="Enter your username or email">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required placeholder="Enter your password">
            </div>
            <div class="form-group">
                <button type="submit" class="button">Log In</button>
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