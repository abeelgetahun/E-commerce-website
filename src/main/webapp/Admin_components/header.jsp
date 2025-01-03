<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Admin_components/styles.css">
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>Admin Panel</h2>
        </div>
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/adminDashboard.jsp">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/Admin_components/addProduct.jsp">Add Product</a></li>
                <li><a href="${pageContext.request.contextPath}/Admin_components/manageCategories.jsp">Manage Categories</a></li>
                <!-- Future routing items -->
                <li><a href="#">Reports</a></li>
                <li><a href="#">Settings</a></li>
            </ul>
        </nav>
    </div>
    
    <!-- Main content -->
    

    <script src="${pageContext.request.contextPath}/Admin_components/scripts.js"></script>
</body>
</html>
