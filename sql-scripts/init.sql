-- init.sql
-- usersテーブルの作成
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ordersテーブルの作成
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    quantity INT DEFAULT 1,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- usersテーブルにサンプルデータを挿入
INSERT INTO users (username, email) VALUES
('user1', 'user1@example.com'),
('user2', 'user2@example.com'),
('user3', 'user3@example.com'),
('user4', 'user4@example.com'),
('user5', 'user5@example.com'),
('user6', 'user6@example.com'),
('user7', 'user7@example.com'),
('user8', 'user8@example.com'),
('user9', 'user9@example.com'),
('user10', 'user10@example.com');

-- ordersテーブルにサンプルデータを挿入
INSERT INTO orders (user_id, product_name, quantity, order_date) VALUES
(1, 'Product A', 2, '2021-01-01'),
(1, 'Product B', 1, '2021-01-02'),
(2, 'Product A', 1, '2021-01-02'),
(3, 'Product C', 3, '2021-01-03'),
(4, 'Product D', 4, '2021-01-04'),
(5, 'Product E', 2, '2021-01-05'),
(5, 'Product F', 3, '2021-01-06'),
(6, 'Product G', 1, '2021-01-07'),
(7, 'Product H', 2, '2021-01-08'),
(8, 'Product I', 1, '2021-01-09'),
(9, 'Product J', 3, '2021-01-10'),
(10, 'Product K', 2, '2021-01-11');

-- インデックスの追加
CREATE INDEX idx_username ON users(username);
CREATE INDEX idx_email ON users(email);
CREATE INDEX idx_order_date ON orders(order_date);
CREATE INDEX idx_product_name_quantity ON orders(product_name, quantity);
