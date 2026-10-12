CREATE DATABASE final_project;
USE final_project;

#CREATING DEPARTMENTS TABLE
CREATE TABLE Departments (
DepartmentID INT NOT NULL PRIMARY KEY,
Department_Name VARCHAR(50) NOT NULL
);

#CREATING STUDENTS TABLE
CREATE TABLE Students (
StudentID INT NOT NULL PRIMARY KEY,
FirstName VARCHAR(150) NOT NULL,
LastName VARCHAR(150) NOT NULL,
Email VARCHAR(150) UNIQUE NOT NULL,
Birth_Date DATE NOT NULL,
Enrollment_Date DATE NOT NULL
);

#CREATING COURSES TABLE
CREATE TABLE Courses (
CourseID INT NOT NULL PRIMARY KEY,
CourseName VARCHAR(100) NOT NULL,
DepartmentID INT NOT NULL,
Credits INT NOT NULL,
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

#CREATING INSTRUCTORS TABLE
CREATE TABLE Instructors (
InstructorsID INT NOT NULL PRIMARY KEY,
First_Name VARCHAR(150) NOT NULL,
Last_Name VARCHAR(150) NOT NULL,
Email VARCHAR(150) NOT NULL UNIQUE,
DepartmentID INT NOT NULL,
Salary DECIMAL(10, 2),
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

#CREATING ENROLLMENTS TABLE
CREATE TABLE Enrollments (
EnrolLmentID INT NOT NULL PRIMARY KEY,
StudentID INT NOT NULL,
CourseID INT NOT NULL,
Enrollment_Date DATE NOT NULL,
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

#INSERTING THE DATA 
#1. DEPARTMENTS TABLE 
INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Mathematics');

#2. STUDENTS TABLE 
INSERT INTO Students VALUES
(1, 'Vaidik', 'Makwana', 'vaidik123@gmail.com', '2008-03-03', '2025-10-06'),
(2, 'Ved', 'Makwana', 'ved234@gmail.com', '2009-09-10', '2025-10-06');

#3. COURSES TABLE
INSERT INTO Courses VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4);

#4. INSTRUCTORS TABLE
INSERT INTO Instructors VALUES 
(1, 'Vinnet', 'Makwana', 'vineet.mak@gmail.com', 1, 75000.00),
(2, 'Karan', 'Katariya', 'karan.k@gmail.com', 2, 68000.00);

#5. ENROLLMENTS TABLE
INSERT INTO Enrollments VALUES
(1, 1, 101, '2025-10-06'),
(2, 2, 102, '2025-10-06');


## ALL QUERIES 

#1. PERFORM CRUD OPERATIONS ON ALL TABLES
-- CREATE (Demonstrated via INSERT above)
-- READ
SELECT * FROM Students;
-- UPDATE
UPDATE Students SET Email = 'vaidik.new@gmail.com' WHERE StudentID = 1;
-- DELETE (Example delete - keep commented or run carefully)
-- DELETE FROM Enrollments WHERE EnrolLmentID = 2;


#2. RETRIEVE STUDENTS WHO ENROLLED AFTER 2022
SELECT * FROM Students
WHERE Enrollment_Date > '2022-12-31';


#3. RETRIEVE COURSES OFFERED BY THE MATHS DEPARTMENT WITH A LIMIT OF 5 COURSES
SELECT c.* FROM Courses AS c
JOIN Departments AS d 
ON c.DepartmentID = d.DepartmentID
WHERE d.Department_Name = 'Mathematics'
LIMIT 5;


#4. GET THE NO OF STUDENTS ENROLLED IN EACH COURSE FILTERING FOR COURSES WITH MORE THAN 5 STUDENTS
SELECT CourseID, COUNT(StudentID) AS TotalStudents 
FROM Enrollments 
GROUP BY CourseID 
HAVING COUNT(StudentID) > 5;


#5. FIND STUDENTS WHO ARE ENROLLED IN BOTH INTRODUCTION TO SQL AND DATA STRUCTURES
SELECT DISTINCT s.* FROM Students AS s
JOIN Enrollments AS e1 
ON s.StudentID = e1.StudentID
JOIN Courses AS c1 
ON e1.CourseID = c1.CourseID
JOIN Enrollments AS e2 
ON s.StudentID = e2.StudentID
JOIN Courses AS c2 
ON e2.CourseID = c2.CourseID
WHERE c1.CourseName = 'Introduction to SQL' 
  AND c2.CourseName = 'Data Structures';


#6. FIND STUDENTS WHO ARE ENROLLED IN EITHER INTRODUCTION TO SQL OR DATA STRUCTURES
SELECT DISTINCT s.* FROM Students AS s
JOIN Enrollments AS e1 
ON s.StudentID = e1.StudentID
JOIN Courses AS c1 
ON e1.CourseID = c1.CourseID
JOIN Enrollments AS e2 
ON s.StudentID = e2.StudentID
JOIN Courses AS c2 
ON e2.CourseID = c2.CourseID
WHERE c1.CourseName = 'Introduction to SQL' 
  OR c2.CourseName = 'Data Structures';


#7. CALCULATE THE AVERAGE NUMBER OF CREDITS FOR ALL COURSES
SELECT AVG(Credits) AS AverageCredits FROM Courses;


#8. FIND THE MAXIMUM SALARY OF INSTRUCTORS IN THE COMPUTER SCIENCE DEPARTMENT
SELECT MAX(i.Salary) AS MaxCS_Salary FROM Instructors AS i
JOIN Departments AS d 
ON i.DepartmentID = d.DepartmentID
WHERE d.Department_Name = 'Computer Science';


#9. COUNT THE NUMBER OF STUDENTS ENROLLED IN EACH DEPARTMENT
SELECT d.Department_Name, COUNT(e.StudentID) AS TotalStudents
FROM Departments AS d
LEFT JOIN Courses AS c ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments AS e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.Department_Name;


#10. INNER JOIN: RETRIEVE STUDENTS AND THEIR CORRESPONDING COURSES
SELECT s.FirstName, s.LastName, c.CourseName, e.Enrollment_Date
FROM Students AS s
INNER JOIN Enrollments AS e ON s.StudentID = e.StudentID
INNER JOIN Courses AS c ON e.CourseID = c.CourseID;


#11. LEFT JOIN: RETRIEVE ALL STUDENTS AND THEIR CORRESPONDING COURSES, IF ANY
SELECT s.FirstName, s.LastName, c.CourseName
FROM Students AS s
LEFT JOIN Enrollments AS e ON s.StudentID = e.StudentID
LEFT JOIN Courses AS c ON e.CourseID = c.CourseID;


#12. SUBQUERY: FIND STUDENTS ENROLLED IN COURSES THAT HAVE MORE THAN 10 STUDENTS
SELECT * FROM Students 
WHERE StudentID IN (
    SELECT StudentID 
    FROM Enrollments 
    WHERE CourseID IN (
        SELECT CourseID 
        FROM Enrollments 
        GROUP BY CourseID 
        HAVING COUNT(StudentID) > 10
    )
);


#13. EXTRACT THE YEAR FROM THE ENROLLMENT_DATE OF STUDENTS
SELECT StudentID, FirstName, LastName, YEAR(Enrollment_Date) AS EnrollmentYear 
FROM Students;


#14. CONCATENATE THE INSTRUCTOR'S FIRST AND LAST NAME
SELECT CONCAT(First_Name, ' ', Last_Name) AS FullName 
FROM Instructors;


#15. CALCULATE THE RUNNING TOTAL OF STUDENTS ENROLLED IN COURSES
SELECT EnrolLmentID, CourseID, StudentID, Enrollment_Date,
       COUNT(StudentID) OVER (ORDER BY Enrollment_Date, EnrolLmentID) AS RunningTotal
FROM Enrollments;


#16. LABEL STUDENTS AS 'Senior' OR 'Junior' BASED ON THEIR YEAR OF ENROLLMENT
SELECT StudentID, FirstName, LastName, Enrollment_Date,
       CASE 
           WHEN DATEDIFF(CURRENT_DATE(), Enrollment_Date) > (365 * 4) THEN 'Senior'
           ELSE 'Junior'
       END AS StudentCategory
FROM Students;