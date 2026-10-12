# 🎓 Student Management System – SQL Final Project

## 📌 Project Overview
The **Student Management System** is a MySQL database project designed to manage student records, departments, courses, instructors, and course enrollments. It demonstrates essential SQL concepts, including database creation, table relationships, CRUD operations, aggregate functions, joins, subqueries, string functions, date functions, conditional statements, and window functions.

## 🎯 Objectives
- Create and manage a relational database using MySQL.
- Store student, department, course, instructor, and enrollment information.
- Perform CRUD operations on database tables.
- Retrieve information using SQL queries and filtering conditions.
- Understand primary keys and foreign key relationships.
- Apply aggregate functions, joins, subqueries, and window functions.
- Generate useful academic reports using SQL.

## 🛠️ Technologies Used
- **Database:** MySQL
- **Language:** SQL
- **Concepts:** Relational Database Management System (RDBMS)

## 🗄️ Database Name
`final_project`

## 📂 Database Structure

The database consists of five tables.

### 1. Departments
Stores information about academic departments.

| Column | Description |
|---|---|
| DepartmentID | Primary key identifying each department |
| Department_Name | Name of the department |

### 2. Students
Stores student personal and enrollment information.

| Column | Description |
|---|---|
| StudentID | Primary key identifying each student |
| FirstName | Student's first name |
| LastName | Student's last name |
| Email | Unique email address |
| Birth_Date | Student's date of birth |
| Enrollment_Date | Date of enrollment |

### 3. Courses
Stores information about courses offered by departments.

| Column | Description |
|---|---|
| CourseID | Primary key identifying each course |
| CourseName | Name of the course |
| DepartmentID | Foreign key referencing Departments |
| Credits | Number of course credits |

### 4. Instructors
Stores instructor details and salary information.

| Column | Description |
|---|---|
| InstructorsID | Primary key identifying each instructor |
| First_Name | Instructor's first name |
| Last_Name | Instructor's last name |
| Email | Unique email address |
| DepartmentID | Foreign key referencing Departments |
| Salary | Instructor's salary |

### 5. Enrollments
Connects students with their enrolled courses.

| Column | Description |
|---|---|
| EnrolLmentID | Primary key identifying each enrollment |
| StudentID | Foreign key referencing Students |
| CourseID | Foreign key referencing Courses |
| Enrollment_Date | Date of course enrollment |

## 🔗 Database Relationships

- One department can offer multiple courses.
- One department can have multiple instructors.
- One student can enroll in multiple courses.
- One course can have multiple enrolled students.
- The Enrollments table connects Students and Courses.

These relationships are implemented using primary keys and foreign keys.

## ⚙️ Features and SQL Queries

This project demonstrates the following 16 SQL operations:

1. **CRUD Operations** – Create, Read, Update, and Delete records.
2. **Date Filtering** – Retrieve students enrolled after 2022.
3. **JOIN and LIMIT** – Retrieve up to five courses offered by the Mathematics department.
4. **GROUP BY and HAVING** – Find courses with more than five enrolled students.
5. **Multiple JOINs** – Find students enrolled in both Introduction to SQL and Data Structures.
6. **OR Conditions** – Find students enrolled in either of the specified courses.
7. **AVG() Function** – Calculate the average credits of all courses.
8. **MAX() Function** – Find the maximum instructor salary in Computer Science.
9. **LEFT JOIN and COUNT()** – Count enrollments in courses belonging to each department.
10. **INNER JOIN** – Retrieve students and their corresponding courses.
11. **LEFT JOIN** – Retrieve all students and their corresponding courses, if any.
12. **Subqueries** – Find students enrolled in courses with more than ten students.
13. **YEAR() Function** – Extract the enrollment year.
14. **CONCAT() Function** – Combine instructor first and last names.
15. **Window Function** – Calculate the running total of enrollments.
16. **CASE Statement** – Categorize students as Senior or Junior based on enrollment duration.

## 🚀 How to Run the Project

### Prerequisites
Install MySQL Server and use a MySQL client such as MySQL Workbench.

### Steps
1. Open MySQL Workbench or another MySQL client.
2. Create a new SQL script.
3. Copy the SQL code from the project into the script.
4. Execute the script from top to bottom.
5. Run the individual queries to view the results.

### Database Initialization
The project begins with:

```sql
CREATE DATABASE final_project;
USE final_project;
````

Note: If the database already exists, `CREATE DATABASE` may return an error. You can use `CREATE DATABASE IF NOT EXISTS final_project;` when setting up the project again.

## 📊 Sample Data

The database includes sample records for:

- Departments: Computer Science and Mathematics
- Students: Two sample students
- Courses: Introduction to SQL and Data Structures
- Instructors: Two sample instructors
- Enrollments: Two course enrollment records

The sample data makes it possible to test the queries and understand the relationships between tables.

## 📚 SQL Concepts Covered

- Database and table creation
- Data types and constraints
- Primary keys and foreign keys
- INSERT, SELECT, UPDATE, and DELETE
- WHERE, ORDER BY, and LIMIT
- INNER JOIN and LEFT JOIN
- GROUP BY and HAVING
- Aggregate functions: COUNT(), AVG(), and MAX()
- Subqueries
- Date functions: YEAR() and DATEDIFF()
- String function: CONCAT()
- Conditional logic using CASE
- Window functions using COUNT() OVER()

## ⚠️ Important Notes

- The `UPDATE` query changes the first student's email address.
- The `DELETE` query is commented out to prevent accidental deletion.
- The current sample data contains only two enrollments, so queries requiring more than five or ten students will return no matching courses.
- The Senior/Junior classification is based on the elapsed time since the student's enrollment date, not the student's academic year. The threshold can be adjusted according to project requirements.
- The running total counts enrollment records in date order; it does not represent the number of unique students.
- The Mathematics department currently offers the Data Structures course in the sample data.

## 🔮 Future Improvements

- Add student grades and examination results.
- Include attendance tracking.
- Create a student course registration system.
- Add course capacity and instructor scheduling.
- Introduce views and stored procedures.
- Add triggers for automated database operations.
- Develop a web-based interface connected to MySQL.
- Implement user authentication and role-based access.

## 🎓 Learning Outcomes

After completing this project, users can understand how to design a relational database, maintain connected tables, retrieve meaningful information, and apply fundamental and intermediate SQL queries to a practical academic management scenario.

## 👨‍💻 Project Information

Project Name: Student Management System Database: `final_project` Technology: MySQL Project Type: SQL Database Management Project

⭐ If you find this project useful, consider improving it with additional tables, realistic sample data, and more advanced SQL queries.
