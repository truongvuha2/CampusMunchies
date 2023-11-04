create table Category(
	cat_id varchar(10),
	cat_name nvarchar(20) not null,
	cat_status varchar(10) not null,
	primary key (cat_id)
)

create table Food(
	foo_id varchar(10),
	cat_id varchar(10) not null,
	foo_name nvarchar(50) not null,
	foo_price decimal(10,2)  not null,
	foo_sale decimal(10,2)  not null,
	foo_description nvarchar (200) not null,
	foo_status varchar(10) not null ,
    foo_img varchar(255) not null,
	primary key (foo_id),
	foreign key (cat_id) references Category(cat_id) 
)


create table Customer (
	cus_phone varchar(10),
	cus_name nvarchar(50) not null,
	cus_password varchar(32) not null,
	cus_email varchar(50) not null,
	cus_address nvarchar(50) not null,
	cus_birthday date not null,
	cus_create date not null,
	cus_status varchar(10) not null,
	primary key (cus_phone)
)

create table Employee (
	emp_phone varchar(10),
	emp_name nvarchar(50) not null,
	emp_password varchar(32) not null,
	emp_email varchar(50) not null,
	emp_address nvarchar(50) not null,
	emp_birthday date not null,
	emp_create date NOT NULL,
	emp_status varchar(10) not null,
	primary key (emp_phone)
)



create table [Order] (
	ord_id varchar(10),
	cus_phone varchar(10) not null,
	emp_phone varchar(10),
	ord_date date not null,
	ord_type varchar(10) not null,
	ord_status varchar(10) not null,
	ord_pay varchar(7) not null,
	ord_note nvarchar(200) not null,
	ord_total decimal(10,2) not null,
	primary key (ord_id),
	foreign key (cus_phone) references Customer(cus_phone),
	foreign key (emp_phone) references Employee(emp_phone),
)

create table OrderDetail(
	ord_id varchar(10),
	foo_id varchar(10) not null,
	quantity int not null,
	price decimal(10,2) not null,
	foreign key (ord_id) references [Order],
	foreign key (foo_id) references Food
)

create table Manager(
	username varchar(20),
	password varchar(32) not null,
	primary key (username)
)

create table Cart(
	cus_phone varchar(10),
	foo_id varchar(10),
	quantity int,
	foreign key (cus_phone) references Customer,
	foreign key (foo_id) references Food
)

-- Đảm bảo bảng Order đã được tạo trước
-- Bạn có thể chạy lệnh CREATE TABLE [Order] như bạn đã định nghĩa


-- Insert data into Category table
INSERT INTO Category (cat_id, cat_name,cat_status)
VALUES ('CAT001', N'Noodle','Available'),
       ('CAT002', N'Chicken','Available'),
       ('CAT003', N'Bread','Available'),
       ('CAT004', N'Side Dish','Available'),
       ('CAT005', N'Drink','Available'),
	   ('CAT006', N'Rice','Available'),
	   ('CAT007', N'Combo','Available');

---- Insert data into Food table
INSERT INTO Food (foo_id, cat_id, foo_name, foo_price, foo_sale, foo_description, foo_status, foo_img)
VALUES
	('FOOD001', 'CAT004', N'Salad', 0.24, 0.00, N'Fresh and healthy salad with a variety of ingredients', 'Available', 'https://i.ibb.co/4ST0XCZ/Salad.png'),

    ('FOOD002', 'CAT003', N'Kebab', 1.99, 0.00, N'Grilled kebab served with pita bread and sauce', 'Available', 'https://i.ibb.co/MscZLfn/Kebab.png'),
