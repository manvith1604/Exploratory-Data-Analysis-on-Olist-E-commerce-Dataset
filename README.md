# Exploratory-Data-Analysis-on-Olist-E-commerce-Dataset

## Introduction

Creating a database for an e-commerce store company named “Olist” to store the details of customers, products, sellers, orders placed by the customers, and it includes customer reviews and payments made. The sellers and customers' zip codes are mapped to Geolocation through longitudes and latitude along with zip code.

## Business Problem
E-commerce company “Olist” approached for designing the database system for their company. Olist effectively and with a single contract connects small businesses from all over the country to channels. The business owners can use Olist logistics partners to sell their goods through the Olist store and send them straight to the customer. A customer can shop for the products from the website.Once the product has been delivered or anticipated to the customers receive an email with a satisfaction survey where he/she can provide feedback on the shopping experience. After the product is selected customers can pay through the payment gateway by either credit card, UPI or gift voucher.  The customers and sellers are matched through zip code, such that the nearest seller ships the product to the customer and it would reduce the shipping cost. 

The goal of this project is to design the database system to ensure that the nearest seller ships the products to the customers, which reduces the shipping duration. Also, it aims to keep track of customers payments and their product reviews. 
The project in overall aims at providing a smoother experience to customers on the Olist e-commerce platform.

## Entities and relationships
- Customers are identified by unique “Customer_id”. They also have a name, zip code, city, and state details.
- Orders are identified by unique “Order_id”, which is mapped to specific Customer through “Customer_id”. It contains status, order placed date, delivery date.
- Reviews are unique to every order and is mapped through “Order_id”. It also has “Review_id”, score and date.
- Orders are completed by the payments made which are identified through “Order_id”. It also has payment type, invoice number and amount.
- Every order contains Items which are mapped through “Order_id”. It has its own unique “Item_id.” It is linked with products through “Product_id.”
The items are sold by sellers, which are mapped through their “Seller_id.” The item table also has price, shipping limit date and freight value.
- Products are identified by unique “Product_id.” It has name, category, and weight.
- Sellers are asssociated by “Seller_id.” They also have zip code, city and state.
- Geolocation table has latitude and longitude details which are mapped to each zip code. It also has city and state details. The customers and sellers are matched through this table with zip code, such that the nearest seller ships the product to the customer. <br/>
Referential data: Customers, Items, Products, Seller, Geolocation and Reviews Transactional data: Orders and Payments<br/>
Here is the EER diagram for the e-commerce business.

![image](https://github.com/manvith1604/Exploratory-Data-Analysis-on-Olist-E-commerce-Dataset/assets/66794160/5e8e3af5-fa2a-49f0-9933-f224bbb407a3)

# UML Diagram
![image](https://github.com/manvith1604/Exploratory-Data-Analysis-on-Olist-E-commerce-Dataset/assets/66794160/b8eadcde-1d14-4a45-b784-74e8e4c2e0e7)

# Tables in the database

REVIEWS (Review_id, Order_id, Score, Date) <br/>
CUSTOMERS (Customer_id, Name, Zip code, City, State)<br/>
ORDERS (Order_id, Customer_id, Status, Order placed date, Delivery date)<br/>
PAYMENTS (Order_id, Type, Invoice number, Amount)<br/>
ITEMS (Item_id, Order_id, Product_id, Seller_id, Price, Shipping limit date, Freight value)<br/>
PRODUCTS (Product_id, Category, Weight)<br/>
SELLERS (Seller_id, Zip code, City, State)<br/>
GEOLOCATION (ZipCode, City, State, Latitude, Longitude)<br/>

