DROP TABLE IF EXISTS inventory;

CREATE TABLE inventory (
    id SERIAL PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2)
);