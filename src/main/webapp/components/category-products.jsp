<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.genuine.model.Product" %>
<%@ page import="com.genuine.dao.ProductDAO" %>

<%
    ProductDAO productDAO = new ProductDAO();
    String[] categories = {"mobile", "pc", "watch", "headset", "tv"};
%>

<div class="category-section">
    <% for (String category : categories) {
        List<Product> products = productDAO.getProductsByCategory(category);
        if (products != null && !products.isEmpty()) {
    %>
        <div class="category-container">
            <h2 class="category-title"><%= category.substring(0, 1).toUpperCase() + category.substring(1) %></h2>
            <div class="products-scroll-container">
                <button class="scroll-button left" data-direction="left">
                    <i class="fas fa-chevron-left"></i>
                </button>
                <div class="products-container" data-category="<%= category %>">
                    <% for (Product product : products) { %>
                        <div class="product-card">
                            <img src="<%= product.getImagePath() %>" alt="<%= product.getName() %>" class="product-image">
                            <div class="product-details">
                                <div class="product-name"><%= product.getName() %></div>
                                <div class="product-company"><%= product.getCompany() %></div>
                                <div class="product-price">$<%= String.format("%.2f", product.getPrice()) %></div>
                                <div class="product-actions">
                                    <select class="quantity-selector" id="qty-<%= product.getProductId() %>">
                                        <% for(int i = 1; i <= 5; i++) { %>
                                            <option value="<%= i %>"><%= i %></option>
                                        <% } %>
                                    </select>
                                    <button class="add-to-cart-btn"
                                            onclick="addToCart(<%= product.getProductId() %>,
                                                     document.getElementById('qty-<%= product.getProductId() %>').value)">
                                        Add to Cart
                                    </button>
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
                <button class="scroll-button right" data-direction="right">
                    <i class="fas fa-chevron-right"></i>
                </button>
            </div>
        </div>
    <% }} %>
</div>