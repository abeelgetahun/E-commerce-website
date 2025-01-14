 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    <title>About Us - Genuine Electronics</title>
    <link rel="stylesheet" href="components/styles/navbar.css">
    <link rel="stylesheet" href="components/styles/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="styles.css">
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
  <jsp:include page="components/navbar.jsp" />
  
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
                        <a href="https://github.com/abeelgetahun" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="https://t.me/Yene_enat1" target="_blank"><i class="fab fa-telegram"></i></a>
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
                        <a href="https://github.com/biniam0" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="https://t.me/bini_yam0" target="_blank"><i class="fab fa-telegram"></i></a>
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
                        <a href="https://github.com/Lib1221" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="https://t.me/liben12" target="_blank"><i class="fab fa-telegram"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <!-- Abrham Kifle -->
            <div class="item" style="background-image: url(https://i.ibb.co/xyz/image3.jpg);">
               <div class="content">
                 <div class="name">Abrham Kifle</div>
                   <div class="bio">Front-End Developer passionate about creating interactive and engaging user interfaces. Assigned to the About Page.</div>
                      <div class="social-links">
                          <a href="https://www.linkedin.com/in/abreham-kifle" target="_blank"><i class="fab fa-linkedin"></i></a>
                          <a href="https://github.com/abrhot" target="_blank"><i class="fab fa-github"></i></a>
                          <a href="https://t.me/bakosawi" target="_blank"><i class="fab fa-telegram"></i></a>
                          <a href="https://instagram.com/abreham.kifle" target="_blank"><i class="fab fa-instagram"></i></a>
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
                        <a href="https://github.com/Meklit542" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-telegram"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Aklilu Desalegn -->
<div class="item" style="background-image: url(https://i.ibb.co/xyz/image1.jpg);">
    <div class="content">
        <div class="name">Aklilu Desalegn</div>
        <div class="bio">Front-End Developer specializing in responsive and user-friendly designs. Assigned to the Home Page.</div>
        <div class="social-links">
            <a href="https://www.linkedin.com/in/aklilu-desalegn" target="_blank"><i class="fab fa-linkedin"></i></a>
            <a href="https://github.com/ake0507" target="_blank"><i class="fab fa-github"></i></a>
            <a href="https://t.me/ake0507" target="_blank"><i class="fab fa-telegram"></i></a>
            <a href="https://instagram.com/aklilu.desalegn" target="_blank"><i class="fab fa-instagram"></i></a>
        </div>
    </div>
</div>

<!-- Yasin Shalo -->
<div class="item" style="background-image: url(https://i.ibb.co/xyz/image2.jpg);">
    <div class="content">
        <div class="name">Yasin Shalo</div>
        <div class="bio">Front-End Developer with a focus on maintaining design consistency and functionality. Contributing to general front-end development.</div>
        <div class="social-links">
            <a href="https://www.linkedin.com/in/yasin-shalo" target="_blank"><i class="fab fa-linkedin"></i></a>
            <a href="https://github.com/Yasin5949" target="_blank"><i class="fab fa-github"></i></a>
            <a href="https://t.me/Y_5949" target="_blank"><i class="fab fa-telegram"></i></a>
            <a href="https://instagram.com/yasin.shalo" target="_blank"><i class="fab fa-instagram"></i></a>
        </div>
    </div>
</div>


        <!-- Navigation Buttons -->
        <div class="button">
            <button class="prev"><i class="fa-solid fa-arrow-left"></i></button>
            <button class="next"><i class="fa-solid fa-arrow-right"></i></button>
        </div>
    </div>
  <footer>
        <jsp:include page="components/footer.jsp" />
  </footer>

    <script src="script.js"></script>
 
</body>
</html>
