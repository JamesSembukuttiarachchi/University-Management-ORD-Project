# University Management ORD Project
This project implements a University Management System using PostgreSQL as the object-relational database. It demonstrates the use of object-relational features such as composite types and table inheritance to model various entities within a university context, including students, professors, courses, and enrollments.

## Features
Object-Relational Structure: Utilizes PostgreSQL’s ability to handle complex data types through the creation of a composite type address, enabling structured address information for students and professors.
Table Inheritance: Implements table inheritance to define a hierarchy between the person, student, and professor tables, allowing for shared attributes and relationships.
Course Enrollment Management: Supports the enrollment of students in courses and tracks their grades, facilitating an effective management of academic records.
Data Backup and Restore: Includes commands for backing up and restoring the database to ensure data integrity and ease of recovery.

## Technologies Used
Database: PostgreSQL (object-relational database management system)
Data Definition Language (DDL): SQL scripts for creating tables, sequences, and constraints.
Data Manipulation: SQL commands for inserting and managing data.
Backup and Restore: Utilizes pg_dump and psql for data backup and restoration processes.

## Setup Instructions

1. Install PostgreSQL: [Installation Guide](https://www.postgresql.org/download/).
2. Clone the repository:
   ```bash
   git clone https://github.com/your-username/University-Management-ORD-Project.git
3. Restore the database using the provided SQL dump:
   ```bash
   psql -U postgres -d your_database_name < university_management.sql
5. Connect to your restored database:
   ```bash
   psql your_database_name