('FOOD003', 'CAT001', N'Italian Pasta', 2.49, 5.00, N'Delicious Italian pasta with your choice of sauce', 'Available', 'https://i.ibb.co/zxnNz2h/Pasta.png'),

    ('FOOD004', 'CAT002', N'Fried Chicken Wings', 3.49, 2.00, N'Crispy fried chicken wings with your choice of sauce', 'Available', 'https://i.ibb.co/jzLLJkq/Chicken-Wings.png'),

    ('FOOD005', 'CAT002', N'Fried Chicken Drumsticks', 3.99, 0.00, N'Crispy fried chicken drumsticks with your choice of sauce', 'Available', 'https://i.ibb.co/cXwkt1L/Chicken-Drumstick.png'),

    ('FOOD006', 'CAT003', N'Egg Banh Mi', 1.49, 0.00, N'Delicious egg sandwich with fresh ingredients', 'Available', 'https://i.ibb.co/xDnxGBX/Egg-Banh-Mi.png'),

    ('FOOD007', 'CAT003', N'Meat Banh Mi', 1.99, 0.00, N'Hearty meat sandwich with a variety of fillings', 'Available', 'https://i.ibb.co/zNtW5wN/Meat-Banh-Mi.png'),

    ('FOOD008', 'CAT004', N'French Fries', 0.99, 12.00, N'Golden and crispy french fries with ketchup', 'Available', 'https://i.ibb.co/yyvfzsN/French-Fries.png'),

    ('FOOD009', 'CAT003', N'Hamburger', 2.49, 13.00, N'Delicious hamburger with your choice of toppings', 'Available', 'https://i.ibb.co/Nm3BsQt/Hamburger.png'),

	('FOOD010', 'CAT006', N'Xoi Man', 0.99, 3.00, N'Sticky rice with a variety of toppings', 'Available', 'https://i.ibb.co/ydX8vbb/XoiMan.png'),

    ('FOOD011', 'CAT003', N'Toco', 2.49, 10.00, N'Toco Toco', 'Available', 'https://i.ibb.co/kKxPFRy/Toco.png'),

    ('FOOD012', 'CAT005', N'Pepsi', 0.49, 3.00, N'Classic Pepsi soda', 'Available', 'https://i.ibb.co/8r2cnDh/Pepsi.png'),

    ('FOOD013', 'CAT005', N'Coca-Cola', 0.49, 0.00, N'Classic Coca-Cola soda', 'Available', 'https://i.ibb.co/G7jBD5M/CocaCola.png'),

    ('FOOD014', 'CAT005', N'7UP', 0.49, 0.00, N'Refreshing 7UP soda', 'Available', 'https://i.ibb.co/sVSMXJs/7up.png'),

    ('FOOD015', 'CAT005', N'Fanta', 0.49, 0.00, N'Fruity Fanta soda', 'Sold Out', 'https://i.ibb.co/9wxKxXW/Fanta.png'),

    ('FOOD016', 'CAT005', N'Milo', 0.74, 2.00, N'Delicious Milo chocolate drink', 'Available', 'https://i.ibb.co/m8d7Qft/Milo.png');


