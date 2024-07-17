-- School System contains the following tables : ( Teachers, TeacherDetails, Courses, Students ).
CREATE TABLE Teachers (
	TeacherID INT PRIMARY KEY,
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,
	Email VARCHAR(100),
	PhoneNumber INT
);

GO

CREATE TABLE TeacherDetails (
	TeacherDetailsID INT PRIMARY KEY,
	TeacherID INT,
	City VARCHAR(100) NOT NULL,
	DateOfBirth DATE NOT NULL,
	YearsOfExperience INT ,
	Field VARCHAR(100),
	FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)

);

GO

CREATE TABLE Courses (
	CourseID INT PRIMARY KEY,
	CoursetName VARCHAR(100) NOT NULL,
	CourseDescription VARCHAR(100) NOT NULL,
	TeacherID INT,
	FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

GO

CREATE TABLE Students (
	StudentID INT PRIMARY KEY,
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,
	Email VARCHAR(100),
	PhoneNumber INT,
	EnrollmentDate DATE NOT NULL
);

GO

CREATE TABLE StudentCourses (
	StudentID INT,
	CourseID INT,
	PRIMARY KEY (StudentID, CourseID),
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

GO

INSERT INTO Teachers (TeacherID, FirstName, LastName, Email, PhoneNumber)
VALUES 
	(1, 'Sanaa', 'Mheidat', 'Sanaa@gmail.com', 123456789),
	(2, 'Walaa', 'Odat', 'Walaa@gmail.com', 122546789);

INSERT INTO TeacherDetails (TeacherDetailsID, TeacherID, City, DateOfBirth, YearsOfExperience, Field)
VALUES 
	(1 ,1, 'Irbid', '1985-01-01', 2, 'Math'),
	(2 ,2, 'Ajloun', '1980-01-01', 5, 'Science');

INSERT INTO Courses (CourseID, CoursetName, CourseDescription, TeacherID)
VALUES 
	(1, 'Algebra', 'Algebra Concept', 1),
	(2, 'Science', 'Science Concept', 2);


INSERT INTO Students(StudentID, FirstName, LastName, Email, EnrollmentDate)
VALUES 
	(1, 'Sarah', 'Shorman', 'Sarah@gmail.com', '2014-01-01'),
	(2, 'Noor', 'AlAli', 'Noor@gmail.com', '2014-08-01');

GO

INSERT INTO StudentCourses(StudentID,CourseID)
VALUES
	(1,1),
	(2,2);

GO