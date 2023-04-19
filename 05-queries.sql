-- queries to determine how many sales there are for specific services
SELECT o.id, e.name as employee_name, c.name as client_name, 
p.name as pizza_name, o.quantity, s.name as service_type_name
FROM orders o
INNER JOIN employees e ON o.employees_id = e.id
INNER JOIN clients c ON o.clients_id = c.id
INNER JOIN pizzas p ON o.pizzas_id = p.id
INNER JOIN service_type s ON o.service_type_id = s.id
WHERE s.id = "3";

-- queries to determine how many pizzas a specific customer ordered.
SELECT clients.name, pizzas.name, COUNT(*) AS count_pizzas 
FROM orders 
JOIN pizzas ON orders.pizzas_id = pizzas.id 
JOIN clients ON orders.clients_id = clients.id 
WHERE clients_id = "2" 
GROUP BY clients.name, pizzas.name;

-- consultations to determine how many pizzas were sold and the total amount collected for them
SELECT pizzas.name AS pizza_name, COUNT(*) AS count, SUM(orders.amount) AS total_amount
FROM orders
JOIN pizzas ON orders.pizzas_id = pizzas.id
GROUP BY pizzas.name
ORDER BY total_amount DESC;

-- queries to see which employee took the most orders
SELECT employees.name AS employee_name, COUNT(*) AS total_orders, SUM(amount) AS total_revenue
FROM orders
JOIN employees ON orders.employees_id = employees.id
GROUP BY employees_id
ORDER BY total_orders DESC
LIMIT 1;

-- query by percentage and displaying all employees and sorting them from highest to lowest by sales percentage
SELECT employees.name, COUNT(*) AS total_orders, SUM(amount) AS total_amount,
ROUND(SUM(amount) * 100 / (SELECT SUM(amount) FROM orders), 2) AS percentage
FROM orders
JOIN employees ON orders.employees_id = employees.id
GROUP BY employees.id
ORDER BY percentage DESC;

