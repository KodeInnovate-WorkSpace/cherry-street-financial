#SQL Data:

create database cherrystreet;
use  cherrystreet;

CREATE TABLE users (
id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(255),
pass VARCHAR(255)
);

CREATE TABLE advisors (
id INT AUTO_INCREMENT PRIMARY KEY,
img TEXT NOT NULL,
advisorName VARCHAR(100) NOT NULL,
speciality VARCHAR(100) NOT NULL,
joinDate YEAR NOT NULL,
phoneNum VARCHAR(15) NOT NULL,
location VARCHAR(100) NOT NULL,
workMode ENUM('virtually', 'physically') NOT NULL,
experience INT NOT NULL,
advisorDescription TEXT
);

CREATE TABLE transactions (
id INT AUTO_INCREMENT PRIMARY KEY,
purchase VARCHAR(255) NOT NULL,
cost DECIMAL(10, 2) NOT NULL,
transaction_date DATE NOT NULL
);

INSERT INTO transactions (purchase, cost, transaction_date) VALUES
('Starbucks', 12.43, '2024-05-18'),
('Target', 64.00, '2024-05-18'),
('Best Buy', 4322.19, '2024-05-17'),
('Home Depot', 12054.77, '2024-05-17'),
('McDonalds', 10.96, '2024-12-18'),
('Microsoft', 64.27, '2024-12-18'),
('Food Lion', 1.27, '2024-12-17'),
('Sheetz', 28.21, '2024-12-17'),
('Costco', 2.27, '2024-12-11'),
('Taco Bell', 28.21, '2024-11-01');

select * from transactions;

drop table advisors;
select * from advisors;

INSERT INTO advisors (
advisorName, img, speciality, joinDate, phoneNum, location, workMode, experience, advisorDescription
) VALUES (
'Maria Jenkins',
'https://images.unsplash.com/photo-1490111718993-d98654ce6cf7',
'Senior Financial Advisor',
2019,
'9989898787',
'Morristown, NJ',
'virtually',
10,
'Lorem ipsum dolor sit amet, elit, sedo do do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
);


UPDATE advisors
SET
advisorName = 'John Smith',
speciality = 'Lead Investment Advisor',
joinDate = 2021,
phoneNum = '1234567890',
location = 'New York, NY',
workMode = 'physically',
experience = 15,
advisorDescription = 'New and updated description: Expert in portfolio management and financial planning with over 15 years of experience. Dedicated to helping clients achieve financial success through tailored strategies.'
WHERE id = 1;



INSERT INTO users (username, pass) VALUES ('john', '1234');


CREATE TABLE products (
product_id INT PRIMARY KEY AUTO_INCREMENT,
pname VARCHAR(255),
img_url VARCHAR(255),
price INT,
mrp INT,
discount INT,
qty INT,
category_name VARCHAR(255),
sub_category_name VARCHAR(255),
is_active BOOL,
stock_count INT,
variant varchar(255)
);



drop table users;
