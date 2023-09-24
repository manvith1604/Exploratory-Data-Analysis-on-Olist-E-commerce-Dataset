 -- 1. Top 10 highest sold products 
  
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

-- 2.	Top 10 costliest products 

SELECT 
    i.product_id, p.name, p.category, i.price
FROM
    items i,
    products p
WHERE
    i.product_id = p.product_id
ORDER BY price DESC
LIMIT 10;

-- 3. Average Order value

SELECT 
    ROUND(SUM(i.price) / COUNT(DISTINCT o.customer_id),2) 
    AS 'Average_order_value'
FROM
    items i,
    orders o
WHERE
    i.order_id = o.order_id;

-- 4.	Customers per zip code

SELECT 
    zip_code, COUNT(customer_id) AS 'Customers'
FROM
    customers
GROUP BY zip_code
ORDER BY 2 DESC;

-- 5.	Average amount per payment type 

SELECT 
    type, ROUND(AVG(amount), 2) AS 'Average'
FROM
    payments
GROUP BY type
ORDER BY 2 DESC;

-- 6. Least-rated products 

SELECT name, product_id,category FROM products 
WHERE product_id IN 
                (SELECT product_id FROM items
                 WHERE order_id IN
                                (SELECT order_id FROM reviews
                                 WHERE score = 1));

-- 7. Count of products per category

SELECT 
    category, COUNT(product_id) AS 'Product_count'
FROM
    products
GROUP BY category;

-- 8.  Delivery modes based on weight	

SELECT 
    category,
    ROUND(product_weight_g/1000) AS 'Weight',
    CASE
        WHEN ROUND(product_weight_g/1000) > 5 THEN 'Delivery by Van'
        WHEN ROUND(product_weight_g/1000) <= 5 THEN 'Delivery by Postman'
    END AS 'Delivery_mode'
FROM
    products;


