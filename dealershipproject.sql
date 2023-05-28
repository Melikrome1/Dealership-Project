---Dealership Project


CREATE TABLE Cars (
  car_id SERIAL PRIMARY KEY,
  make VARCHAR(255) FOREIGN KEY,
  model VARCHAR(255) FOREIGN KEY,
  color VARCHAR(9) FOREIGN KEY,
  year INTEGER FOREIGN KEY,
  sale_price DECIMAL(10, 2) FOREIGN KEY,
  serial_number VARCHAR(255) FOREIGN KEY
);

CREATE TABLE Salesperson ( 
  salesperson_id INT PRIMARY KEY,
  first_name varchar(50),
  last_name varchar(50)
 );
 
CREATE TABLE customer ( 
  customer_id INT PRIMARY KEY,
  first_name varchar(50),
  last_name varchar(50),
  address CHAR,
  phone_number INT,
  country varchar(50),
  city varchar (50),
  state varchar(50)
  );
 
 
CREATE TABLE service (
  service_id INT PRIMARY KEY,
  customer_id INT,
  service_records CHAR,
  car_id INT,
  service_name VARCHAR(50),
  labor_cost INT,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (car_id) REFERENCES Cars(car_id)
);


CREATE TABLE SalesInvoice (
  sales_invoice_id INT PRIMARY KEY,
  date TIMESTAMP WITH TIME ZONE,
  salesperson_id INT,
  customer_id INT,
  car_id SERIAL,
  FOREIGN KEY (salesperson_id) REFERENCES Salesperson(salesperson_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (car_id) REFERENCES Cars(car_id)
);

CREATE TABLE Mechanics (
  mechanic_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);

CREATE TABLE ServiceTicket (
  service_ticket_id INT PRIMARY KEY,
  service_ticket_number INT,
  car_id SERIAL,
  customer_id INT,
  date_received TIMESTAMP WITH TIME ZONE,
  date_returned TIMESTAMP WITH TIME ZONE,
  comments CHAR
);

CREATE TABLE Parts (
  parts_id INT PRIMARY KEY,
  purchase_price INT,
  description VARCHAR(100),
  supplier_id INT,
  FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);


CREATE TABLE ServiceMechanic (
  service_mechanic_id INT PRIMARY KEY,
  hours INT,
  labor_cost INT,
  comments CHAR,
  service_id INT,
  mechanic_id INT,
  FOREIGN KEY (service_id) REFERENCES ServiceTicket(service_ticket_id),
  FOREIGN KEY (mechanic_id) REFERENCES Mechanics(mechanic_id)
);

SELECT *
FROM cars;
INSERT INTO Cars (make, model, color, year, sale_price, serial_number) 
VALUES ('Lamborghini', 'Hurracan', 'Purple', 2023, 1125000.00, 'ABC123456');
INSERT INTO Cars (car_id, make, model, color, year, sale_price, serial_number) 
VALUES ('Ferrari, '3
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  