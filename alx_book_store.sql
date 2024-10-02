CREATE DATABASE IF NOT EXISTS alx_book_store

USE alx_book_store;

CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


INSERT INTO Authors (author_name) VALUES ('George Orwell');
INSERT INTO Authors (author_name) VALUES ('J.K. Rowling');

INSERT INTO Books (title, author_id, price, publication_date) 
VALUES ('1984', 1, 9.99, '1949-06-08');
INSERT INTO Books (title, author_id, price, publication_date) 
VALUES ('Harry Potter and the Philosopher''s Stone', 2, 12.99, '1997-06-26');

INSERT INTO Customers (customer_name, email, address) 
VALUES ('John Doe', 'john.doe@example.com', '123 Elm Street');
INSERT INTO Customers (customer_name, email, address) 
VALUES ('Jane Smith', 'jane.smith@example.com', '456 Oak Avenue');

INSERT INTO Orders (customer_id, order_date) 
VALUES (1, '2024-10-01');
INSERT INTO Orders (customer_id, order_date) 
VALUES (2, '2024-10-02');

INSERT INTO Order_Details (order_id, book_id, quantity) 
VALUES (1, 1, 2);
INSERT INTO Order_Details (order_id, book_id, quantity) 
VALUES (2, 2, 1);

