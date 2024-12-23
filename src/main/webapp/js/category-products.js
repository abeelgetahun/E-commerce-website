document.addEventListener('DOMContentLoaded', function() {
    initializeScrollButtons();
    checkScrollButtons();
    window.addEventListener('resize', checkScrollButtons);
});

function initializeScrollButtons() {
    const containers = document.querySelectorAll('.products-container');

    containers.forEach(container => {
        const scrollContainer = container.parentElement;
        const leftButton = scrollContainer.querySelector('.scroll-button.left');
        const rightButton = scrollContainer.querySelector('.scroll-button.right');

        // Add scroll event listener to container
        container.addEventListener('scroll', () => {
            updateScrollButtons(container);
        });

        // Add click events to buttons
        leftButton.addEventListener('click', () => {
            scrollProducts(container, 'left');
        });

        rightButton.addEventListener('click', () => {
            scrollProducts(container, 'right');
        });

        // Initial check for scroll buttons
        updateScrollButtons(container);
    });
}

function scrollProducts(container, direction) {
    const scrollAmount = container.offsetWidth - 100;
    const scrollPosition = direction === 'left' ?
        container.scrollLeft - scrollAmount :
        container.scrollLeft + scrollAmount;

    container.scrollTo({
        left: scrollPosition,
        behavior: 'smooth'
    });
}

function updateScrollButtons(container) {
    const scrollContainer = container.parentElement;
    const leftButton = scrollContainer.querySelector('.scroll-button.left');
    const rightButton = scrollContainer.querySelector('.scroll-button.right');

    // Check if scrolling is possible
    const canScrollLeft = container.scrollLeft > 0;
    const canScrollRight = container.scrollLeft < (container.scrollWidth - container.offsetWidth);

    // Update button visibility
    leftButton.classList.toggle('hidden', !canScrollLeft);
    rightButton.classList.toggle('hidden', !canScrollRight);
}

function checkScrollButtons() {
    const containers = document.querySelectorAll('.products-container');
    containers.forEach(updateScrollButtons);
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
            showNotification('Product added to cart successfully!', 'success');
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





function showNotification(message, type = 'success') {
    // Create the notification element
    const notification = document.createElement('div');
    notification.className = `notification ${type}`;
    notification.innerHTML = `
        <div class="notification-content">
            <span class="message">${message}</span>
            <button class="close-btn">&times;</button>
        </div>
    `;

    // Add the notification to the body
    document.body.appendChild(notification);

    // Add animation class to show the notification
    setTimeout(() => {
        notification.classList.add('show');
    }, 100);

    // Close button event
    const closeButton = notification.querySelector('.close-btn');
    closeButton.addEventListener('click', () => {
        notification.classList.add('hide');
        setTimeout(() => notification.remove(), 300);
    });

    // Auto-hide after 4 seconds
    setTimeout(() => {
        notification.classList.add('hide');
        setTimeout(() => notification.remove(), 300);
    }, 4000);
}
