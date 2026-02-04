-- 填充产品数据
INSERT INTO products (name, description, price, stock_quantity) VALUES 
('Laptop', 'High performance computer', 999.99, 50),
('Smartphone', 'Latest model with dual camera', 699.00, 100),
('Monitor', '27-inch 4K display', 299.50, 30);

-- 填充初始订单项数据
INSERT INTO order_items (product_id, quantity) VALUES 
(1, 2),
(2, 5);