# SalesSavvy

SalesSavvy is an e-commerce solution designed for small and medium businesses, streamlining online sales and enhancing customer interactions. It features an admin panel for managing products, users, and orders, along with a customer interface for seamless browsing, shopping, and order tracking. The platform integrates secure payment options like Razorpay, PayPal, and Stripe while maintaining a scalable architecture that allows businesses to expand functionality as needed. Built with a full-stack approach, SalesSavvy uses React for a dynamic frontend, Java for backend logic, and MySQL for secure data management. Additionally, it incorporates sales management tools such as customer records and sales monitoring to improve operational efficiency.

## 🌐 Project Overview

SalesSavvy offers:
- A dynamic storefront for customers to browse and purchase products.
- A secure login/signup system for users.
- An admin dashboard to manage products, users, and orders.
- Integration with popular payment gateways including Razorpay, PayPal, and Stripe.
- Responsive UI and clean design for better user experience.

## 🧰 Tech Stack

### Frontend:
- React.js
- JavaScript
- HTML/CSS

### Backend:
- Java (Spring Boot )

### Database:
- MySQL

### Tools & Libraries:
- Axios
- React Router
- Postman (for API testing)

## 📁 Project Structure
SalessavvyApp-Frontend/
├── public/
│ └── index.html
├── src/
│ ├── assets/
│ │ ├── logo.png
│ │ └── useravatar.png
│ ├── App.jsx
│ ├── App.css
│ ├── main.jsx
│ ├── index.css
│ ├── Routes.jsx
│ ├── components/
│ │ ├── Header.jsx
│ │ ├── Footer.jsx
│ │ ├── CartIcon.jsx
│ │ ├── CategoryNavigation.jsx
│ │ ├── ProfileDropdown.jsx
│ │ └── CustomModal.jsx
│ ├── pages/
│ │ ├── LoginPage.jsx
│ │ ├── RegistrationPage.jsx
│ │ ├── CustomerHomePage.jsx
│ │ ├── AdminDashboard.jsx
│ │ ├── AdminLogin.jsx
│ │ ├── ProductList.jsx
│ │ ├── CartPage.jsx
│ │ └── OrderPage.jsx
├── package.json
├── vite.config.js
├── eslint.config.js
└── README.md

SalesSavvy-Backend/
├── src/
│ ├── main/
│ │ ├── java/com/example/demo/
│ │ │ ├── SalesSavvyApplication.java
│ │ │ ├── admincontrollers/
│ │ │ ├── adminservices/
│ │ │ ├── controller/
│ │ │ ├── dto/
│ │ │ ├── entity/
│ │ │ ├── filter/
│ │ │ ├── repository/
│ │ │ └── service/
│ │ └── resources/
│ │ ├── application.properties
│ │ └── static/templates (if any)
│ └── test/java/com/example/demo/
├── pom.xml
├── mvnw / mvnw.cmd
├── HELP.md
├── target/
