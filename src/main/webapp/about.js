
    const items = document.querySelectorAll('.item');
    let currentIndex = Math.floor(items.length / 2);
    function showItems() {
        items.forEach((item, index) => {
            item.classList.remove('active');
            item.classList.remove('blur');
            if (index === currentIndex) {
                item.classList.add('active');
            } else {
                item.classList.add('blur');
            }
        });
    }
    document.querySelector('.prev').addEventListener('click', () => {
        currentIndex = (currentIndex - 1 + items.length) % items.length;
        showItems();
    });
    document.querySelector('.next').addEventListener('click', () => {
        currentIndex = (currentIndex + 1) % items.length;
        showItems();
    });
    showItems();
