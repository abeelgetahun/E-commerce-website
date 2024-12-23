document.addEventListener('DOMContentLoaded', function() {
    const tabButtons = document.querySelectorAll('.tab-button');

    tabButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Remove active class from all buttons
            tabButtons.forEach(btn => btn.classList.remove('active'));

            // Add active class to clicked button
            this.classList.add('active');

            // Load products for the selected category
            loadCategoryProducts(this.dataset.category);
        });
    });
});

function loadCategoryProducts(category) {
    fetch(`GetProductsByCategory?category=${category}`)
        .then(response => response.text())
        .then(html => {
            document.querySelector('.products-container').innerHTML = html;
        })
        .catch(error => {
            console.error('Error loading products:', error);
            document.querySelector('.products-container').innerHTML =
                '<div class="no-products">Error loading products. Please try again later.</div>';
        });
}

function addToCart(productId, quantity) {
    fetch('AddToCart', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `productId=${productId}&quantity=${quantity}`
    })
    .then(response => response.json())
    .then(data => {
        if(data.success) {
            showNotification('Product added to cart successfully!');
            updateCartCount();
        } else {
            showNotification('Failed to add product to cart.', 'error');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        showNotification('Error adding product to cart.', 'error');
    });
}

function showNotification(message, type = 'success') {
    const notification = document.createElement('div');
    notification.className = `notification ${type}`;
    notification.textContent = message;

    document.body.appendChild(notification);

    setTimeout(() => {
        notification.classList.add('show');
    }, 100);

    setTimeout(() => {
        notification.classList.remove('show');
        setTimeout(() => {
            notification.remove();
        }, 300);
    }, 3000);
}

function updateCartCount() {
    fetch('GetCartCount')
        .then(response => response.json())
        .then(data => {
            const cartCount = document.querySelector('.cart-count');
            if(cartCount) {
                cartCount.textContent = data.count;
                if(data.count > 0) {
                    cartCount.style.display = 'block';
                } else {
                    cartCount.style.display = 'none';
                }
            }
        })
        .catch(error => console.error('Error updating cart count:', error));
}