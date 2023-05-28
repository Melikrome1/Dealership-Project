CREATE TABLE Cars (
  car_id SERIAL PRIMARY KEY,
  make VARCHAR(255),
  model VARCHAR(255),
  color VARCHAR(9),
  year INTEGER,
  sale_price DECIMAL(10, 2),
  serial_number VARCHAR(255)
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
  city varchar(50),
  state varchar(50)
);

ALTER TABLE customer
ALTER COLUMN phone_number TYPE INT;



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
  description VARCHAR(100)
  
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

INSERT INTO Cars (car_id, make, model, color, year, sale_price, serial_number) 
VALUES (1, 'Lamborghini', 'Hurracan', 'Purple', 2023, 1125000.00, 'ABC123456');
       (2, 'Ferrari', '360', 'Yellow', 2021, 4444444.00, 'ABC123457');

INSERT INTO Salesperson (salesperson_id, first_name, last_name) 
VALUES (1, 'Cynthia', 'Aguilar');
       (2, 'Homer', 'Simpson');

INSERT INTO customer (customer_id, first_name, last_name, address, phone_number, country, city, state)
VALUES (1, 'Katy', 'Perry', '100 Hollywood St', '1446665647', 'USA', 'Los Angeles', 'CA');
       (2, 'Ice', 'Spice', '120 Main St', '500-300-7524', 'USA', 'New York', 'NY');


INSERT INTO service (service_id, customer_id, service_records, car_id, service_name, labor_cost)
VALUES (1, 1, 'Regular maintenance', 1, 'Oil Change', 350);
       (2, 2, 'Regular maintenance', 2, 'Oil Change', 350);



INSERT INTO SalesInvoice (sales_invoice_id, date, salesperson_id, customer_id, car_id)
VALUES (1, '2023-05-27 10:00:00+00', 1, 1, 123456),
       (2, '2023-05-28 14:30:00+00', 2, 2, 654321);


INSERT INTO Mechanics (mechanic_id, first_name, last_name)
VALUES (1, 'Jose', 'Carlos'),
       (2, 'Antonio', 'Banderas');

INSERT INTO ServiceTicket (service_ticket_id, service_ticket_number, car_id, customer_id, date_received, date_returned, comments)
VALUES (1, 1001, 123456, 1, '2023-05-27 08:00:00+00', '2023-05-27 16:00:00+00', 'Service completed successfully'),
       (2, 1002, 654321, 2, '2023-05-28 09:30:00+00', '2023-05-28 15:30:00+00', 'Additional repairs needed');


INSERT INTO Parts (parts_id, purchase_price, description)
VALUES (1, 20, 'Oil filter'),
       (2, 100, 'Spark plugs');


INSERT INTO ServiceMechanic (service_mechanic_id, hours, labor_cost, comments, service_id, mechanic_id)
VALUES (1, 4, 200, 'Performed routine maintenance', 1, 1),
       (2, 6, 300, 'Replaced faulty component', 2, 2);


