use classicmodels

-- Question 1
-- 1. Write a query to display each customer’s name (as “Customer Name”) alongside the name of the 
-- employee who is responsible for that customer’s orders. The employee name should be in a single “Sales Rep” 
-- column formatted as “lastName, firstName”. The output should be sorted alphabetically by customer name.
select c.customerName as `Customer Name`, CONCAT(e.lastName, ', ', e.firstName) as `Sales Rep`
from customers as c
join employees as e on c.salesRepEmployeeNumber = e.employeeNumber 
order by c.customerName;

-- Question 2
-- 2. Determine which products are most popular with our customers. For each product, list the total quantity ordered along with 
-- the total sale generated (total quantity ordered * priceEach) for that product. The column headers should be “Product Name”, 
-- “Total # Ordered” and “Total Sale”. List the products by Total Sale descending.
select p.productname AS `Product Name`, od.quantityOrdered AS `Total # Ordered`, od.quantityOrdered*od.priceEach AS `Total Sale`
from products as p
join orderdetails AS od 
on od.productCode = p.productCode
order by `Total Sale` DESC
;

-- Question 3
-- 3. Write a query which lists order status and the # of orders with that status. Column headers should be “Order Status” 
-- and “# Orders”. Sort alphabetically by status.
select o.status as `Order Status`, sum(od.quantityOrdered) as `# Orders`
from orders as o
join orderdetails as od  
on o.orderNumber = od.orderNumber
group by o.status
order by o.status asc
;

-- Question 4
-- 4. Write a query to list, for each product line, the total # of products sold from that product line. The first column should 
-- be “Product Line” and the second should be “# Sold”. Order by the second column descending.
select p.productLine as `Product Line`, sum(od.quantityOrdered) as `# Sold`
from products as p
join orderdetails as od
on p.productCode = od.productCode 
group by p.productLine 
order by `# Sold` desc
;

-- Question 5
-- 5. For each employee who represents customers, output the total # of orders that employee’s customers have placed alongside the total sale 
-- amount of those orders. The employee name should be output as a single column named “Sales Rep” formatted as “lastName, firstName”. 
-- The second column should be titled “# Orders” and the third should be “Total Sales”. Sort the output by Total Sales descending. Only (and all) 
-- employees with the job title ‘Sales Rep’ should be included in the output, and if the employee made no sales the Total Sales should display as “0.00”.
select concat(e.lastName, ', ', e.firstName) as `Sales Rep`, sum(od.quantityOrdered) as `# Orders`, 
if(sum(od.quantityOrdered*od.priceEach) > 0.00, sum(od.quantityOrdered*od.priceEach), 0.00) as `Total Sales`
from employees as e
left join customers as c on e.employeeNumber = c.salesRepEmployeeNumber
join orders as o on c.customerNumber = o.customerNumber
join orderdetails as od on o.orderNumber = od.orderNumber
where e.jobTitle = 'Sales Rep'
-- group by `Sales Rep`
-- order by `Total Sales` desc
;
select concat(e.lastName, ', ', e.firstName)  
from employees as e
join customers as c on e.employeeNumber = c.salesRepEmployeeNumber 

-- Question 6
-- 6. Your product team is requesting data to help them create a bar-chart of monthly sales since the company’s inception. 
-- Write a query to output the month (January, February, etc.), 4-digit year, and total sales for that month. The first column 
-- should be labeled ‘Month’, the second ‘Year’, and the third should be ‘Payments Received’. Values in the third column should 
-- be formatted as numbers with two decimals – for example: 694,292.68.
select month(p.paymentdate) as `Month`, year(p.paymentdate) as `Year`, format(sum(p.amount), 2) as `Payments Received` 
from payments as p
group by `Month`
order by `Month` asc
;



