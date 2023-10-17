--drop database CampusMunchies

drop database CampusMunchies
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
	cus_cancel_count int not null,
	primary key (cus_phone)
)

create table Employee (
	emp_phone varchar(10),
	emp_name nvarchar(50) not null,
	emp_password varchar(20) not null,
	emp_address nvarchar(50) not null,
	emp_birthday date not null,
	emp_create date NOT NULL,
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


-- Insert data into Category table
INSERT INTO Category (cat_id, cat_name)
VALUES ('CAT001', N'Appetizers'),
       ('CAT002', N'Soups'),
       ('CAT003', N'Salads'),
       ('CAT004', N'Entrees'),
       ('CAT005', N'Desserts');

---- Insert data into Food table
INSERT INTO Food (foo_id, cat_id, foo_name, foo_price, foo_sale, foo_description, foo_status, foo_img)
VALUES
    ('FOOD001', 'CAT001', N'Cheese Sticks', 6.99, 0.00, N'Fried cheese sticks with dipping sauce', 'Available', 'cheese-sticks.jpg'),
    ('FOOD002', 'CAT001', N'Chicken Wings', 8.99, 0.00, N'Spicy buffalo chicken wings', 'Available', 'chicken-wings.jpg'),
    ('FOOD003', 'CAT002', N'Tomato Soup', 5.99, 0.00, N'Classic tomato soup with croutons', 'Available', 'tomato-soup.jpg'),
    ('FOOD004', 'CAT002', N'Chicken Noodle Soup', 6.99, 0.00, N'Hearty chicken noodle soup', 'Available', 'chicken-noodle-soup.jpg'),
    ('FOOD005', 'CAT003', N'Garden Salad', 7.99, 0.00, N'Fresh garden salad with mixed greens', 'Available', 'garden-salad.jpg'),
    ('FOOD006', 'CAT003', N'Caesar Salad', 8.99, 0.00, N'Classic Caesar salad with dressing', 'Available', 'caesar-salad.jpg'),
    ('FOOD007', 'CAT004', N'Grilled Chicken', 12.99, 0.00, N'Grilled chicken breast with sides', 'Available', 'grilled-chicken.jpg'),
    ('FOOD008', 'CAT004', N'Steak', 18.99, 0.00, N'Juicy steak with your choice of sauce', 'Available', 'steak.jpg'),
    ('FOOD009', 'CAT005', N'Chocolate Cake', 6.99, 0.00, N'Delicious chocolate cake with frosting', 'Available', 'chocolate-cake.jpg'),
    ('FOOD010', 'CAT005', N'Apple Pie', 5.99, 0.00, N'Warm apple pie with a scoop of ice cream', 'Available', 'apple-pie.jpg'),
    ('FOOD011', 'CAT001', N'Mozzarella Sticks', 7.99, 0.00, N'Fried mozzarella sticks with marinara sauce', 'Available', 'mozzarella-sticks.jpg'),
    ('FOOD012', 'CAT001', N'Onion Rings', 6.99, 0.00, N'Crunchy onion rings with ketchup', 'Available', 'onion-rings.jpg'),
    ('FOOD013', 'CAT002', N'Clam Chowder', 8.99, 0.00, N'Creamy clam chowder with crackers', 'Available', 'clam-chowder.jpg'),
    ('FOOD014', 'CAT002', N'Vegetable Soup', 6.99, 0.00, N'Vegetable soup with fresh veggies', 'Available', 'vegetable-soup.jpg'),
    ('FOOD015', 'CAT003', N'Greek Salad', 9.99, 0.00, N'Healthy Greek salad with feta cheese', 'Available', 'greek-salad.jpg'),
    ('FOOD016', 'CAT003', N'Cobb Salad', 10.99, 0.00, N'Classic Cobb salad with bacon', 'Available', 'cobb-salad.jpg'),
    ('FOOD017', 'CAT004', N'Salmon', 14.99, 0.00, N'Pan-seared salmon with lemon butter', 'Available', 'salmon.jpg'),
    ('FOOD018', 'CAT004', N'Vegetarian Pasta', 11.99, 0.00, N'Vegetarian pasta with tomato sauce', 'Available', 'vegetarian-pasta.jpg'),
    ('FOOD019', 'CAT005', N'New York Cheesecake', 7.99, 0.00, N'Rich New York-style cheesecake', 'Available', 'cheesecake.jpg'),
    ('FOOD020', 'CAT005', N'Lemon Sorbet', 5.99, 0.00, N'Refreshing lemon sorbet dessert', 'Available', 'lemon-sorbet.jpg');

INSERT INTO Customer  VALUES
('0123456789', 'John Smith', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'matkhau'), 2), '123 Main St, Cityville', '1990-05-15','2023-10-15', 0),
('0123456788', 'Sarah Johnson', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password2'), 2), '456 Elm St, Townsville', '1985-09-20','2023-9-11', 2),
('0123456787', 'Michael Davis', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password3'), 2), '789 Oak St, Villageton', '1995-02-10','2023-10-15', 1),
('0123456786', 'Emily Wilson', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password4'), 2), '101 Maple St, Hamletown', '1988-11-30','2023-01-20', 0),
('0123456785', 'Daniel Lee', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password5'), 2), '222 Pine St, Forestville', '1992-03-25','2023-09-23', 3),
('0123456784', 'Olivia Brown', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password6'), 2), '333 Cedar St, Hillside', '1993-07-12','2023-02-19', 0),
('0123456783', 'James Taylor', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password7'), 2), '444 Birch St, Mountainview', '1991-08-18','2023-03-01', 2),
('0123456782', 'Ava Martinez', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password8'), 2), '555 Redwood St, Lakeside', '1987-06-08','2023-05-05', 0),
('0123456781', 'Ethan Harris', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password9'), 2), '666 Fir St, Riverside', '1994-04-05','2023-10-19', 1),
('0123456780', 'Sophia Clark', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password10'), 2), '777 Cedar St, Parkville', '1996-01-03','2023-09-25', 0);



---- Insert data into Employee table with 10-digit phone numbers starting with 0
INSERT INTO Employee VALUES
('0123456789', 'David Anderson', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password1'), 2), '1234 Employee St, Stafftown', '1980-04-22','2022-09-25'),
('0123456788', 'Jennifer White', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password2'), 2), '5678 Worker St, Laborville', '1982-08-15','2022-09-25'),
('0123456787', 'Robert Martin', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password3'), 2), '9876 Staff St, Employeeville', '1975-11-10','2022-09-25'),
('0123456786', 'Mary Wilson', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password4'), 2), '5420 Service St, Serviceton', '1983-02-28','2022-09-25'),
('0123456785', 'Richard Brown', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password5'), 2), '8765 Crew St, Workville', '1978-07-07','2022-09-25');


---- Insert data into Manager table
INSERT INTO Manager (username, password) VALUES
('admin', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password1'), 2)),
('admin1', CONVERT(VARCHAR(20), HASHBYTES('MD5', 'password1'), 2));

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

