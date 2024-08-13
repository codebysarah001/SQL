CREATE DATABASE School_Mang_Sys

CREATE TABLE Family_Info(
	Father_ID INT PRIMARY KEY IDENTITY(1,1),
	Father_Name VARCHAR(255),
	Father_Phone VARCHAR(255)
);

CREATE TABLE Courses (
	Course_ID INT PRIMARY KEY IDENTITY(1,1),
	Course_Name VARCHAR(255),
	Course_Description VARCHAR(255),
	Course_Resource VARCHAR(255)
);

CREATE TABLE Classes (
	Class_ID INT PRIMARY KEY IDENTITY(1,1),
	Class_Code VARCHAR(255),
	Room_Number VARCHAR(255),
	Schedule VARCHAR(255)
);

CREATE TABLE Student(
	Student_ID INT PRIMARY KEY IDENTITY(1,1),
	Father_ID INT,
	Class_ID INT,
	Student_Name VARCHAR(255),
	Date_Of_Birth VARCHAR(255),
	Address VARCHAR(255),
	FOREIGN KEY (Father_ID) REFERENCES Family_Info(Father_ID),
	FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID)
);

CREATE TABLE Student_Courses (
	Student_Course_ID INT PRIMARY KEY IDENTITY(1,1),
	Course_ID INT,
	Student_ID INT,
	FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
	FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

CREATE TABLE Assignments (
	Assignment_ID INT PRIMARY KEY IDENTITY(1,1),
	Assignment_Name VARCHAR(255),
	Assignement_Description VARCHAR(255),
	Due_Date VARCHAR(255),
	Status VARCHAR(255)
);

CREATE TABLE Student_Assignment (
	Student_Ass_ID INT PRIMARY KEY IDENTITY(1,1),
	Student_ID INT,
	Assignment_ID INT,
	FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
	FOREIGN KEY (Assignment_ID) REFERENCES Assignments(Assignment_ID)
);

CREATE TABLE Attendence(
	Attendence_ID INT PRIMARY KEY IDENTITY(1,1),
	Student_ID INT,
	Attendence_Date VARCHAR(255),
	Type_Of_Absence VARCHAR(255),
	FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);


-- Insert into Family_Info
INSERT INTO Family_Info (Father_Name, Father_Phone)
VALUES ('John Doe', '123-456-7890'),
       ('Michael Smith', '987-654-3210');

-- Insert into Courses
INSERT INTO Courses (Course_Name, Course_Description, Course_Resource)
VALUES ('Math', 'Basic Math Course', 'Book A'),
       ('Science', 'Basic Science Course', 'Book B');

-- Insert into Classes
INSERT INTO Classes (Class_Code, Room_Number, Schedule)
VALUES ('A1', 'Room 101', 'MWF 9-10 AM'),
       ('B2', 'Room 102', 'TTh 11-12 PM');

-- Insert into Student
INSERT INTO Student (Father_ID, Class_ID, Student_Name, Date_Of_Birth, Address)
VALUES (1, 1, 'Alice Doe', '2010-01-01', '123 Elm St'),
       (2, 2, 'Bob Smith', '2011-02-02', '456 Oak St');

-- Insert into Student_Courses
INSERT INTO Student_Courses (Course_ID, Student_ID)
VALUES (1, 1),
       (2, 2);

-- Insert into Assignments
INSERT INTO Assignments (Assignment_Name, Assignement_Description, Due_Date, Status)
VALUES ('SQL Assignment', 'Introduction to SQL', '2024-01-03', 'Submitted'),
       ('Math Homework', 'Chapter 1 Homework', '2024-01-05', 'Pending');

-- Insert into Student_Assignment
INSERT INTO Student_Assignment (Student_ID, Assignment_ID)
VALUES (1, 1),
       (2, 2);

-- Insert into Attendance
INSERT INTO Attendence (Student_ID, Attendence_Date, Type_Of_Absence)
VALUES (1, '2024-01-02', 'Leaving'),
       (2, '2024-01-03', 'Absent'),
       (1, '2024-01-04', 'Leaving'),
       (1, '2024-01-05', 'Absent'),
       (2, '2024-01-05', 'Leaving'),
       (1, '2024-01-05', 'Absent');


-- 1- Select students in a specific birth date ?

SELECT Student_Name FROM Student
WHERE Student.Date_Of_Birth = '2010-01-01';

-- 2- Select details of a course by its name ? 

SELECT * FROM Courses
WHERE Course_Name = 'Math';

-- 3- Add a new column 'Email' to the Students table ?

ALTER TABLE Student ADD Email VARCHAR(255);

-- 4- Insert a new student record ?

INSERT INTO Student (Father_ID, Class_ID, Student_Name, Date_Of_Birth, Address, Email)
VALUES (1, 1, 'Charlie Doe', '2012-03-03', '789 Pine St', 'charlie.doe@example.com');

-- 5- Select students who have relatives listed in the system ? 

SELECT Student_Name, Father_Name FROM Student
inner join Family_Info ON Student.Father_ID = Family_Info.Father_ID;

-- 6- Select students who are enrolled in a specific course (e.g : Math) ? 
SELECT Student_Name FROM Student
join Student_Courses ON Student.Student_ID = Student_Courses.Student_ID
join Courses ON Courses.Course_ID = Student_Courses.Course_ID
where Course_Name = 'Math';

-- 7- Select students who have submitted and passed a specific assignment (e.g : sql  Assignment ) ? 

SELECT Student_Name FROM Student
join Student_Assignment ON Student.Student_ID = Student_Assignment.Student_ID
join Assignments ON Assignments.Assignment_ID = Student_Assignment.Assignment_ID
where Assignment_Name = 'SQL Assignment' and Status = 'Submitted';

-- 8- i need the student who tooke an leaving between last sunday and the Thursday ? (e.g: between this date : 1/1/2024 - 5/1/2024 )

SELECT Student_Name FROM Student
join Attendence ON Student.Student_ID = Attendence.Student_ID
WHERE Attendence.Type_Of_Absence = 'Leaving' and Attendence.Attendence_Date between '1-1-2024' and '5-1-2024';

-- 9- i need the names of students who have absence mre than 4 ? ( not late of leaving )

SELECT Student_Name FROM Student
join Attendence ON Student.Student_ID = Attendence.Student_ID
WHERE Attendence.Type_Of_Absence = 'Absent'
GROUP BY Student_Name
HAVING COUNT (Attendence.Attendence_ID) > 4;