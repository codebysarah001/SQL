CREATE DATABASE Library;
GO

USE Library;
GO

CREATE TABLE Books(
	BookId INT PRIMARY KEY,
	Title VARCHAR(100) NOT NULL,
	AuthorID INT NOT NULL,
	PublishedYear INT ,
	CopiesAvailable INT ,
	BookCategory VARCHAR(100) NOT NULL,
);

CREATE TABLE Authors(
	AuthorID INT PRIMARY KEY,
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,
	BirthYear INT 
);

INSERT INTO Books VALUES 
(1,'Introduction to SQL',1,2010,5,'Programming'),
(2,'Advanced SQL Techniques',2,2012,8,'Programming'),
(3,'Learning Python',3,2015,7,'Programming'),
(4,'Mastering C#',4,2018,4,'Programming');

INSERT INTO Authors VALUES 
(1,'John','Doe',1975),
(2,'Jane','Smith',1975),
(3,'Alice','Brown',1975),
(4,'Bob','Johnason',1975);

--Query to retrieve and print details of all books along with their respective authors

SELECT * FROM Books
GO

--Query to show the book with the highest and lowest number of available copies 

SELECT MIN (CopiesAvailable)
FROM Books;

SELECT MAX (CopiesAvailable)
FROM Books;

--Query to calculate and display the average publication year of books in the library

SELECT AVG (PublishedYear)
FROM Books;


--Query to count and print the total number of books in the library 

SELECT SUM (CopiesAvailable)
FROM Books;

SELECT COUNT (*)
FROM Books;

-- i just need make Books Table with out any record

DELETE FROM Books
WHERE Title = 'Introduction to SQL';

-- Delete Authors Table 

DROP TABLE Authors; 