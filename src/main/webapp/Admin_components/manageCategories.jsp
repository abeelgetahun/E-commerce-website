<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Categories</title>
</head>
<body>
<div class="main-content">
        <div class="content-header">
             <h2>Manage Categories</h2>
        </div>
        <div class="dashboard-container">
       
        <form id="addCategoryForm" action="${pageContext.request.contextPath}/Admin_components/addCategory" method="post">
            <label for="categoryName">New Category Name:</label>
            <input type="text" id="categoryName" name="categoryName" required>
            <button type="submit">Add Category</button>
        </form>
        <h3>Existing Categories</h3>
        <ul id="categoryList">
            <!-- Categories dynamically loaded -->
        </ul>
    </div>
       
       
    </div>
    
    <script src="${pageContext.request.contextPath}/Admin_components/manageCategories.js"></script>
</body>
</html>
