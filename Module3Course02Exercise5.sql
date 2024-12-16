CREATE DATABASE quanlybanhang;
USE quanlybanhang;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_age INT NOT NULL
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(20, 2) NOT NULL CHECK(price > 0)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE orderdetails (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK(quantity > 0),
    PRIMARY KEY(order_id,product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

INSERT INTO customers (customer_name, customer_age)
VALUES
("Minh Quan", 10),
("Ngoc Oanh", 20),
("Hong Ha", 50);

INSERT INTO orders (customer_id, order_date)
VALUES
(1, "2006-3-21"),
(2, "2006-3-23"),
(1, "2006-3-16");

INSERT INTO products (product_name, price)
VALUES
("May giat", 3),
("Tu lanh", 5),
("Dieu hoa", 7),
("Quat", 1),
("Bep dien", 2);

INSERT INTO orderdetails (order_id, product_id, quantity)
VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);
