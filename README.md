# Auto Repair Shop Management System

This project is a database schema for an Auto Repair Shop Management System. It provides a structured database design to manage customers, vehicles, services, work orders, parts inventory, suppliers, employees, and invoices for an auto repair shop.

## Table of Contents

- [Overview](#overview)
- [Database Schema](#database-schema)
- [Setup](#setup)
- [Usage](#usage)
- [Contributing](#contributing)

## Overview

The Auto Repair Shop Management System is designed to help auto repair shops efficiently manage their operations. It allows the shop to maintain customer information, track vehicle details, manage services, create work orders, manage parts inventory, track suppliers, and generate invoices.

## Database Schema

The database schema consists of the following tables:

- `customer`: Stores customer details including name, address, phone number, and email.
- `vehicle`: Stores vehicle information including make, model, year, VIN, and the associated customer.
- `service`: Stores information about different services offered by the auto repair shop.
- `work_order`: Tracks work orders created for customers, including the customer, vehicle, service, order date, status, and price.
- `part`: Stores information about parts including name, number, manufacturer, price, and associated supplier.
- `inventory`: Tracks the inventory of parts, including the part, quantity, and availability.
- `supplier`: Stores information about suppliers providing parts to the repair shop.
- `employee`: Stores employee details including name, address, phone number, and email.
- `invoice`: Stores invoice details including the customer, associated work order, invoice date, total amount, and payment method.
- `employee_work_order`: Establishes a relationship between employees and work orders, allowing multiple employees to be associated with a work order.

## Setup

To use this Auto Repair Shop Management System:

1. Set up a MySQL database.
2. Run the SQL statements provided in the [database-schema.sql](database-schema.sql) file to create the necessary tables and establish the relationships.
3. Connect your application or use a database management tool to interact with the database.

## Usage

Once the database and tables are set up, you can start using the Auto Repair Shop Management System. Here are some common tasks:

- Add customers, vehicles, services, parts, suppliers, and employees to their respective tables.
- Create work orders for customers, specifying the vehicle, services required, and assigning employees.
- Update the status and pricing of work orders as they progress.
- Track inventory levels of parts and manage supplier relationships.
- Generate invoices for completed work orders and track payment details.

Modify the database schema or build an application on top of it to suit your specific requirements.

## Contributing

Contributions to this project are welcome. If you find any issues or have suggestions for improvements, please open an issue or submit a pull request on the repository.