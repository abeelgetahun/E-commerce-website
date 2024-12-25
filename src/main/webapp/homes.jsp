<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>E-Commerce Homepage</title>
    <link rel="stylesheet" href="components/styles/home.css" />
  </head>
  <body>
    <header class="header">
      <div class="container">
        <h1 class="logo">ShopEasy</h1>
        <nav class="navbar">
          <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <li><a href="#products">Products</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </nav>
      </div>
    </header>
    <section class="hero">
      <div class="hero-text">
        <h2>Discover Amazing Products</h2>
        <p>Shop the latest trends and enjoy exclusive deals today!</p>
        <a href="#products" class="btn">Shop Now</a>
      </div>
    </section>

    <section id="products" class="products">
      <div class="container">
        <h2>Our Products</h2>
        <div class="product-grid">
          <div class="product-card">
            <img src="https://via.placeholder.com/150" alt="Product 1" />
            <h3>Product 1</h3>
            <p>$19.99</p>
          </div>
          <div class="product-card">
            <img src="https://via.placeholder.com/150" alt="Product 2" />
            <h3>Product 2</h3>
            <p>$29.99</p>
          </div>
          <div class="product-card">
            <img src="https://via.placeholder.com/150" alt="Product 3" />
            <h3>Product 3</h3>
            <p>$39.99</p>
          </div>
        </div>
      </div>
    </section>

    <footer class="footer">
      <div class="container">
        <p>&copy; 2024 ShopEasy. All Rights Reserved.</p>
      </div>
    </footer>
  </body>
</html>
