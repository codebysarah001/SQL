CREATE DATABASE library_System ;
GO

-- Books , Authors , Sections , Categories , Employees , Users

USE library_System

-- AUTHOR TABLE 
CREATE TABLE Authors (
	AuthorID INT PRIMARY KEY IDENTITY(1,1),
	AuthorName VARCHAR(50),
);

-- EMPLOYEE TABLE
CREATE TABLE Employees (
	EmplyeeName VARCHAR(50),
	EmployeeID INT PRIMARY KEY IDENTITY(1,1),
	Email VARCHAR(50),
	PhoneNumber VARCHAR(10)
);

-- CATEGORIES TABLE
CREATE TABLE Categories (
	CategoryName VARCHAR(50),
	CategoryID INT PRIMARY KEY IDENTITY(1,1),
);

-- SECTIONS TABLE
CREATE TABLE Sections (
	SectionID INT PRIMARY KEY IDENTITY(1,1),
	SectionName VARCHAR(50),
	EmployeeID INT,
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),

);

-- BOOKS TABLE
CREATE TABLE Books (
	BookID INT PRIMARY KEY IDENTITY(1,1),
	BookName VARCHAR(50),
	AuthorID INT,
    CategoryID INT,
    SectionID INT,
	FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
	FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
	FOREIGN KEY (SectionID) REFERENCES Sections(SectionID)

);

-- USERS TABLE
CREATE TABLE Users (
	UserName VARCHAR(50),
	UserID INT PRIMARY KEY IDENTITY(1,1),
	Email VARCHAR(50),
	PhoneNumber VARCHAR(10),
);

-- BORROW JUNCTION TABLE
CREATE TABLE BORROW(
	BorrowID INT PRIMARY KEY IDENTITY(1,1),
	BookID INT,
	UserID INT,
	BorrowDate DATE,
	ReturnDate DATE,
	FOREIGN KEY (BookID) REFERENCES Books(BookID),
	FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Authors 
INSERT INTO Authors (AuthorName)
VALUES 
	('George Orwell'),
	('J.K. Rowling'),
	('Jane Austen'),
	('Mark Twain'),
	('Agatha Christie');

-- Employee 
INSERT INTO Employees (EmplyeeName, Email, PhoneNumber)
VALUES
	('Alice Smith', 'alice.smith@example.com', '5551234'),
	('Bob Brown', 'bob.brown@example.com', '5555678'),
	('Charlie Davis', 'charlie.davis@example.com', '5558765'),
	('David Evans', 'david.evans@example.com', '5554321'),
	('Eve Foster', 'eve.foster@example.com', '5556789');

-- Categories 
INSERT INTO Categories (CategoryName)
VALUES 
	('Novel'),
	('Fantasy'),
	('Science Fiction'),
	('Mystery'),
	('Romance');

-- Section 
INSERT INTO Sections (SectionName, EmployeeID)
VALUES 
	('Fiction', 1),
	('Non-Fiction', 2),
	('Science', 3),
	('History', 4),
	('Biography', 5);

-- Books 
INSERT INTO Books (BookName, AuthorID, CategoryID, SectionID)
VALUES 
	('1984', 1, 1, 1),
	('Harry Potter and the Sorcerer Stone', 2, 2, 1),
	('Pride and Prejudice', 2, 5, 1),
	('The Adventures of Tom Sawyer', 1, 1, 1),
	('Murder on the Orient Express', 5, 4, 1);

-- Users 
INSERT INTO Users (UserName, Email, PhoneNumber)
VALUES 
	('John Doe', 'john.doe@example.com', '5551234'),
	('Jane Roe', 'jane.roe@example.com', '5555678'),
	('Jim Beam', 'jim.beam@example.com', '5558765'),
	('Jill Valentine', 'jill.valentine@example.com', '5554321'),
	('Jack Sparrow', 'jack.sparrow@example.com', '5556789');

-- Borrow 
INSERT INTO Borrow (BookID, UserID, BorrowDate, ReturnDate)
VALUES
	(1, 1, '2024-01-15', '2024-02-15'),
	(2, 2, '2024-01-20', '2024-02-20'),
	(3, 3, '2024-01-25', '2024-02-25'),
	(4, 4, '2024-02-01', '2024-03-01'),
	(5, 5, '2024-02-05', '2024-03-05');

-- SHOW ALL THE TABLES 

SELECT * FROM Authors;
SELECT * FROM Employees;
SELECT * FROM Categories;
SELECT * FROM Sections;
SELECT * FROM Books;
SELECT * FROM Users;
SELECT * FROM Borrow;


------------------------------One To Many----------------------------------------------

-- INNER JOIN

SELECT Authors.AuthorID, Authors.AuthorName, Books.BookID, Books.BookName
FROM Authors
INNER JOIN Books ON Authors.AuthorID = Books.AuthorID;


-- LEFT JOIN

SELECT Authors.AuthorID, Authors.AuthorName, Books.BookID, Books.BookName
FROM Authors
LEFT JOIN Books ON Authors.AuthorID = Books.AuthorID;

-- RIGHT JOIN

SELECT Authors.AuthorID, Authors.AuthorName, Books.BookID, Books.BookName
FROM Authors
RIGHT JOIN Books ON Authors.AuthorID = Books.AuthorID;

-- FULL JOIN

SELECT Authors.AuthorID, Authors.AuthorName, Books.BookID, Books.BookName
FROM Authors
FULL JOIN Books ON Authors.AuthorID = Books.AuthorID;


------------------------------Many To Many----------------------------------------------

-- Inner Join

SELECT Users.UserID, Users.UserName, Books.BookID, Books.BookName, Borrow.BorrowDate, Borrow.ReturnDate
FROM Users
INNER JOIN Borrow ON Users.UserID = Borrow.UserID
INNER JOIN Books ON Borrow.BookID = Books.BookID;

-- Left Join

SELECT Users.UserID, Users.UserName, Books.BookID, Books.BookName, Borrow.BorrowDate, Borrow.ReturnDate
FROM Users
LEFT JOIN Borrow ON Users.UserID = Borrow.UserID
LEFT JOIN Books ON Borrow.BookID = Books.BookID;

-- Right Join

SELECT Users.UserID, Users.UserName, Books.BookID, Books.BookName, Borrow.BorrowDate, Borrow.ReturnDate
FROM Users
RIGHT JOIN Borrow ON Users.UserID = Borrow.UserID
RIGHT JOIN Books ON Borrow.BookID = Books.BookID;

-- Full Join

SELECT Users.UserID, Users.UserName, Books.BookID, Books.BookName, Borrow.BorrowDate, Borrow.ReturnDate
FROM Users
FULL JOIN Borrow ON Users.UserID = Borrow.UserID
FULL JOIN Books ON Borrow.BookID = Books.BookID;
