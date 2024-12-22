// Helper function to update cart items
function updateCartItems(items) {
    const cartItemsContainer = document.querySelector('.cart-items');
    cartItemsContainer.innerHTML = ''; // Clear existing items
    items.forEach(item => {
        const cartItem = document.createElement('div');
        cartItem.classList.add('cart-item');
        cartItem.dataset.productId = item.product.productId;
        cartItem.innerHTML = `
            <img src="${item.product.imagePath}" alt="${item.product.name}" class="cart-item-image">
            <div class="cart-item-details">
                <div class="cart-item-name">${item.product.name}</div>
                <div class="cart-item-price">$${item.product.price}</div>
                <div class="cart-item-quantity">
                    Qty: <input type="number" value="${item.quantity}" min="1" max="10" onchange="updateCartItem(${item.product.productId}, this.value)">
                </div>
            </div>
            <button class="remove-cart-item-btn" onclick="removeFromCart(${item.product.productId})">Remove</button>
        `;
        cartItemsContainer.appendChild(cartItem);
    });
    // Update cart total
    updateCartTotal(items.reduce((total, item) => total + item.product.price * item.quantity, 0));
}