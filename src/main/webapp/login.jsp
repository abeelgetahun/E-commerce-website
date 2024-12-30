<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        /* Styles for the login container */
        .login-container {
            width: 300px;
            margin: 100px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        /* Styling for form groups */
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        /* Styles for the login button */
        .button {
            background-color: #000000;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        .button:hover {
            background-color: #45a049;
        }
        /* Error message styles */
        .error {
            color: red;
            margin-bottom: 15px;
        }
        /* Styles for the signup link */
        .signup-link {
            text-align: center;
            margin-top: 15px;
        }
        .signup-link a {
            color: #4CAF50;
            text-decoration: none;
        }
        .signup-link a:hover {
            text-decoration: underline;
        }
        /* Styles for the admin login button */
        .admin-button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #2196F3;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 15px;
        }
        .admin-button:hover {
            background-color: #1976D2;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <% 
        // Check if an error attribute exists in the request scope 
        // and display it as an error message if present
        if(request.getAttribute("error") != null) { 
        %>
            <div class="error">${error}</div>
        <% } %>
        <!-- Login form submission -->
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
        <!-- Link to sign up page -->
        <div class="signup-link">
            Don't have an account?
            <a href="${pageContext.request.contextPath}/signup.jsp">Sign Up</a>
        </div>
        <!-- Admin login button -->
        <a href="${pageContext.request.contextPath}/adminLogin.jsp" class="admin-button">Admin Login</a>
    </div>
</body>
</html>
