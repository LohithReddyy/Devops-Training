
CREATE WAREHOUSE IF NOT EXISTS SALES_WH
  WAREHOUSE_SIZE = 'XSMALL'
  AUTO_SUSPEND = 60
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE;

CREATE DATABASE IF NOT EXISTS SALES_DB;
CREATE SCHEMA IF NOT EXISTS SALES_DB.SALES_SCHEMA;

USE WAREHOUSE SALES_WH;
USE DATABASE SALES_DB;
USE SCHEMA SALES_SCHEMA;

CREATE OR REPLACE TABLE SALES (
  ORDER_ID     INT           NOT NULL PRIMARY KEY,
  ORDER_DATE   DATE          NOT NULL,
  CUSTOMER_ID  VARCHAR(10)   NOT NULL,
  CITY         VARCHAR(30)   NOT NULL,
  CATEGORY     VARCHAR(30)   NOT NULL,
  PRODUCT      VARCHAR(60)   NOT NULL,
  QUANTITY     INT           NOT NULL,
  UNIT_PRICE   NUMBER(10,2)  NOT NULL,
  UNIT_COST    NUMBER(10,2)  NOT NULL
);

INSERT INTO SALES
(ORDER_ID, ORDER_DATE, CUSTOMER_ID, CITY, CATEGORY, PRODUCT, QUANTITY, UNIT_PRICE, UNIT_COST)
VALUES
(1001,'2026-01-03','C025','Chennai','Electronics','Power Bank',3,1200.00,800.00),
(1002,'2026-01-08','C017','Mumbai','Grocery','Olive Oil 1L',5,600.00,450.00),
(1003,'2026-01-12','C026','Delhi','Home & Kitchen','Mixer Grinder',1,2400.00,1700.00),
(1004,'2026-01-17','C020','Bengaluru','Fashion','Leather Handbag',3,1100.00,700.00),
(1005,'2026-01-21','C015','Chennai','Fashion','Running Shoes',1,1400.00,900.00),
(1006,'2026-01-26','C003','Mumbai','Electronics','Wireless Earbuds',1,1500.00,950.00),
(1007,'2026-01-30','C015','Delhi','Grocery','Dry Fruits Box',5,700.00,520.00),
(1008,'2026-02-02','C001','Bengaluru','Home & Kitchen','Mixer Grinder',3,2400.00,1700.00),
(1009,'2026-02-06','C002','Chennai','Home & Kitchen','Air Fryer',1,3200.00,2200.00),
(1010,'2026-02-11','C020','Mumbai','Fashion','Running Shoes',1,1400.00,900.00),
(1011,'2026-02-15','C011','Delhi','Electronics','Bluetooth Speaker',2,1800.00,1200.00),
(1012,'2026-02-19','C017','Bengaluru','Grocery','Olive Oil 1L',3,600.00,450.00),
(1013,'2026-02-24','C016','Chennai','Grocery','Organic Staples Pack',4,500.00,380.00),
(1014,'2026-02-27','C003','Mumbai','Home & Kitchen','Air Fryer',3,3200.00,2200.00),
(1015,'2026-03-03','C009','Delhi','Fashion','Leather Handbag',3,1100.00,700.00),
(1016,'2026-03-07','C003','Bengaluru','Electronics','Power Bank',3,1200.00,800.00),
(1017,'2026-03-12','C025','Chennai','Electronics','Wireless Earbuds',2,1500.00,950.00),
(1018,'2026-03-16','C001','Mumbai','Grocery','Organic Staples Pack',4,500.00,380.00),
(1019,'2026-03-21','C025','Delhi','Home & Kitchen','Air Fryer',3,3200.00,2200.00),
(1020,'2026-03-25','C004','Bengaluru','Fashion','Denim Jacket',2,1600.00,1000.00),
(1021,'2026-04-02','C003','Chennai','Fashion','Kurta Set',2,900.00,550.00),
(1022,'2026-04-06','C001','Mumbai','Electronics','Bluetooth Speaker',3,1800.00,1200.00),
(1023,'2026-04-10','C002','Delhi','Grocery','Organic Staples Pack',3,500.00,380.00),
(1024,'2026-04-15','C023','Bengaluru','Home & Kitchen','Bedsheet Set',2,1000.00,650.00),
(1025,'2026-04-20','C003','Chennai','Home & Kitchen','Bedsheet Set',2,1000.00,650.00),
(1026,'2026-04-24','C009','Mumbai','Fashion','Running Shoes',3,1400.00,900.00),
(1027,'2026-04-28','C010','Delhi','Electronics','Wireless Earbuds',1,1500.00,950.00),
(1028,'2026-05-03','C014','Bengaluru','Grocery','Tea Combo',2,350.00,260.00),
(1029,'2026-05-08','C008','Chennai','Grocery','Dry Fruits Box',3,700.00,520.00),
(1030,'2026-05-13','C002','Mumbai','Home & Kitchen','Air Fryer',1,3200.00,2200.00),
(1031,'2026-05-18','C006','Delhi','Fashion','Leather Handbag',2,1100.00,700.00),
(1032,'2026-05-23','C017','Bengaluru','Electronics','Smart Watch',2,3500.00,2500.00),
(1033,'2026-05-28','C025','Chennai','Electronics','Smart Watch',3,3500.00,2500.00),
(1034,'2026-06-02','C021','Mumbai','Grocery','Organic Staples Pack',5,500.00,380.00),
(1035,'2026-06-07','C013','Delhi','Home & Kitchen','Bedsheet Set',1,1000.00,650.00),
(1036,'2026-06-12','C001','Bengaluru','Fashion','Leather Handbag',1,1100.00,700.00),
(1037,'2026-06-17','C010','Chennai','Fashion','Kurta Set',3,900.00,550.00),
(1038,'2026-06-22','C006','Mumbai','Electronics','Bluetooth Speaker',1,1800.00,1200.00),
(1039,'2026-06-27','C002','Delhi','Grocery','Olive Oil 1L',2,600.00,450.00),
(1040,'2026-06-29','C015','Bengaluru','Home & Kitchen','Mixer Grinder',1,2400.00,1700.00);


SELECT * FROM SALES;
SELECT CITY, SUM(QUANTITY*UNIT_PRICE) AS SALES FROM SALES GROUP BY CITY ORDER BY SALES DESC;
SELECT CATEGORY, SUM(QUANTITY*UNIT_PRICE) AS SALES FROM SALES GROUP BY CATEGORY ORDER BY SALES DESC;

