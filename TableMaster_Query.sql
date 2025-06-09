SELECT
  orders.Date AS order_date,
  cat.CategoryName AS category_name,
  prod.ProdName AS product_name,
  prod.Price AS product_price,
  orders.Quantity AS order_qty,
  (prod.Price * orders.Quantity) AS total_sales,
  REGEXP_SUBSTR(cust.CustomerEmail, r'^[^#]+') AS cust_email,
  cust.CustomerCity AS cust_city
FROM `Bank_Muamalat_Dataset.orders` AS orders
LEFT JOIN `Bank_Muamalat_Dataset.products` AS prod
  ON orders.ProdNumber = prod.ProdNumber
LEFT JOIN `Bank_Muamalat_Dataset.customers` AS cust
  ON orders.CustomerID = cust.CustomerID
LEFT JOIN `Bank_Muamalat_Dataset.product_category` AS cat
  ON prod.Category = cat.CategoryID
ORDER BY 1;
