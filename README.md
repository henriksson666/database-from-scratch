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

CREATE TABLE collegiates (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  department_id INT,
  college_id INT,
  FOREIGN KEY (department_id) REFERENCES departments(id),
  FOREIGN KEY (college_id) REFERENCES faculties(id)
);

CREATE TABLE professors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  department_id INT,
  collegiate_id INT,
  faculty_id INT,
  FOREIGN KEY (department_id) REFERENCES departments(id),
  FOREIGN KEY (collegiate_id) REFERENCES collegiates(id),
  FOREIGN KEY (faculty_id) REFERENCES faculties(id)
);

CREATE TABLE students (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  department_id INT,
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
  collegiate_id INT,
  faculty_id INT,
  FOREIGN KEY (department_id) REFERENCES departments(id),
  FOREIGN KEY (collegiate_id) REFERENCES collegiates(id),
  FOREIGN KEY (faculty_id) REFERENCES faculties(id)
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

CREATE TABLE head_of_departments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  professor_id INT NOT NULL,
  department_id INT NOT NULL,
  FOREIGN KEY (professor_id) REFERENCES professors(id),
  FOREIGN KEY (department_id) REFERENCES departments(id)
);

CREATE TABLE head_of_collegiates (
  id INT AUTO_INCREMENT PRIMARY KEY,
  professor_id INT NOT NULL,
  collegiate_id INT NOT NULL,
  FOREIGN KEY (professor_id) REFERENCES professors(id),
  FOREIGN KEY (collegiate_id) REFERENCES collegiates(id)
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

-- Insert sample collegiates
INSERT INTO collegiates (name, department_id, college_id) VALUES ('Colegiado de Geografia', 1, 1);
INSERT INTO collegiates (name, department_id, college_id) VALUES ('Colegiado de História', 2, 1);

-- Insert sample professors
INSERT INTO professors (first_name, last_name, email, department_id, collegiate_id, faculty_id) VALUES ('Ariana', 'Sousa', 'sousa.ariana@usp.edu', 1, NULL, 1);
INSERT INTO professors (first_name, last_name, email, department_id, collegiate_id, faculty_id) VALUES ('Pedro', 'Santos', 'santos.pedro@usp.edu', 2, 2, NULL);

-- Insert sample students
INSERT INTO students (first_name, last_name, email, department_id, collegiate_id) VALUES ('Kátia', 'Fonseca', 'katia.fonseca@usp.edu', 1, 1);
INSERT INTO students (first_name, last_name, email, department_id, collegiate_id) VALUES ('André', 'Sousa', 'andre.sousa@usp.edu', 2, NULL);

-- Insert sample advisors
INSERT INTO advisors (professor_id, student_id) VALUES (1, 2);
INSERT INTO advisors (professor_id, student_id) VALUES (2, 1);

-- Insert sample staff
INSERT INTO staff (first_name, last_name, email, department_id, collegiate_id, faculty_id) VALUES ('Emília', 'Rocha', 'emilia.rocha@usp.edu', 1, NULL, NULL);
INSERT INTO staff (first_name, last_name, email, department_id, collegiate_id, faculty_id) VALUES ('Michael', 'Mendes', 'michael.mendes@usp.edu', NULL, NULL, 2);
INSERT INTO staff (first_name, last_name, email, department_id, collegiate_id, faculty_id) VALUES ('Sophia', 'Carrera', 'sophia.carrera@usp.edu', NULL, 1, NULL);

-- Insert sample disciplines
INSERT INTO disciplines (name) VALUES ('História');
INSERT INTO disciplines (name) VALUES ('Biologia');
INSERT INTO disciplines (name) VALUES ('Teoria da Computação');
INSERT INTO disciplines (name) VALUES ('Linguagens Formais');

-- Insert sample courses
INSERT INTO courses (name, discipline_id) VALUES ('Introdução à História da Computação', 1);
INSERT INTO courses (name, discipline_id) VALUES ('Biologia Celular', 2);
INSERT INTO courses (name, discipline_id) VALUES ('Biologia Molecular', 3);
INSERT INTO courses (name, discipline_id) VALUES ('Biologia Evolutiva', 4);

-- Insert sample course enrollments
INSERT INTO course_enrollments (student_id, course_id) VALUES (1, 1);
INSERT INTO course_enrollments (student_id, course_id) VALUES (2, 2);

-- Insert sample discipline enrollments
INSERT INTO discipline_enrollments (student_id, discipline_id) VALUES (1, 1);
INSERT INTO discipline_enrollments (student_id, discipline_id) VALUES (2, 2);

-- Insert sample head of departments
INSERT INTO head_of_departments (professor_id, department_id) VALUES (1, 1);
INSERT INTO head_of_departments (professor_id, department_id) VALUES (2, 2);

-- Insert sample head of collegiates
INSERT INTO head_of_collegiates (professor_id, collegiate_id) VALUES (1, 1);
INSERT INTO head_of_collegiates (professor_id, collegiate_id) VALUES (2, 2);