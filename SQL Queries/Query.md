 ## 1. Top 10 highest sold products 
Provides information about the products which are sold frequently. It helps to keep track of products which are in high demand.

 ```sql
SELECT 
    i.product_id,
    p.name,
    p.category,
    COUNT(i.order_id) AS 'Order_count'
FROM
    items i,
    products p
WHERE
    i.product_id = p.product_id
GROUP BY i.product_id , p.name , p.category
ORDER BY Order_count DESC
LIMIT 10;
```
<img src = "https://github.com/manvith1604/Exploratory-Data-Analysis-on-Olist-E-commerce-Dataset/assets/66794160/0b0e97cd-ee3a-4130-aee9-056d5a6a1456" width = "250" height = "250">

## 2.	Top 10 costliest products 
Provides information about the costliest products which are sold by the sellers. It helps to track price of products in a category.

```sql
SELECT 
    i.product_id, p.name, p.category, i.price
FROM
    items i,
    products p
WHERE
    i.product_id = p.product_id
ORDER BY price DESC
LIMIT 10;
```

![image](https://github.com/manvith1604/Exploratory-Data-Analysis-on-Olist-E-commerce-Dataset/assets/66794160/18b70dac-9a63-4e6d-9201-86be0764eafe)

## 3. Average Order value
Provides information about the average price of the order placed per customer. It helps to track customer purchase trends.

```sql
SELECT 
    ROUND(SUM(i.price) / COUNT(DISTINCT o.customer_id),2) 
    AS 'Average_order_value'
FROM
    items i,
    orders o
WHERE
    i.order_id = o.order_id;
```

![image](https://github.com/manvith1604/Exploratory-Data-Analysis-on-Olist-E-commerce-Dataset/assets/66794160/07e031c7-8eb7-4e57-861a-437fde7e6184)

## 4.	Customers per zip code
It provides number of customers available for a given zip code. It is useful in tracking the distribution of customers in various zip codes.

```sql
SELECT 
    zip_code, COUNT(customer_id) AS 'Customers'
FROM
    customers
GROUP BY zip_code
ORDER BY 2 DESC;
```

![image](https://github.com/manvith1604/Exploratory-Data-Analysis-on-Olist-E-commerce-Dataset/assets/66794160/1e9b8b70-c56b-4fc0-b0b8-69d6651f0a6c)

## 5.	Average amount per payment type 
It provides the average amount for a given payment type. It helps to track the various payment methods used by the customer.

```sql
SELECT 
    type, ROUND(AVG(amount), 2) AS 'Average'
FROM
    payments
GROUP BY type
ORDER BY 2 DESC;
```
![image](https://github.com/manvith1604/Exploratory-Data-Analysis-on-Olist-E-commerce-Dataset/assets/66794160/4d88e46e-af6b-4bce-8a6c-f0831f67fa29)

## 6. Least-rated products 
It provides the list of products that are listed least. This analysis will help to improve quality of products based on feedback received.

```sql
SELECT name, product_id,category FROM products 
WHERE product_id IN 
                (SELECT product_id FROM items
                 WHERE order_id IN
                                (SELECT order_id FROM reviews
                                 WHERE score = 1));
```

![image](https://github.com/manvith1604/Exploratory-Data-Analysis-on-Olist-E-commerce-Dataset/assets/66794160/5a2e8fbc-806a-4bd6-b014-9fa5b67725e9)

## 7. Count of products per category
It provides number of products per category. It is useful in displaying distribution of various products across categories and maintaining inventory.

```sql
SELECT 
    category, COUNT(product_id) AS 'Product_count'
FROM
    products
GROUP BY category;
```

![image](https://github.com/manvith1604/Exploratory-Data-Analysis-on-Olist-E-commerce-Dataset/assets/66794160/6d9b5f84-5a62-4d14-a8fe-10d5a0a25ecd)

## 8.  Delivery modes based on weight	
It provides information regarding delivery modes based on weight of the product weight. It is useful to categorize and assign deliveries of products efficiently.

```sql
SELECT 
    category,
    ROUND(product_weight_g/1000) AS 'Weight',
    CASE
        WHEN ROUND(product_weight_g/1000) > 5 THEN 'Delivery by Van'
        WHEN ROUND(product_weight_g/1000) <= 5 THEN 'Delivery by Postman'
    END AS 'Delivery_mode'
FROM
    products;
```

![image](https://github.com/manvith1604/Exploratory-Data-Analysis-on-Olist-E-commerce-Dataset/assets/66794160/04c7ad18-10f6-43e1-9b1b-f34dea091469)

