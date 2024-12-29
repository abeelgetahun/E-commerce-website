<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta tags for character encoding and responsive design -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- Page title -->
    <title>Team Members Slider</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     <!-- External stylesheet for additional styles -->
    <link rel="stylesheet" href="about.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .navbar {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            background-color: #333;
            padding: 10px 20px;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .navbar a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            padding: 8px 16px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
            margin-right: 10px;
        }

        .navbar a:hover {
            background-color: #575757;
        }

        .container {
            margin-top: 60px;
        }

        .slide {
            display: flex;
            overflow-x: auto;
            scroll-behavior: smooth;
        }

        .item {
            flex: 0 0 auto;
            width: 300px;
            height: 400px;
            margin: 10px;
            border-radius: 10px;
            position: relative;
            overflow: hidden;
            background-size: cover;
            background-position: center;
        }

        .content {
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            padding: 20px;
            position: absolute;
            bottom: 0;
            width: 100%;
            box-sizing: border-box;
        }

        .name {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .bio {
            font-size: 14px;
            margin-bottom: 15px;
        }

        .social-links a {
            color: white;
            font-size: 18px;
            margin-right: 10px;
            transition: color 0.3s ease;
        }

        .social-links a:hover {
            color: #00aced;
        }

        .button {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .button button {
            border: none;
            background-color: #333;
            color: white;
            font-size: 18px;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button button:hover {
            background-color: #575757;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <a href="#home">Home</a>
        <a href="#signup">Signup</a>
        <a href="#cart">Cart</a>
        <a href="#balance">Balance</a>
        <a href="#about">About</a>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="slide">
            <!-- Abel Getahun -->
            <div class="item" style="background-image: url(https://i.ibb.co/qCkd9jS/img1.jpg);">
                <div class="content">
                    <div class="name">Abel Getahun</div>
                    <div class="bio">Backend Developer passionate about building scalable and secure APIs.</div>
                    <div class="social-links">
                        <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-telegram"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <!-- Jaleta Kebede -->
            <div class="item" style="background-image: url(https://i.ibb.co/jrRb11q/img2.jpg);">
                <div class="content">
                    <div class="name">Jaleta Kebede</div>
                    <div class="bio">Frontend Developer skilled in crafting engaging user interfaces.</div>
                    <div class="social-links">
                        <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-telegram"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <!-- Liben Adunga -->
            <div class="item" style="background-image: url(https://i.ibb.co/NSwVv8D/img3.jpg);">
                <div class="content">
                    <div class="name">Liben Adunga</div>
                    <div class="bio">Database Engineer passionate about data integrity and optimization.</div>
                    <div class="social-links">
                        <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-telegram"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <!-- Meklit -->
            <div class="item" style="background-image: url(https://i.ibb.co/RNkk6L0/img6.jpg);">
                <div class="content">
                    <div class="name">Meklit</div>
                    <div class="bio">README Specialist ensuring clear and concise documentation.</div>
                    <div class="social-links">
                        <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-telegram"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>

  <!-- Navigation Buttons for Scrolling -->
        <div class="button">
            <button class="prev"><i class="fa-solid fa-arrow-left"></i></button>
            <button class="next"><i class="fa-solid fa-arrow-right"></i></button>
        </div>
    </div>

    <script src="about.js"></script>
</body>
</html>
