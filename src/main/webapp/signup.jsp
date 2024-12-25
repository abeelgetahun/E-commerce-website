<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
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
            height: 550px;
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

        .wrapper .form-box.register{
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
            margin: 15px 0;
        }

        .input-box input, .input-box select{
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
            margin-top: 20px;
        }

        .button:hover{
            box-shadow: 0 0 10px rgba(0,0,0,0.8);
            background-color: #45a049;
        }

        .login-link{
            font-size: 14px;
            text-align: center;
            margin: 20px 0;
        }

        .login-link a{
            color: var(--lightBlue);
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover{
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

        .input-status {
            font-size: 0.8em;
            margin-top: 2px;
            color: var(--lightBlue);
        }

        .phone-group {
            display: flex;
            gap: 10px;
        }

        .country-code {
            width: 80px !important;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="form-box register">
            <h2>Sign Up</h2>
            <% if (request.getAttribute("error") != null) { %>
                <div class="error">${error}</div>
            <% } %>
            <form id="signupForm" action="${pageContext.request.contextPath}/signup" method="post" onsubmit="return validateForm()">
                <div class="input-box">
                    <input type="text" name="fullName" id="fullName" required>
                    <label>Full Name</label>
                    <div class="input-status" id="fullNameStatus"></div>
                </div>

                <div class="input-box">
                    <input type="text" name="username" id="username" required>
                    <label>Username</label>
                    <div class="input-status" id="usernameStatus"></div>
                </div>

                <div class="input-box">
                    <input type="email" name="email" id="email" required>
                    <label>Email</label>
                    <div class="input-status" id="emailStatus"></div>
                </div>

                <div class="input-box">
                    <select name="country" id="country" required>
                        <option value="">Select Country</option>
                    </select>
                </div>

                <div class="input-box">
                    <div class="phone-group">
                        <input type="text" id="countryCode" name="countryCode" class="country-code" readonly>
                        <input type="tel" name="phoneNumber" id="phoneNumber" required>
                    </div>
                    <div class="input-status" id="phoneStatus"></div>
                </div>

                <div class="input-box">
                    <input type="password" name="password" id="password" required>
                    <label>Password</label>
                    <div class="input-status" id="passwordStatus"></div>
                </div>

                <div class="input-box">
                    <input type="password" name="confirmPassword" id="confirmPassword" required>
                    <label>Confirm Password</label>
                    <div class="input-status" id="confirmPasswordStatus"></div>
                </div>

                <button type="submit" class="button">Sign Up</button>

                <div class="login-link">
                    Already have an account?
                    <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
                </div>
            </form>
        </div>
        <div class="info-text">
            <h2>Welcome!</h2>
            <p>Create your account and start your shopping journey with us.</p>
        </div>
        <div class="rotate-bg"></div>
    </div>

    <!-- Include the JavaScript code -->
    <script>
        // Include your existing JavaScript code here
        // (The JavaScript code remains the same as in your original signup.jsp)
    </script>
</body>
</html>