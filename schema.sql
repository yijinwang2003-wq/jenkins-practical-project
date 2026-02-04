-- 每次执行前先删除旧表，确保从零开始构建
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS products;

-- 创建产品表
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

-- 创建订单项表
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(id),
    quantity INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);