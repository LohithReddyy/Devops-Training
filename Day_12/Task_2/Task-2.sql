CREATE DATABASE sales_analysis;
USE sales_analysis;

USE sales_analysis;

CREATE TABLE sales_raw (
    OrderID VARCHAR(20),
    OrderDate VARCHAR(30),
    Product VARCHAR(100),
    Quantity VARCHAR(30),
    UnitPrice VARCHAR(30),
    City VARCHAR(100)
);
DESCRIBE sales_raw;


SELECT COUNT(*) AS total_records
FROM sales_raw;

SELECT *FROM sales_raw LIMIT 10;

SELECT *
FROM sales_raw;sales_raw


SELECT OrderID, COUNT(*) AS occurrences 
FROM sales_raw 
GROUP BY OrderID 
HAVING COUNT(*) > 1 
ORDER BY occurrences DESC; 


SELECT
    COUNT(*) AS TotalRecords,
    SUM(CASE WHEN TRIM(COALESCE(Product, '')) = '' THEN 1 ELSE 0 END) AS MissingProduct,
    SUM(CASE WHEN TRIM(COALESCE(Quantity, '')) = '' THEN 1 ELSE 0 END) AS MissingQuantity,
    SUM(CASE WHEN TRIM(COALESCE(UnitPrice, '')) = '' THEN 1 ELSE 0 END) AS MissingPrice,
    SUM(CASE WHEN TRIM(COALESCE(City, '')) = '' THEN 1 ELSE 0 END) AS MissingCity
FROM sales_raw;

SELECT OrderID, Product, UnitPrice, City 
FROM sales_raw 
WHERE TRIM(UnitPrice) REGEXP '^[0-9]+(\\.[0-9]+)?$' 
ORDER BY CAST(UnitPrice AS DECIMAL(12,2)) DESC 
LIMIT 1; 





SELECT
    UPPER(TRIM(City)) AS City,
    ROUND(
        SUM(
            CASE
                WHEN TRIM(Quantity) REGEXP '^[0-9]+(\\.[0-9]+)?$'
                 AND TRIM(UnitPrice) REGEXP '^[0-9]+(\\.[0-9]+)?$'
                THEN CAST(Quantity AS DECIMAL(12,2))
                   * CAST(UnitPrice AS DECIMAL(12,2))
                ELSE 0
            END
        ), 2
    ) AS TotalRevenue
FROM sales_raw
GROUP BY UPPER(TRIM(City))
ORDER BY TotalRevenue DESC;

SELECT
    TRIM(Product) AS Product,
    COUNT(*) AS TotalRecords,
    AVG(
        CASE
            WHEN TRIM(UnitPrice) REGEXP '^[0-9]+(\\.[0-9]+)?$'
            THEN CAST(UnitPrice AS DECIMAL(12,2))
            ELSE NULL
        END
    ) AS AveragePrice
    
    
FROM sales_raw
WHERE TRIM(COALESCE(Product, '')) <> ''
GROUP BY TRIM(Product)
HAVING COUNT(*) >= 2
ORDER BY TotalRecords DESC;

SELECT *
FROM sales_raw
WHERE TRIM(Quantity) NOT REGEXP '^[0-9]+(\\.[0-9]+)?$'
   OR CAST(Quantity AS DECIMAL(12,2)) < 0;
   
   
   SELECT
    UPPER(TRIM(City)) AS StandardizedCity,
    COUNT(*) AS TotalOrders
FROM sales_raw
WHERE TRIM(COALESCE(City, '')) <> ''
GROUP BY UPPER(TRIM(City))
ORDER BY TotalOrders DESC;


SELECT 
    UPPER(TRIM(City)) AS StandardizedCity, 
    COUNT(*) AS TotalOrders 
FROM sales_raw 
WHERE TRIM(COALESCE(City, '')) <> '' 
GROUP BY UPPER(TRIM(City)) 
ORDER BY TotalOrders DESC; 