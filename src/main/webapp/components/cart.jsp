<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="cart-container">
    <button class="cart-toggle-btn" onclick="toggleCart()">🛒 Cart</button>
    <div class="cart-box">
        <h2 class="cart-title">Your Cart</h2>
        <ul class="cart-items-list"></ul>
        <div class="cart-footer">
            <div class="total-cost">
                <span>Total:</span>
                <span id="cart-total">$0.00</span>
            </div>
            <button class="checkout-btn">Checkout</button>
        </div>
    </div>
</div>
