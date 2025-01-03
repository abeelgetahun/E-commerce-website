<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="Admin_components/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* Container for the chart */
        .chart-container {
            width: 45%;
            height: 400px;
            margin: 0 auto;
            margin-bottom: 30px;
            display: inline-block;
            vertical-align: top;
        }

        .chart-wrapper {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .chart-container canvas {
            width: 100% !important;
            height: 100% !important;
        }

        /* Quick Stats section styling */
        .stats {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .stat-card {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 23%;
            text-align: center;
        }

        .stat-card h3 {
            margin-bottom: 10px;
            font-size: 1.2em;
        }

        .stat-card p {
            font-size: 1.5em;
            color: #333;
        }

        /* Footer Styling */
        footer {
            text-align: center;
            padding: 15px 0; /* Adjust padding to give some space inside */
            background-color: #f1f1f1;
            margin-top: 30px; /* Added margin to create space between content and footer */
            font-size: 0.9em;
            border-top: 1px solid #ddd; /* Optional: adds a subtle separator line */
        }
    </style>
</head>
<body>

    <!-- Main Content Area -->
    <div class="main-content">
        <!-- Header Section -->
        <div class="content-header">
            <h1>Welcome to the Admin Dashboard</h1>
            <p>Here, you can manage products, categories, view analytics, and more.</p>
        </div>

        <!-- Quick Stats -->
        <div class="stats">
            <div class="stat-card">
                <h3>Total Products</h3>
                <p>320</p>
            </div>
            <div class="stat-card">
                <h3>Total Categories</h3>
                <p>15</p>
            </div>
            <div class="stat-card">
                <h3>Total Users</h3>
                <p>1,230</p>
            </div>
            <div class="stat-card">
                <h3>Active Orders</h3>
                <p>75</p>
            </div>
        </div>

        <!-- Chart Section -->
        <div class="chart-wrapper">
            <!-- Sales Chart -->
            <div class="chart-container">
                <h3>Sales Analytics (2025)</h3>
                <canvas id="salesChart"></canvas>
            </div>

            <!-- Inventory Chart -->
            <div class="chart-container">
                <h3>Inventory Levels</h3>
                <canvas id="inventoryChart"></canvas>
            </div>
        </div>

        <div class="chart-wrapper">
            <!-- User Activity Chart -->
            <div class="chart-container">
                <h3>User Activity</h3>
                <canvas id="activityChart"></canvas>
            </div>

            <!-- Revenue Chart -->
            <div class="chart-container">
                <h3>Revenue (2025)</h3>
                <canvas id="revenueChart"></canvas>
            </div>
        </div>
		

    </div>

   

    <!-- Chart.js Script -->
    <script>
        // Sales Chart (Line Chart)
        var salesCtx = document.getElementById('salesChart').getContext('2d');
        var salesChart = new Chart(salesCtx, {
            type: 'line',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                datasets: [{
                    label: 'Sales in 2025 (in USD)',
                    data: [12, 19, 3, 5, 2, 3, 20],
                    borderColor: '#0066cc',
                    backgroundColor: 'rgba(0, 102, 204, 0.2)',
                    fill: true,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Inventory Chart (Bar Chart)
        var inventoryCtx = document.getElementById('inventoryChart').getContext('2d');
        var inventoryChart = new Chart(inventoryCtx, {
            type: 'bar',
            data: {
                labels: ['Product A', 'Product B', 'Product C', 'Product D', 'Product E'],
                datasets: [{
                    label: 'Inventory Levels',
                    data: [20, 15, 30, 10, 25],
                    backgroundColor: '#ff5733',
                    borderColor: '#ff5733',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // User Activity Chart (Pie Chart)
        var activityCtx = document.getElementById('activityChart').getContext('2d');
        var activityChart = new Chart(activityCtx, {
            type: 'pie',
            data: {
                labels: ['Active Users', 'Inactive Users'],
                datasets: [{
                    label: 'User Activity',
                    data: [70, 30],
                    backgroundColor: ['#28a745', '#dc3545'],
                    borderColor: '#ffffff',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'top'
                    }
                }
            }
        });

        // Revenue Chart (Doughnut Chart)
        var revenueCtx = document.getElementById('revenueChart').getContext('2d');
        var revenueChart = new Chart(revenueCtx, {
            type: 'doughnut',
            data: {
                labels: ['Online Sales', 'In-Store Sales', 'Affiliate Sales'],
                datasets: [{
                    label: 'Revenue Distribution',
                    data: [60, 25, 15],
                    backgroundColor: ['#ffc107', '#28a745', '#0066cc'],
                    borderColor: '#ffffff',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'top'
                    }
                }
            }
        });
    </script>

</body>
</html>
