
-- Inserted Values Into Table

INSERT INTO CUSTOMER VALUES(1001,"Acme Corp",'9765592502','India'),
(1002,"Global Trader",'9765592502','USA'),
(1003,"Tech Solution",'9545252510','Canada'),
(1004,"Import Experts",'9730971601','USA');

INSERT INTO ORDERS VALUES(201,1001,'2025-08-01',1200.00),
(202,1001,'2025-08-05',1850.00),
(203,1002,'2025-08-03',760.00),
(204,1003,'2025-08-07',1340.00),
(205,1004,'2025-08-09',990.00),
(206,1003,'2025-08-10',650.00);


-- Create View 
create view Total_Data as
select * from customer where country = 'USA';

 
-- Find total number of orders per customer
create view Total_Order as
select customer.customer_id, count(orders.order_id) as Total_Count from customer join orders
on customer.customer_id = orders.customer_id
group by  customer.customer_id;

select * from Total_Order;

-- Find customers with no orders
create view No_Orders as  
select  * from customer where customer_id not in (select customer_id from orders);

select *from No_Orders;

-- Get total order amount by country
create view Total_Order_Amount as
select country,sum(amount) as Total_Amount from customer join orders on 
customer.customer_id = orders.customer_id
 group by country; 

select * from Total_Order_Amount;


-- Find the most recent order for each customer

create view most_recent_order as
select customer.customer_name,max(orders.order_date) as Order_Count
  from orders join customer on customer.customer_id = orders.customer_id
  group by customer.customer_name;

 select * from most_recent_order;
 