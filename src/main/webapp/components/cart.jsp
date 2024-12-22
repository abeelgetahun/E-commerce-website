<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="cart-box" class="cart-box">
    <h2>Shopping Cart</h2>
    <div class="cart-items">
        <c:forEach items="${sessionScope.cartItems}" var="item">
            <div class="cart-item">
                <img src="${item.product.imagePath}" alt="${item.product.name}" class="cart-item-image">
                <div class="cart-item-details">
                    <div class="cart-item-name">${item.product.name}</div>
                    <div class="cart-item-price">$${item.product.price}</div>
                    <div class="cart-item-quantity">
                        Qty: <input type="number" value="${item.quantity}" min="1" max="10" onchange="updateCartItem(${item.product.productId}, this.value)">
                    </div>
                </div>
                <button class="remove-cart-item-btn" onclick="removeFromCart(${item.product.productId})">Remove</button>
            </div>
        </c:forEach>
    </div>
    <div class="cart-total">
        Total: $<span id="cart-total">${sessionScope.cartTotal}</span>
    </div>
</div>
<button id="cart-toggle-btn" onclick="toggleCart()">Cart</button>