-- list of orders including information about customer, employee and shipper
select orders.orderId, customers.customerName, orders.orderDate, orders.shipperId, orders.employeeId, employees.lastName, employees.firstName, shippers.shipperName
from orders
join customers on orders.customerId = customers.customerId
join employees on orders.employeeId = employees.employeeId
join shippers on orders.shipperId = shippers.shipperId

--list orders including customer name, employe last and first and shipper name (using aliases)
select o.orderId, c.customerName, o.orderDate, o.shipperId, o.employeeId, e.lastName, e.firstName, s.shipperName
from orders as o
join customers as c on o.customerId = c.customerId
join employees as e on o.employeeId = e.employeeId
join shippers as s on o.shipperId = s.shipperId

--concatenating and useing column aliases
select o.orderId, c.customerName, o.orderDate, (e.firstName || " " || e.lastName) as SoldBy, s.shipperName as ShippedUsing
from orders as o
join customers as c on o.customerId = c.customerId
join employees as e on o.employeeId = e.employeeId
join shippers as s on o.shipperId = s.shipperId

-- list of products, including the category name, organized by the category id descending
-- an "inner join" is the same as using "join"
select * 
from products as p
inner join categories as c
on p.categoryId = c.categoryId
order by c.categoryId desc;

-- list of categories, even if there are no products on that category
select * 
from categories as c 
left join products as p on c.categoryId = p.categoryId
order by c.categoryId desc;

--list all accounts and character information if available
SELECT a.id, a.name, a.email, c.id, c.name
From accounts as a 
LEFT JOIN characters as c 
ON a.id = c.account_id;

-- user (id, username), post (id, contents, user_id), list all posts including the user name 
Select p.*, u.username
FROM Posts as p
JOIN Users as u 
ON p.user_id = u.id;