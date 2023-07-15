INSERT INTO customer (customer_name, customer_address, customer_phone_number, customer_email)
VALUES ('John Doe', '123 Main St', '555-1234', 'johndoe@example.com');

INSERT INTO customer (customer_name, customer_address, customer_phone_number, customer_email)
VALUES ('Jane Smith', '456 Elm St', '555-5678', 'janesmith@example.com');


INSERT INTO vehicle (customer_id, make, model, year, vin)
VALUES (1, 'Honda', 'Accord', '2020', '1HGCV1F31JA123456');

INSERT INTO vehicle (customer_id, make, model, year, vin)
VALUES (2, 'Toyota', 'Camry', '2019', '4T1B11HK2JU123456');


INSERT INTO service (name, description, price)
VALUES ('Oil Change', 'Replace engine oil and filter', 29.99);

INSERT INTO service (name, description, price)
VALUES ('Brake Inspection', 'Inspect brake pads, rotors, and fluid', 19.99);


INSERT INTO work_order (customer_id, vehicle_id, service_id, order_date, status, price)
VALUES (1, 1, 1, '2023-07-15', 'Pending', 29.99);

INSERT INTO work_order (customer_id, vehicle_id, service_id, order_date, status, price)
VALUES (2, 2, 2, '2023-07-16', 'Completed', 19.99);


INSERT INTO part (name, number, manufacturer, price, supplier_id)
VALUES ('Oil Filter', 'OF-123', 'ACME Filters', 9.99, 1);

INSERT INTO part (name, number, manufacturer, price, supplier_id)
VALUES ('Brake Pads', 'BP-456', 'Quality Brakes', 39.99, 2);


INSERT INTO inventory (part_id, quantity)
VALUES (1, 50);

INSERT INTO inventory (part_id, quantity)
VALUES (2, 20);


INSERT INTO supplier (supplier_name, supplier_address, supplier_phone_number, supplier_email)
VALUES ('ACME Filters', '789 Oak St', '555-9876', 'info@acmefilters.com');

INSERT INTO supplier (supplier_name, supplier_address, supplier_phone_number, supplier_email)
VALUES ('Quality Brakes', '321 Pine St', '555-5432', 'sales@qualitybrakes.com');


INSERT INTO employee (employee_name, employee_address, employee_phone_number, employee_email)
VALUES ('Mark Johnson', '789 Elm St', '555-1111', 'mark.johnson@example.com');

INSERT INTO employee (employee_name, employee_address, employee_phone_number, employee_email)
VALUES ('Sarah Williams', '456 Oak St', '555-2222', 'sarah.williams@example.com');


INSERT INTO invoice (customer_id, work_order_id, invoice_date, total, payment_method)
VALUES (1, 1, '2023-07-16', 29.99, 'Credit Card');

INSERT INTO invoice (customer_id, work_order_id, invoice_date, total, payment_method)
VALUES (2, 2, '2023-07-17', 19.99, 'Cash');
