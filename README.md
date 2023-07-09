# database-from-scratch
Criação de um database do 0.

Criação do banco de dados relacional:

CREATE DATABASE university;

USE university;

CREATE TABLE faculties (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE departments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  faculty_id INT NOT NULL,
  FOREIGN KEY (faculty_id) REFERENCES faculties(id)
);

CREATE TABLE colleges (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE collegiates (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  department_id INT NOT NULL,
  college_id INT NOT NULL,
  FOREIGN KEY (department_id) REFERENCES departments(id),
  FOREIGN KEY (college_id) REFERENCES colleges(id)
);

CREATE TABLE professors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  department_id INT NOT NULL,
  FOREIGN KEY (department_id) REFERENCES departments(id)
);

CREATE TABLE students (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  department_id INT NOT NULL,
  collegiate_id INT,
  FOREIGN KEY (department_id) REFERENCES departments(id),
  FOREIGN KEY (collegiate_id) REFERENCES collegiates(id)
);

CREATE TABLE advisors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  professor_id INT NOT NULL,
  student_id INT NOT NULL,
  FOREIGN KEY (professor_id) REFERENCES professors(id),
  FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE staff (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  department_id INT,
  faculty_id INT,
  college_id INT,
  FOREIGN KEY (department_id) REFERENCES departments(id),
  FOREIGN KEY (faculty_id) REFERENCES faculties(id),
  FOREIGN KEY (college_id) REFERENCES colleges(id)
);

CREATE TABLE disciplines (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE courses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  discipline_id INT NOT NULL,
  FOREIGN KEY (discipline_id) REFERENCES disciplines(id)
);

CREATE TABLE course_enrollments (
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  PRIMARY KEY (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES students(id),
  FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE discipline_enrollments (
  student_id INT NOT NULL,
  discipline_id INT NOT NULL,
  PRIMARY KEY (student_id, discipline_id),
  FOREIGN KEY (student_id) REFERENCES students(id),
  FOREIGN KEY (discipline_id) REFERENCES disciplines(id)
);


Formas de inserir dados no database:

USE university;

-- Insert sample faculties
INSERT INTO faculties (name) VALUES ('Faculdade de Arquitetura e Urbanismo');
INSERT INTO faculties (name) VALUES ('Faculdade de Direito');
INSERT INTO faculties (name) VALUES ('Faculdade de Educação');
INSERT INTO faculties (name) VALUES ('Faculdade de Filosofia, Letras e Ciências Humanas');

-- Insert sample departments
INSERT INTO departments (name, faculty_id) VALUES ('Departmento de História', 1);
INSERT INTO departments (name, faculty_id) VALUES ('Departmento de Biologia', 2);
INSERT INTO departments (name, faculty_id) VALUES ('Departmento de Geografia', 3);
INSERT INTO departments (name, faculty_id) VALUES ('Departmento de Filosofia', 4);

-- Insert sample colleges
INSERT INTO colleges (name) VALUES ('Colegiado de Humanidades');
INSERT INTO colleges (name) VALUES ('College of Natural Sciences');

-- Insert sample collegiates
INSERT INTO collegiates (name, department_id, college_id) VALUES ('Collegiate A', 1, 1);
INSERT INTO collegiates (name, department_id, college_id) VALUES ('Collegiate B', 2, 2);

-- Insert sample professors
INSERT INTO professors (first_name, last_name, email, department_id) VALUES ('John', 'Doe', 'john.doe@example.com', 1);
INSERT INTO professors (first_name, last_name, email, department_id) VALUES ('Jane', 'Smith', 'jane.smith@example.com', 2);

-- Insert sample students
INSERT INTO students (first_name, last_name, email, department_id, collegiate_id) VALUES ('Alice', 'Johnson', 'alice.johnson@example.com', 1, 1);
INSERT INTO students (first_name, last_name, email, department_id, collegiate_id) VALUES ('Bob', 'Anderson', 'bob.anderson@example.com', 2, 2);

-- Insert sample advisors
INSERT INTO advisors (professor_id, student_id) VALUES (1, 2);
INSERT INTO advisors (professor_id, student_id) VALUES (2, 1);

-- Insert sample staff
INSERT INTO staff (first_name, last_name, email, department_id) VALUES ('Emily', 'Davis', 'emily.davis@example.com', 1);
INSERT INTO staff (first_name, last_name, email, faculty_id) VALUES ('Michael', 'Wilson', 'michael.wilson@example.com', 2);
INSERT INTO staff (first_name, last_name, email, college_id) VALUES ('Sophia', 'Lee', 'sophia.lee@example.com', 1);

-- Insert sample disciplines
INSERT INTO disciplines (name) VALUES ('History');
INSERT INTO disciplines (name) VALUES ('Biology');

-- Insert sample courses
INSERT INTO courses (name, discipline_id) VALUES ('Introduction to World History', 1);
INSERT INTO courses (name, discipline_id) VALUES ('Cell Biology', 2);

-- Insert sample course enrollments
INSERT INTO course_enrollments (student_id, course_id) VALUES (1, 1);
INSERT INTO course_enrollments (student_id, course_id) VALUES (2, 2);

-- Insert sample discipline enrollments
INSERT INTO discipline_enrollments (student_id, discipline_id) VALUES (1, 1);
INSERT INTO discipline_enrollments (student_id, discipline_id) VALUES (2, 2);
