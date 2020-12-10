DROP TABLE IF EXISTS Store
CREATE TABLE Store (
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(99) NOT NULL,
)

DROP TABLE IF EXISTS Customer
CREATE TABLE Customer (
	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(99) NOT NULL,
	LastName NVARCHAR(99) NOT NULL,
	Phone NVARCHAR(99)
)

DROP TABLE IF EXISTS Product
CREATE TABLE Product (
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(99) NOT NULL,
	Price MONEY NOT NULL CHECK (Price > 0),
)

DROP TABLE IF EXISTS Inventory
CREATE TABLE Inventory (
	LocationId INT NOT NULL FOREIGN KEY REFERENCES Store (Id),
	ProductId INT NOT NULL FOREIGN KEY REFERENCES Product (Id),
	Stock INT NOT NULL CHECK (Stock >= 0),
	PRIMARY KEY (LocationId, ProductId)
)

DROP TABLE IF EXISTS OrderDetails
CREATE TABLE OrderDetails (
	Id INT PRIMARY KEY IDENTITY,
	CustomerId INT NOT NULL FOREIGN KEY REFERENCES Customer (Id),
	LocationId INT NOT NULL FOREIGN KEY REFERENCES Store (Id),
	[Date] DATETIME NOT NULL,
	Total MONEY NOT NULL CHECK (Total > 0),

)

DROP TABLE IF EXISTS OrderProduct
CREATE TABLE OrderProduct (
	OrderId INT NOT NULL FOREIGN KEY REFERENCES OrderDetails (Id),
	ProductId INT NOT NULL FOREIGN KEY REFERENCES Product (Id),
	Quantity INT NOT NULL CHECK (Quantity > 0),
	PRIMARY KEY (OrderId, ProductId)
)


INSERT INTO Customer (FirstName, LastName, Phone) VALUES
	('Alex', 'Soto', '(619)730-8241'),
	('Yesenia', 'Cisneros', '(619)730-8241'),
	('Armando', 'Soto', '(619)547-2327');
	



INSERT INTO Product (Name, Price) VALUES
	('Toilet Paper', 3.00),
	('Apple', 1.00),
	('Play Station 5', 500.00),
	('Cheese Burger', 2.00),
	('Picture Frame', 4.00),
	('Makeup', 25.00),
	('Drink', 2.00),
	('Fries', 3.00),
	('Salad', 7.00),
	('Book', 6.00),
	('Computer', 600.00),
	('Desk Chair', 100.00),
	('Mirror', 50.00),
	('Pizza', 13.00);


INSERT INTO Store (Name) VALUES
	('Walmart'),
	('Staples'),
	('Fast Food Shop');



INSERT INTO Inventory (LocationId, ProductId, Stock) VALUES
	(1, 10, 30),
	(1, 11, 10),
	(1, 1, 100),
	(1, 13,20),
	(1, 2, 150),
	(1, 6, 40),
	(1, 5, 50),
	(2, 11, 50),
	(2, 12, 70),
	(2, 10, 200),
	(3, 4, 200),
	(3, 7, 300),
	(3, 8, 200),
	(3, 14, 100),
	(3, 9, 50)

INSERT INTO OrderDetails (CustomerId, LocationId, Date, Total) VALUES
	(1,1, CURRENT_TIMESTAMP, 627.00),
	(1,2, CURRENT_TIMESTAMP, 14.00);

INSERT INTO OrderProduct (OrderId, ProductId, Quantity) VALUES
	(1, 10, 2),
	(1, 11, 1),
	(1, 1, 5),
	(2, 4, 2),
	(2, 8, 2),
	(2, 7, 2);
	
SELECT * FROM Customer;
SELECT * FROM Store;
SELECT * FROM Product;
SELECT * FROM Inventory;
SELECT * FROM OrderDetails;