INSERT INTO Customer  VALUES
('0123456789', 'John Smith', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password'), 2), 'khanhnguyennguyen2003@gmail.com', '123 Main St, Cityville', '1990-05-15','2023-10-15','Blocked'),
('0123456788', 'Sarah Johnson', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password2'), 2), 'cus2@gmail.com', '456 Elm St, Townsville', '1985-09-20','2023-9-11', 'Available'),
('0123456787', 'Michael Davis', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password3'), 2),'cus3@gmail.com', '789 Oak St, Villageton', '1995-02-10','2023-10-15', 'Available'),
('0123456786', 'Emily Wilson', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password4'), 2),'cus4@gmail.com', '101 Maple St, Hamletown', '1988-11-30','2023-01-20', 'Available'),
('0123456785', 'Daniel Lee', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password5'), 2),'cus5@gmail.com', '222 Pine St, Forestville', '1992-03-25','2023-11-04', 'Available'),
('0123456784', 'Olivia Brown', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password6'), 2),'cus6@gmail.com', '333 Cedar St, Hillside', '1993-07-12','2023-02-19','Blocked'),
('0123456783', 'James Taylor', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password7'), 2),'cus7@gmail.com', '444 Birch St, Mountainview', '1991-08-18','2023-03-01', 'Available'),
('0123456782', 'Ava Martinez', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password8'), 2),'cus8@gmail.com', '555 Redwood St, Lakeside', '1987-06-08','2023-05-05', 'Blocked'),
('0123456781', 'Ethan Harris', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password9'), 2),'cus9@gmail.com', '666 Fir St, Riverside', '1994-04-05','2023-10-19', 'Deleted'),
('0123456780', 'Sophia Clark', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password10'), 2),'cus10@gmail.com', '777 Cedar St, Parkville', '1996-01-03','2023-09-25', 'Deleted');



---- Insert data into Employee table with 10-digit phone numbers starting with 0

INSERT INTO Employee VALUES
('0987654321', 'David Anderson', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password1'), 2), 'khanhnguyennguyen2003@gmail.com', '1234 Employee St, Stafftown', '1980-04-22','2022-09-25', 'Available'),
('0987654322', 'Jennifer White', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password2'), 2),'emp1@gmail.com', '5678 Worker St, Laborville', '1982-08-15','2022-09-25', 'Available'),
('0987654323', 'Robert Martin', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password3'), 2),'emp2@gmail.com', '9876 Staff St, Employeeville', '1975-11-10','2022-09-25', 'Available'),
('0987654324', 'Mary Wilson', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password4'), 2),'emp3@gmail.com', '5420 Service St, Serviceton', '1983-02-28','2022-09-25', 'Available'),
('0987654325', 'Richard Brown', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password5'), 2),'emp4@gmail.com', '8765 Crew St, Workville', '1978-07-07','2022-09-25', 'Deleted');


---- Insert data into Manager table
INSERT INTO Manager (username, password) VALUES
('admin', CONVERT(VARCHAR(32), HASHBYTES('MD5', 'password'), 2)),
('1', CONVERT(VARCHAR(32), HASHBYTES('MD5', '1'), 2));


-- Tạo 10 đơn đặt hàng
delete from [order]
INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000001','0123456789', '0987654321', '2023-10-18', 'Delivery', 'Completed','COD', N'Deliver to the back entrance', 4.22);
	INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000002','0123456789', '0987654322', '2023-10-18', 'Takeout', 'Completed','COD', N'Dont include any plastic cutlery', 7.98);
	INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000003', '0123456788', '0987654323', '2023-10-19', 'Delivery', 'Completed','COD', N'Please add extra ketchup packets', 5.97)
	INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000004','0123456788', '0987654321', '2023-10-19', 'Takeout', 'Cancelled','COD', N'Deliver after 7 pm', 2.17)
	INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000005','0123456788', '0987654324', '2023-10-19', 'Takeout', 'Rejected','COD', N'', 2.88)

		INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000006','0123456787', '0987654325', '2023-10-19', 'Delivery', 'Completed','COD', N'', 5.96)

	INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000007','0123456787', '0987654322', '2023-10-19', 'Takeout', 'Completed','COD', N'', 15.00)
		INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000008','0123456787', '0987654323', '2023-10-20', 'Takeout', 'Rejected','COD', N'Deliver after 5 pm', 2.98)

		INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000009','0123456786', '0987654321', '2023-10-20', 'Takeout', 'Completed','Banking', N'', 2.61)

		INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000010','0123456785', '0987654325', '2023-10-20', 'Delivery', 'Completed','COD', N'', 0.98)

		INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000011','0123456785', '0987654324', '2023-10-20', 'Delivery', 'Completed','Banking', N'Nhanh nhanh', 0.48)
		INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000012','0123456784', '0987654323', '2023-10-20', 'Takeout', 'Completed','COD', N'', 7.96)
		INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000013','0123456783', '0987654321', '2023-10-20', 'Takeout', 'Waiting','COD', N'Dont include any plastic cutlery', 2.45)
		INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000014','0123456782', '0987654324', '2023-10-20', 'Delivery', 'Waiting','Banking', N'', 7.96)
		INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000015','0123456780', '0987654322', '2023-10-20', 'Delivery', 'Preparing','Banking', N'Dont include any plastic cutlery', 1.2)
		INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000016','0123456780', '0987654325', '2023-10-20', 'Takeout', 'Completed','COD', N'', 6.97)
INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000017','0123456780', '0987654321', '2023-10-20', 'Takeout', 'Preparing','COD', N'Dont include any plastic cutlery', 2.88 )


-- Tạo 10 chi tiết đơn đặt hàng tương ứng
delete from OrderDetail
INSERT INTO OrderDetail (ord_id, foo_id, quantity, price)
VALUES
    ('ORD0000001', 'FOOD001', 1, 0.24),
	('ORD0000001', 'FOOD002', 2, 1.99),
    ('ORD0000002', 'FOOD005', 2, 3.99),
    ('ORD0000003', 'FOOD007', 3, 1.99),
    ('ORD0000004', 'FOOD009', 1, 2.17),
    ('ORD0000005', 'FOOD010', 3, 0.96),
	('ORD0000007', 'FOOD003', 2, 2.37),
	('ORD0000007', 'FOOD004', 3, 3.42),
	('ORD0000006', 'FOOD006', 4, 1.49),
	('ORD0000008', 'FOOD006', 2, 1.49),
	('ORD0000009', 'FOOD008', 3, 0.87),
	('ORD0000010', 'FOOD013', 2, 0.49),
	('ORD0000011', 'FOOD012', 1, 0.48),
	('ORD0000012', 'FOOD016', 2, 0.73),
	('ORD0000012', 'FOOD015', 3, 0.49),
	('ORD0000012', 'FOOD002', 2, 1.99),
	('ORD0000013', 'FOOD014', 5, 0.49),
	('ORD0000014', 'FOOD007', 4, 1.99),
	('ORD0000015', 'FOOD001', 5, 0.24),
	('ORD0000016', 'FOOD002', 3, 1.99),
	('ORD0000017', 'FOOD010', 3, 0.96);