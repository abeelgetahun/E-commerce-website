document.getElementById("addCategoryForm").addEventListener("submit", function (e) {
    e.preventDefault();

    const categoryName = document.getElementById("categoryName").value;
    if (!categoryName) {
        alert("Category name cannot be empty!");
        return;
    }

    // Mock: Simulate adding category to the server
    const categoryList = document.getElementById("categoryList");
    const newCategory = document.createElement("li");
    newCategory.textContent = categoryName;
    categoryList.appendChild(newCategory);

    // Clear the input field
    document.getElementById("categoryName").value = "";
});
