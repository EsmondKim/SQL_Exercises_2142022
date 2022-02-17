use banking;

-- Question 1
-- 1. For each product, show the product name "Product" and the product type name "Type".
SELECT p.NAME  AS `Name`, p.PRODUCT_TYPE_CD as `Product Type` 
FROM Product as p
;

-- Question 2
-- 2. For each branch, list the branch name and city, plus the last name and title of each employee who works in that branch.
select b.name as `Branch Name`, b.CITY as `City`, e.LAST_NAME as `Employee Last Name`, e.TITLE as `Employee Title` 
from branch as b
join employee as e on e.ASSIGNED_BRANCH_ID = b.BRANCH_ID  
;

-- Question 3
-- 3. Show a list of each unique employee title.
select e.title as `Title`
from employee as e
group by `Title`
;

-- Question 4
-- 4. Show the last name and title of each employee, along with the last name and title of that employee's boss.
select e.LAST_NAME as `Employee Last Name`, e.TITLE as `Employee Title`, ee.LAST_NAME as `Superior's Last name`, ee.TITLE as `Superior's Title` 
from employee as e
left join employee as ee
on e. SUPERIOR_EMP_ID = ee.EMP_ID 
;

-- Question 5
-- 5. For each account, show the name of the account's product, the available balance, and the customer's last name.
select p.name as `Account Product Name`, a.avail_balance as `Available Balance`, i.LAST_NAME as `Customer Last Name`
from product as p
right join account as a on p.product_cd = a.PRODUCT_CD 
right join customer as c on a.CUST_ID  = c.CUST_ID 
left join  individual as i on c.CUST_ID = i.CUST_ID 
;

-- Question 6
-- 6. List all account transaction details for individual customers whose last name starts with 'T'.
select *, i.LAST_NAME as `Last Name`
from acc_transaction as a_t
left join account as a on a_t.ACCOUNT_ID = a.ACCOUNT_ID 
left join customer as c on a.CUST_ID = c.CUST_ID 
left join individual as i on c.CUST_ID = i.CUST_ID 
where i.LAST_NAME like "T%"
;