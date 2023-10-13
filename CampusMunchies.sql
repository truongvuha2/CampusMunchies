--drop database CampusMunchies

create database CampusMunchies
go
use CampusMunchies

create table Category(
	cat_id varchar(10),
	cat_name nvarchar(20) not null,
	primary key (cat_id)
)

create table Food(
	foo_id varchar(10),
	cat_id varchar(10) not null,
	foo_name nvarchar(50) not null,
	foo_price decimal(10,2)  not null,
	foo_sale decimal(10,2)  not null,
	foo_desription nvarchar (200) not null,
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
	cus_cancel_count int not null,
	primary key (cus_phone)
)

create table Employee (
	emp_phone varchar(10),
	emp_name nvarchar(50) not null,
	emp_password varchar(20) not null,
	emp_address nvarchar(50) not null,
	emp_birthday date not null,
	primary key (emp_phone)
)



create table [Order] (
	ord_id varchar(10),
	cus_phone varchar(10) not null,
	emp_phone varchar(10) not null,
	ord_date date not null,
	ord_type varchar(10) not null,
	ord_status varchar(10) not null,
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

---- Insert data into Category table
--INSERT INTO Category (cate_id, cate_name) VALUES
--('C1', 'Appetizers'),
--('C2', 'Main Courses'),
--('C3', 'Desserts'),
--('C4', 'Beverages');

---- Insert data into Food table
--INSERT INTO Food VALUES
--('F1', 'Spring Rolls', 5.99, 0, 'Available', 'C1', 'img'),
--('F2', 'Chicken Wings', 8.99, 0, 'Available', 'C1', 'img'),
--('F3', 'Spaghetti Bolognese', 12.99, 0, 'Available', 'C2', 'img'),
--('F4', 'Margherita Pizza', 10.99, 0, 'Available', 'C2', 'img'),
--('F5', 'Chocolate Cake', 6.99, 0, 'Available', 'C3', 'img'),
--('F6', 'Vanilla Ice Cream', 4.99, 0, 'Available', 'C3', 'img'),
--('F7', 'Coca-Cola', 1.99, 0, 'Available', 'C4', 'img'),
--('F8', 'Iced Tea', 1.99, 0, 'Available', 'C4', 'img'),
--('F9', 'Caesar Salad', 7.99, 0, 'Available', 'C1', 'img'),
--('F10', 'Grilled Salmon', 14.99, 0, 'Available', 'C2', 'img'),
--('F11', 'Tiramisu', 8.99, 0, 'Available', 'C3', 'img'),
--('F12', 'Orange Juice', 2.99, 0, 'Available', 'C4', 'img'),
--('F13', 'Mozzarella Sticks', 6.99, 0, 'Available', 'C1', 'img'),
--('F14', 'Beef Tacos', 9.99, 0, 'Available', 'C2', 'img'),
--('F15', 'Fruit Salad', 5.99, 0, 'Available', 'C3', 'img'),
--('F16', 'Lemonade', 1.99, 0, 'Available', 'C4', 'img'),
--('F17', 'Onion Rings', 4.99, 0, 'Available', 'C1', 'img'),
--('F18', 'Shrimp Alfredo', 13.99, 0, 'Available', 'C2', 'img'),
--('F19', 'Red Velvet Cake', 7.99, 0, 'Available', 'C3', 'img'),
--('F20', 'Coffee', 2.49, 0, 'Available', 'C4', 'img'),
--('F21', 'Cheeseburger', 8.99, 0, 'Available', 'C2', 'img'),
--('F22', 'Fried Chicken', 10.99, 0, 'Available', 'C2', 'img'),
--('F23', 'Pineapple Pizza', 11.99, 0, 'Available', 'C2', 'img'),
--('F24', 'Green Tea', 1.99, 0, 'Available', 'C4', 'img'),
--('F25', 'Cheesecake', 6.99, 0, 'Available', 'C3', 'img');

--INSERT INTO Customer (cus_phone, cus_name, cus_password, cus_address, cus_birthday, cus_cancel_count) VALUES
--('0123456789', 'John Smith', 'password1', '123 Main St, Cityville', '1990-05-15', 0),
--('0123456788', 'Sarah Johnson', 'password2', '456 Elm St, Townsville', '1985-09-20', 2),
--('0123456787', 'Michael Davis', 'password3', '789 Oak St, Villageton', '1995-02-10', 1),
--('0123456786', 'Emily Wilson', 'password4', '101 Maple St, Hamletown', '1988-11-30', 0),
--('0123456785', 'Daniel Lee', 'password5', '222 Pine St, Forestville', '1992-03-25', 3),
--('0123456784', 'Olivia Brown', 'password6', '333 Cedar St, Hillside', '1993-07-12', 0),
--('0123456783', 'James Taylor', 'password7', '444 Birch St, Mountainview', '1991-08-18', 2),
--('0123456782', 'Ava Martinez', 'password8', '555 Redwood St, Lakeside', '1987-06-08', 0),
--('0123456781', 'Ethan Harris', 'password9', '666 Fir St, Riverside', '1994-04-05', 1),
--('0123456780', 'Sophia Clark', 'password10', '777 Cedar St, Parkville', '1996-01-03', 0);

---- Insert data into Employee table with 10-digit phone numbers starting with 0
--INSERT INTO Employee (emp_phone, emp_name, emp_password, emp_address, emp_birthday) VALUES
--('0123456789', 'David Anderson', 'password1', '1234 Employee St, Stafftown', '1980-04-22'),
--('0123456788', 'Jennifer White', 'password2', '5678 Worker St, Laborville', '1982-08-15'),
--('0123456787', 'Robert Martin', 'password3', '9876 Staff St, Employeeville', '1975-11-10'),
--('0123456786', 'Mary Wilson', 'password4', '5432 Service St, Serviceton', '1983-02-28'),
--('0123456785', 'Richard Brown', 'password5', '8765 Crew St, Workville', '1978-07-07');

---- Insert data into Manager table
INSERT INTO Manager (username, password) VALUES
('admin', 'admin');

---- Insert data into Order table
--INSERT INTO [Order] (ord_id, ord_date, ord_type, ord_status, ord_note, ord_total, cus_phone, emp_phone) VALUES
--('ORD1', '2023-10-08', 'Dine-In', 'Pending', 'Table 5', 28.97, '0123456789', '0123456789'),
--('ORD2', '2023-10-08', 'Takeout', 'Complete', 'N/A', 15.98, '0123456788', '0123456788'),
--('ORD3', '2023-10-08', 'Delivery', 'Pending', 'Apartment 3B', 42.50, '0123456787', '0123456787'),
--('ORD4', '2023-10-09', 'Dine-In', 'Complete', 'Table 3', 36.75, '0123456786', '0123456786'),
--('ORD5', '2023-10-09', 'Takeout', 'Pending', 'N/A', 19.99, '0123456785', '0123456785'),
--('ORD6', '2023-10-09', 'Delivery', 'Complete', 'House 12', 50.25, '0123456784', '0123456784'),
--('ORD7', '2023-10-10', 'Dine-In', 'Pending', 'Table 1', 54.00, '0123456783', '0123456783'),
--('ORD8', '2023-10-10', 'Takeout', 'Complete', 'N/A', 29.75, '0123456782', '0123456782'),
--('ORD9', '2023-10-10', 'Delivery', 'Pending', 'Apartment 5A', 65.80, '0123456781', '0123456781'),
--('ORD10', '2023-10-11', 'Dine-In', 'Complete', 'Table 2', 47.25, '0123456780', '0123456780');

