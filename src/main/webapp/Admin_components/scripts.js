// Toggle Sidebar Visibility on Mobile
const sidebar = document.querySelector('.sidebar');
const toggleSidebarButton = document.querySelector('.toggle-sidebar');

toggleSidebarButton.addEventListener('click', () => {
    sidebar.classList.toggle('show');
});
