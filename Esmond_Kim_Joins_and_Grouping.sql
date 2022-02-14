use classicmodels

-- Question 1
select c.customerName as `Customer Name`, CONCAT(e.lastName, ', ', e.firstName) as `Sales Rep`
from customers as c
join employees as e on c.salesRepEmployeeNumber = e.employeeNumber 
order by c.customerName;

-- Question 2
select o.productCode, o.quantityOrdered, p.productName 
from orderdetails as o
join products as p on o.productCode = p.productCode

select * from orderdetails