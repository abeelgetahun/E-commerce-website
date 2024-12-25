<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* Base styles from new template */
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        :root{
            --white: #fff;
            --black: #000;
            --lightBlue: #17a;
        }

        body{
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f4f4f4;
        }

        .wrapper{
            position: relative;
            width: 750px;
            height: 450px;
            background: var(--white);
            border: 2px solid var(--black);
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .wrapper .form-box{
            position: absolute;
            top: 0;
            width: 50%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .wrapper .form-box.login{
            left: 0;
            padding: 0 60px 0 40px;
        }

        .form-box h2{
            font-size: 32px;
            color: var(--black);
            text-align: center;
            margin-bottom: 30px;
        }

        .form-box .input-box{
            position: relative;
            width: 100%;
            height: 50px;
            margin: 25px 0;
        }

        .input-box input{
            width: 100%;
            height: 100%;
            background: transparent;
            border: none;
            outline: none;
            border-bottom: 2px solid var(--black);
            padding-right: 23px;
            font-size: 16px;
            color: var(--black);
            font-weight: 500;
            transition: .5s;
        }

        .input-box label{
            position: absolute;
            top: 50%;
            left: 0;
            transform: translateY(-50%);
            font-size: 16px;
            color: var(--black);
            pointer-events: none;
            transition: .5s;
        }

        .input-box input:focus~label,
        .input-box input:valid~label{
            top: -5px;
            color: var(--lightBlue);
        }

        .input-box input:focus,
        .input-box input:valid{
            border-bottom-color: var(--lightBlue);
        }

        .button{
            width: 100%;
            height: 45px;
            background: var(--black);
            border: none;
            outline: none;
            border-radius: 40px;
            cursor: pointer;
            font-size: 16px;
            color: var(--white);
            font-weight: 600;
            transition: .3s;
        }

        .button:hover{
            box-shadow: 0 0 10px rgba(0,0,0,0.8);
            background-color: #45a049;
        }

        .signup-link{
            font-size: 14px;
            text-align: center;
            margin: 20px 0;
        }

        .signup-link a{
            color: var(--lightBlue);
            text-decoration: none;
            font-weight: 600;
        }

        .signup-link a:hover{
            text-decoration: underline;
        }

        .rotate-bg{
            position: absolute;
            top: -4px;
            right: 0;
            width: 850px;
            height: 600px;
            background: var(--black);
            transform: rotate(10deg) skewY(40deg);
            transform-origin: bottom right;
        }

        .info-text{
            position: absolute;
            right: 0;
            width: 50%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 40px 60px 150px;
            color: var(--white);
            text-align: right;
        }

        .error {
            background: #ffe6e6;
            color: #ff0000;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 20px;
            text-align: center;
        }

        .admin-button {
            width: 100%;
            height: 45px;
            background: #2196F3;
            border: none;
            outline: none;
            border-radius: 40px;
            cursor: pointer;
            font-size: 16px;
            color: var(--white);
            font-weight: 600;
            transition: .3s;
            margin-top: 15px;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .admin-button:hover {
            background-color: #1976D2;
            box-shadow: 0 0 10px rgba(0,0,0,0.8);
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="form-box login">
            <h2>Login</h2>
            <% if(request.getAttribute("error") != null) { %>
                <div class="error">${error}</div>
            <% } %>
            <form action="/E_commerce/login" method="post">
                <div class="input-box">
                    <input type="text" name="loginId" required>
                    <label>Username or Email</label>
                </div>
                <div class="input-box">
                    <input type="password" name="password" required>
                    <label>Password</label>
                </div>
                <button type="submit" class="button">Login</button>
                <div class="signup-link">
                    Don't have an account?
                    <a href="${pageContext.request.contextPath}/signup.jsp">Sign Up</a>
                </div>
                <a href="${pageContext.request.contextPath}/adminLogin.jsp" class="admin-button">Admin Login</a>
            </form>
        </div>
        <div class="info-text login">
            <h2>Welcome Back!</h2>
            <p>Login to access your account and continue your shopping experience.</p>
        </div>
        <div class="rotate-bg"></div>
    </div>
</body>
</html>