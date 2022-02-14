
use classicmodels;
describe offices;
-- 
-- Question 1
SELECT productName as `Name`, productLine as `Product Line`, buyPrice as`Buy price`
FROM products;

-- Question 2
select contactFirstName as `First Name`, contactLastName as `Last Name`, city as `City` 
from customers
where country = "Germany"
order by contactLastName asc;

-- Question 3
select status from orders group by status;

-- Question 4
select * 
from payments
where paymentDate >= str_to_date('01-01-2005','%d-%m-%Y')
order by paymentDate asc;

-- Question 5
select lastName as `Last Name`, firstName as `First Name`, email as `Email`, jobTitle as `Job Title`
from employees
where officeCode = 1
order by lastName asc; 

-- Question 6
select productName as `Name`, productLine as `Product Line`, productScale as `Scale`, productVendor as `Vendor`
from products 
where productLine = 'Classic Cars' or productLine = 'Vintage Cars'
order by productLine desc, name asc;