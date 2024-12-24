document.addEventListener('DOMContentLoaded', function() {
    loadOrders();
});

function loadOrders() {
    fetch('GetOrders')
        .then(response => response.json())
        .then(data => {
            const ordersContent = document.getElementById('ordersContent');

            if (data.orders.length === 0) {
                ordersContent.innerHTML = `
                    <div class="no-orders">
                        <h2>No Orders Found</h2>
                        <p>You haven't placed any orders yet.</p>
                    </div>
                `;
                return;
            }

            // Group orders by order date
            const groupedOrders = {};
            data.orders.forEach(order => {
                const date = new Date(order.orderDate).toLocaleDateString();
                if (!groupedOrders[date]) {
                    groupedOrders[date] = {
                        items: [],
                        totalAmount: 0
                    };
                }
                groupedOrders[date].items.push(order);
                groupedOrders[date].totalAmount += order.totalAmount;
            });

            // Generate HTML for each order group
            ordersContent.innerHTML = Object.entries(groupedOrders).map(([date, orderGroup]) => `
                <div class="order-item">
                    <div class="order-header">
                        <div class="order-date">Order Date: ${date}</div>
                        <div class="order-total">Total: $${orderGroup.totalAmount.toFixed(2)}</div>
                    </div>
                    ${orderGroup.items.map(order => `
                        <div class="order-product">
                            <img src="${order.imagePath}" alt="${order.productName}" class="product-image">
                            <div class="product-details">
                                <div class="product-name">${order.productName}</div>
                                <div class="product-company">${order.company}</div>
                                <div class="product-quantity">Quantity: ${order.quantity}</div>
                                <div class="product-price">$${order.totalAmount.toFixed(2)}</div>
                            </div>
                        </div>
                    `).join('')}
                </div>
            `).join('');
        })
        .catch(error => {
            console.error('Error:', error);
            document.getElementById('ordersContent').innerHTML = `
                <div class="no-orders">
                    <h2>Error Loading Orders</h2>
                    <p>There was a problem loading your orders. Please try again later.</p>
                </div>
            `;
        });
}