# 1. Top 10 highest sold products 
  
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


