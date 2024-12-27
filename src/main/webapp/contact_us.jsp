<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="components/styles/contact_us.css">
</head>
<body>
    <div class="contact-us">
        <h2>Contact Us</h2>
        <form id="contactForm" onsubmit="showComingSoonPopup(event)">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email Address:</label>
            <input type="email" id="email" name="email" required>

            <label for="message">Message:</label>
            <textarea id="message" name="message" required></textarea>

            <button type="submit" class="submit-btn">Submit</button>
        </form>
    </div>

    <!-- Popup Modal -->
    <div class="popup" id="popup">
        <div class="popup-content">
            <h2>Coming Soon!</h2>
            <p>This feature is under development. Stay tuned!</p>
            <button onclick="closePopup()">Close</button>
        </div>
    </div>

    <script>
        // Show the popup when the submit button is clicked
        function showComingSoonPopup(event) {
            event.preventDefault();  // Prevent form submission
            document.getElementById("popup").style.display = "flex";
        }

        // Close the popup when the close button is clicked
        function closePopup() {
            document.getElementById("popup").style.display = "none";
        }
    </script>
</body>
</html>
