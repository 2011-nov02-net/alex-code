CREATE SCHEMA Store;
GO

CREATE TABLE Store.Products(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	Name NVARCHAR(100) NOT NULL CHECK(LEN(Name)>0),
	Price MONEY NOT NULL 
);

CREATE TABLE Store.Customers(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(100) NOT NULL CHECK(LEN(FirstName)>0),
	LastName NVARCHAR(100) NOT NULL CHECK(LEN(LastName)>0),
	CardNumber NVARCHAR(20) NOT NULL CHECK(LEN(CardNumber)>13)
);

CREATE TABLE Store.Orders(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	ProductID INT NOT NULL FOREIGN KEY REFERENCES Store.Products(Id) ON DELETE CASCADE,
	CutomerID INT NOT NULL FOREIGN KEY REFERENCES Store.Customers(Id) ON DELETE CASCADE
);

INSERT INTO Store.Products VALUES ('Computer', 600), ('Speaker',50), ('Chair', 30);
INSERT INTO Store.Customers VALUES ('Alex', 'Soto', '3746539012384956'), ('Yesenia', 'Cisneros', '3827395073548695'), ('Armando', 'Soto', '826353112877634');
INSERT INTO Store.Orders VALUES (1,1), (2,3), (3,2);

INSERT INTO Store.Products VALUES ('Iphone', 200);
INSERT INTO Store.Customers VALUES ('Tina', 'Smith', '2777632338198233');
INSERT INTO Store.Orders VALUES (4,4);

SELECT * FROM Store.Orders
WHERE CutomerID =	(SELECT Id FROM Store.Customers
					WHERE FirstName = 'Tina' AND LastName = 'Smith')

SELECT SUM(P.Price) as Total FROM Store.Orders as O INNER JOIN Store.Products as P ON O.ProductID = P.Id
WHERE P.Id =	(SELECT Id FROM Store.Products
				WHERE Name = 'Iphone')
					
