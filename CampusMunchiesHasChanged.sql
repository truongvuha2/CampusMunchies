
--drop database CampusMunchies

--DECLARE @DatabaseName nvarchar(50)
--SET @DatabaseName = N'CampusMunchies'

--DECLARE @SQL varchar(max)

--SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
--FROM MASTER..SysProcesses
--WHERE DBId = DB_ID(@DatabaseName) AND SPId <> @@SPId

----SELECT @SQL 
--EXEC(@SQL)

create database CampusMunchies

go
use CampusMunchies

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
	cus_password varchar(20) not null,
	cus_address nvarchar(50) not null,
	cus_birthday date not null,
	cus_create date not null,
	cus_status varchar(10) not null,
	primary key (cus_phone)
)

create table Employee (
	emp_phone varchar(10),
	emp_name nvarchar(50) not null,
	emp_password varchar(20) not null,
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
	ord_pay varchar(6) not null,
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
	password varchar(20) not null,
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
VALUES ('CAT001', N'Appetizers','Available'),
       ('CAT002', N'Soups','Available'),
       ('CAT003', N'Salads','Available'),
       ('CAT004', N'Entrees','Available'),
       ('CAT005', N'Desserts','Available'),
	   ('CAT006', N'Combo','Available');

---- Insert data into Food table
INSERT INTO Food (foo_id, cat_id, foo_name, foo_price, foo_sale, foo_description, foo_status, foo_img)
VALUES
	('FOOD001', 'CAT001', N'Salad', 7.99, 0.00, N'Fresh and healthy salad with a variety of ingredients', 'Available', 'https://i.ibb.co/4ST0XCZ/Salad.png'),

    ('FOOD002', 'CAT003', N'Kebab', 8.99, 0.00, N'Grilled kebab served with pita bread and sauce', 'Available', 'https://i.ibb.co/MscZLfn/Kebab.png'),

    ('FOOD003', 'CAT001', N'Italian Pasta', 9.99, 0.00, N'Delicious Italian pasta with your choice of sauce', 'Available', 'https://i.ibb.co/zxnNz2h/Pasta.png'),

    ('FOOD004', 'CAT002', N'Fried Chicken Wings', 10.99, 0.00, N'Crispy fried chicken wings with your choice of sauce', 'Available', 'https://i.ibb.co/jzLLJkq/Chicken-Wings.png'),

    ('FOOD005', 'CAT002', N'Fried Chicken Drumsticks', 10.99, 0.00, N'Crispy fried chicken drumsticks with your choice of sauce', 'Available', 'https://i.ibb.co/cXwkt1L/Chicken-Drumstick.png'),

    ('FOOD006', 'CAT003', N'Egg Banh Mi', 5.99, 0.00, N'Delicious egg sandwich with fresh ingredients', 'Available', 'https://i.ibb.co/xDnxGBX/Egg-Banh-Mi.png'),

    ('FOOD007', 'CAT003', N'Meat Banh Mi', 6.99, 0.00, N'Hearty meat sandwich with a variety of fillings', 'Available', 'https://i.ibb.co/zNtW5wN/Meat-Banh-Mi.png'),

    ('FOOD008', 'CAT002', N'French Fries', 3.99, 0.00, N'Golden and crispy french fries with ketchup', 'Available', 'https://i.ibb.co/yyvfzsN/French-Fries.png'),

    ('FOOD009', 'CAT003', N'Hamburger', 7.49, 0.00, N'Delicious hamburger with your choice of toppings', 'Available', 'https://i.ibb.co/Nm3BsQt/Hamburger.png'),

	('FOOD010', 'CAT003', N'Xoi Man', 4.99, 0.00, N'Sticky rice with a variety of toppings', 'Available', 'https://i.ibb.co/ydX8vbb/XoiMan.png'),

    ('FOOD011', 'CAT003', N'Toco', 3.49, 0.00, N'Toco Toco', 'Available', 'https://i.ibb.co/kKxPFRy/Toco.png'),

    ('FOOD012', 'CAT001', N'Pepsi', 1.99, 0.00, N'Classic Pepsi soda', 'Available', 'https://i.ibb.co/8r2cnDh/Pepsi.png'),

    ('FOOD013', 'CAT001', N'Coca-Cola', 1.99, 0.00, N'Classic Coca-Cola soda', 'Available', 'https://i.ibb.co/G7jBD5M/CocaCola.png'),

    ('FOOD014', 'CAT001', N'7UP', 1.99, 0.00, N'Refreshing 7UP soda', 'Available', 'https://i.ibb.co/sVSMXJs/7up.png'),

    ('FOOD015', 'CAT001', N'Fanta', 1.99, 0.00, N'Fruity Fanta soda', 'Available', 'https://i.ibb.co/9wxKxXW/Fanta.png'),

    ('FOOD016', 'CAT001', N'Milo', 2.49, 0.00, N'Delicious Milo chocolate drink', 'Available', 'https://i.ibb.co/m8d7Qft/Milo.png');


INSERT INTO Customer  VALUES
('0123456789', 'John Smith', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password'), 2), '123 Main St, Cityville', '1990-05-15','2023-10-15','Available'),
('0123456788', 'Sarah Johnson', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password2'), 2), '456 Elm St, Townsville', '1985-09-20','2023-9-11', 'Available'),
('0123456787', 'Michael Davis', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password3'), 2), '789 Oak St, Villageton', '1995-02-10','2023-10-15', 'Available'),
('0123456786', 'Emily Wilson', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password4'), 2), '101 Maple St, Hamletown', '1988-11-30','2023-01-20', 'Available'),
('0123456785', 'Daniel Lee', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password5'), 2), '222 Pine St, Forestville', '1992-03-25','2023-09-23', 'Available'),
('0123456784', 'Olivia Brown', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password6'), 2), '333 Cedar St, Hillside', '1993-07-12','2023-02-19','Available'),
('0123456783', 'James Taylor', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password7'), 2), '444 Birch St, Mountainview', '1991-08-18','2023-03-01', 'Available'),
('0123456782', 'Ava Martinez', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password8'), 2), '555 Redwood St, Lakeside', '1987-06-08','2023-05-05', 'Available'),
('0123456781', 'Ethan Harris', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password9'), 2), '666 Fir St, Riverside', '1994-04-05','2023-10-19', 'Available'),
('0123456780', 'Sophia Clark', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password10'), 2), '777 Cedar St, Parkville', '1996-01-03','2023-09-25', 'Available');



---- Insert data into Employee table with 10-digit phone numbers starting with 0

INSERT INTO Employee VALUES
('0123456789', 'David Anderson', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password1'), 2), '1234 Employee St, Stafftown', '1980-04-22','2022-09-25', 'Available'),
('0123456788', 'Jennifer White', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password2'), 2), '5678 Worker St, Laborville', '1982-08-15','2022-09-25', 'Available'),
('0123456787', 'Robert Martin', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password3'), 2), '9876 Staff St, Employeeville', '1975-11-10','2022-09-25', 'Available'),
('0123456786', 'Mary Wilson', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password4'), 2), '5420 Service St, Serviceton', '1983-02-28','2022-09-25', 'Available'),
('0123456785', 'Richard Brown', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password5'), 2), '8765 Crew St, Workville', '1978-07-07','2022-09-25', 'Available'),
('0', '', CONVERT(VARCHAR(20), HASHBYTES('MD5', '?'), 2), '', '1900-01-01','2000-01-01', 'Banned');


---- Insert data into Manager table
INSERT INTO Manager (username, password) VALUES
('admin', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password'), 2)),
('1', CONVERT(VARCHAR(20), HASHBYTES('MD5', '1'), 2));


-- Tạo 10 đơn đặt hàng
delete from [order]
INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000001','0123456788', '0123456787', '2023-10-11', 'Delivery', 'Preparing','COD', N'Deliver to the back entrance', 33.96);
	INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000002','0123456787', '0123456789', '2023-10-12', 'Takeout', 'Completed','COD', N'Dont include any plastic cutlery', 10.99);
	INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000003', '0123456786', '0123456785', '2023-10-13', 'Delivery', 'Completed','COD', N'Please add extra ketchup packets', 6.99)
	INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000004','0123456785', '0123456786', '2023-10-14', 'Takeout', 'Cancelled','COD', N'Deliver after 7 pm', 22.47)
	INSERT INTO [Order] (ord_id,cus_phone, emp_phone, ord_date, ord_type, ord_status, ord_pay, ord_note, ord_total)
VALUES
    ('ORD0000005','0123456784', '0', '2023-10-14', 'Takeout', 'Waiting','COD', N'', 9.98)


-- Tạo 10 chi tiết đơn đặt hàng tương ứng
delete from OrderDetail
INSERT INTO OrderDetail (ord_id, foo_id, quantity, price)
VALUES
    ('ORD0000001', 'FOOD001', 2, 15.98),
	('ORD0000001', 'FOOD002', 2, 17.98),
    ('ORD0000002', 'FOOD005', 1, 10.99),
    ('ORD0000003', 'FOOD007', 1, 6.99),
    ('ORD0000004', 'FOOD009', 3, 22.47),
    ('ORD0000005', 'FOOD010', 2, 9.98);

INSERT INTO Cart values ('0123456788','FOOD001',3)
select * from [Order] o join Customer c on c.cus_phone=o.cus_phone where o.emp_phone='0123456787';
select COUNT(o.ord_id) from Customer c 
join [Order] o on c.cus_phone = o.cus_phone and o.ord_status = 'Cancelled'
where c.cus_phone='0123456785'
group by c.cus_phone
