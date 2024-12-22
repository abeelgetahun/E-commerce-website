// Tracks the cart state
let isCartOpen = false;

// Toggles the cart visibility
function toggleCart() {
    const cartBox = document.querySelector('.cart-box');
    isCartOpen = !isCartOpen;
    cartBox.classList.toggle('active', isCartOpen);
}

// Updates the cart list dynamically
function updateCart(items) {
    const cartItemsList = document.querySelector('.cart-items-list');
    const cartTotal = document.getElementById('cart-total');
    let totalCost = 0;

    // Clear current items
    cartItemsList.innerHTML = '';

    // Add items to the cart
    items.forEach(item => {
        totalCost += item.price * item.quantity;

        const cartItem = document.createElement('li');
        cartItem.classList.add('cart-item');
        cartItem.innerHTML = `
            <img src="${item.image}" alt="${item.name}">
            <div class="cart-item-details">
                <div class="cart-item-name">${item.name}</div>
                <div class="cart-item-price">$${(item.price * item.quantity).toFixed(2)} (${item.quantity})</div>
            </div>
        `;
        cartItemsList.appendChild(cartItem);
    });

    // Update the total cost
    cartTotal.textContent = `$${totalCost.toFixed(2)}`;
}

// Mock function to fetch cart data (replace this with a real backend call)
function fetchCartData() {
    return [
        { image: 'img/mobile.jpg', name: 'Mobile Phone', price: 299.99, quantity: 1 },
        { image: 'img/watch.jpg', name: 'Smart Watch', price: 99.99, quantity: 2 },
    ];
}

// Example: Initialize cart with mock data
document.addEventListener('DOMContentLoaded', () => {
    const mockCartItems = fetchCartData();
    updateCart(mockCartItems);
});
