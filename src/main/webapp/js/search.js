document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('searchInput');
    const searchButton = document.getElementById('searchButton');
    const searchResults = document.getElementById('searchResults');

    let searchTimeout;

    function debounceSearch(func, wait) {
        clearTimeout(searchTimeout);
        searchTimeout = setTimeout(func, wait);
    }

    async function performSearch() {
        const query = searchInput.value.trim();

        if (query.length < 2) {
            searchResults.style.display = 'none';
            return;
        }

        searchResults.style.display = 'block';
        searchResults.innerHTML = '<div class="search-loading">Searching...</div>';

        try {
            const response = await fetch(`search?query=${encodeURIComponent(query)}`);
            if (!response.ok) throw new Error('Search failed');

            const products = await response.json();
            displaySearchResults(products);
        } catch (error) {
            console.error('Search error:', error);
            searchResults.innerHTML = '<div class="no-results">An error occurred. Please try again.</div>';
        }
    }

    function displaySearchResults(products) {
        if (products.length === 0) {
            searchResults.innerHTML = '<div class="no-results">No products found</div>';
            return;
        }

        searchResults.innerHTML = products.map(product => `
            <div class="search-result-item" onclick="window.location.href='product-details.jsp?id=${product.productId}'">
                <img src="${product.imagePath}" alt="${product.name}" class="search-result-image">
                <div class="search-result-info">
                    <div class="search-result-name">${product.name}</div>
                    <div class="search-result-company">${product.company}</div>
                    <div class="search-result-price">₹${product.price.toFixed(2)}</div>
                </div>
            </div>
        `).join('');
    }

    searchInput.addEventListener('input', () => {
        debounceSearch(performSearch, 300);
    });

    searchButton.addEventListener('click', performSearch);

    // Close search results when clicking outside
    document.addEventListener('click', (e) => {
        if (!searchResults.contains(e.target) &&
            !searchInput.contains(e.target) &&
            !searchButton.contains(e.target)) {
            searchResults.style.display = 'none';
        }
    });

    // Prevent search results from closing when clicking inside
    searchResults.addEventListener('click', (e) => {
        e.stopPropagation();
    });
});