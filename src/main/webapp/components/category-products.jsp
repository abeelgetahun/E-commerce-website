<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.genuine.model.Product" %>
<%@ page import="com.genuine.dao.ProductDAO" %>

<%
    ProductDAO productDAO = new ProductDAO();
    String currentCategory = request.getParameter("category") != null ?
                           request.getParameter("category") : "mobile";
    List<Product> products = productDAO.getProductsByCategory(currentCategory);
%>

<div class="category-section">
    <div class="category-tabs">
        <button class="tab-button <%= "mobile".equals(currentCategory) ? "active" : "" %>"
                data-category="mobile">Mobile</button>
        <button class="tab-button <%= "pc".equals(currentCategory) ? "active" : "" %>"
                data-category="pc">PC</button>
        <button class="tab-button <%= "headset".equals(currentCategory) ? "active" : "" %>"
                data-category="headset">Headset</button>
        <button class="tab-button <%= "watch".equals(currentCategory) ? "active" : "" %>"
                data-category="watch">Watch</button>
        <button class="tab-button <%= "tv".equals(currentCategory) ? "active" : "" %>"
                data-category="tv">TV</button>
    </div>

    <div class="products-container">
        <% if (products != null && !products.isEmpty()) { %>
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
        <% } else { %>
            <div class="no-products">
                No products available in this category.
            </div>
        <% } %>
    </div>
</div>