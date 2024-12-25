
# E-Commerce Website
An intuitive e-commerce platform that enables seamless item management and sales. Easily add products to the database and manage transactions to sell directly from the inventory. Simplify your business operations with streamlined database integration and efficient sales functionality.

## Features
- **Product Management**: Add, update, and delete products in the inventory.
- **User Authentication**: Secure login and registration for users.
- **Shopping Cart**: Add products to the cart and proceed to checkout.
- **Order Processing**: Manage and process customer orders efficiently.

## Technologies Used
- **Backend**: Java
- **Frontend**: HTML, CSS, JavaScript
- **Database**: MySQL
- **Build Tool**: Maven

## Prerequisites
- Java Development Kit (JDK) 8 or higher
- Apache Maven
- MySQL Server

## Installation
1. **Clone the repository**:
   ```sh
   git clone https://github.com/abeelgetahun/E-Commerce-website.git
   cd E-Commerce-website
   ```

2. **Set up the database**:
   - Create a MySQL database named `electronics_db`.
   - Execute the SQL scripts located in the `conf` directory to set up the necessary tables.
   - Configure database connection:
     - Open the `src/main/resources/db.properties` file.
     - Update the database connection parameters (URL, username, password) as per your MySQL setup.

3. **Build the project**:
   ```sh
   mvn clean install
   ```

4. **Deploy the application**:
   - Deploy the generated WAR file to your preferred servlet container (e.g., Apache Tomcat).
   - Ensure the server is configured to run on port 8080.

5. **Access the application**:
   Navigate to `http://localhost:8080/E_commerce/` in your web browser.

## Usage
- **Home Page**: Browse available products.
- **User Registration/Login**: Create a new account or log in with existing credentials.
- **Add to Cart**: Select products and add them to your shopping cart.
- **Checkout**: Review your cart and place an order.

## Use Cases
- **Small Businesses**: Streamline inventory management and sales processes, reducing manual workload and improving efficiency.
- **Entrepreneurs**: Quickly set up an online store and manage products and transactions without extensive technical knowledge.
- **Retail Operations**: Provide a seamless shopping experience for customers, from product browsing to checkout and order management.

## Problems Solved
- **Inventory Management**: Easily track and manage product inventory, reducing the risk of stockouts or overstocking.
- **Sales Tracking**: Efficiently manage customer orders and sales transactions, providing insights into business performance.
- **User Experience**: Offer a secure and user-friendly platform for customers to browse products, add items to the cart, and complete purchases.
- **Operational Efficiency**: Automate key business processes, reducing manual effort and enabling business owners to focus on growth and customer satisfaction.

## Contributors
- Abel Getahun 
- Yasin Shalo 
- Abreham Kifle
- Aklilu Desalegn
- Jaleta Kebede
- Liben Adugna
- meklit abeje 

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgements
Special thanks to all contributors and the open-source community for their invaluable resources and support.

---
 
