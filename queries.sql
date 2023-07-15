SELECT * FROM customer;
SELECT vehicle_id, make, model, year FROM vehicle;


SELECT * FROM work_order WHERE status = 'Completed';
SELECT * FROM part WHERE price > 50.00;


SELECT customer_name, CONCAT(customer_address, ', ', customer_city) AS full_address
FROM customer;
SELECT part_name, part_price, part_price * 1.1 AS price_with_tax
FROM part;


SELECT customer_name, customer_email FROM customer ORDER BY customer_name ASC;
SELECT vehicle_make, vehicle_model, vehicle_year FROM vehicle ORDER BY vehicle_year DESC;


SELECT customer_id, COUNT(*) AS order_count
FROM work_order
GROUP BY customer_id
HAVING order_count > 5;


SELECT work_order_id, customer_name, vehicle_make, vehicle_model, service_name
FROM work_order
JOIN customer ON work_order.customer_id = customer.customer_id
JOIN vehicle ON work_order.vehicle_id = vehicle.vehicle_id
JOIN service ON work_order.service_id = service.service_id;