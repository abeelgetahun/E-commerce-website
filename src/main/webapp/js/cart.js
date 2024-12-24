document.addEventListener('DOMContentLoaded', function() {
    loadCart();
});

function loadCart() {
    fetch('GetCartItems')
        .then(response => response.json())
        .then(data => {
            const cartItems = document.getElementById('cartItems');
            if (data.items.length === 0) {
                cartItems.innerHTML = `
                    <div class="empty-cart">
                        <h2>Your cart is empty</h2>
                        <p>Browse our products and add some items to your cart!</p>
                    </div>
                `;
                updateSummary(0, 0);
                return;
            }

            cartItems.innerHTML = data.items.map(item => `
                <div class="cart-item" data-product-id="${item.productId}">
                    <img src="${item.imagePath}" alt="${item.name}" class="item-image">
                    <div class="item-details">
                        <div class="item-name">${item.name}</div>
                        <div class="item-company">${item.company}</div>
                        <div class="item-price">$${item.price.toFixed(2)}</div>
                    </div>
                    <div class="quantity-controls">
                        <button class="quantity-btn" onclick="updateQuantity(${item.productId}, -1)">-</button>
                        <span class="quantity-display">${item.quantity}</span>
                        <button class="quantity-btn" onclick="updateQuantity(${item.productId}, 1)">+</button>
                    </div>
                    <button class="remove-btn" onclick="removeFromCart(${item.productId})">
                        <i class="fas fa-trash"></i>
                    </button>
                </div>
            `).join('');

            updateSummary(data.subtotal, data.shipping);
        })
        .catch(error => console.error('Error:', error));
}

function updateQuantity(productId, change) {
    fetch('UpdateCartQuantity', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `productId=${productId}&change=${change}`
    })
    .then(response => response.json())
    .then(data => {
        if(data.success) {
            loadCart();
        } else {
            alert('Failed to update quantity');
        }
    })
    .catch(error => console.error('Error:', error));
}

function removeFromCart(productId) {
    if(!confirm('Are you sure you want to remove this item from your cart?')) {
        return;
    }

    fetch('RemoveFromCart', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `productId=${productId}`
    })
    .then(response => response.json())
    .then(data => {
        if(data.success) {
            loadCart();
        } else {
            alert('Failed to remove item from cart');
        }
    })
    .catch(error => console.error('Error:', error));
}

function updateSummary(subtotal, shipping) {
    document.getElementById('subtotal').textContent = `$${subtotal.toFixed(2)}`;
    document.getElementById('shipping').textContent = `$${shipping.toFixed(2)}`;
    document.getElementById('total').textContent = `$${(subtotal + shipping).toFixed(2)}`;
}

function proceedToCheckout() {
    fetch('checkout', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert(data.message);
        } else {
            alert(data.message);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred during checkout');
    });
}