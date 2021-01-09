create database school;

use school;

create table department(
 
	dept_name varchar(50) NOT NULL,
	-- all departments must have a name

	faculty varchar(50) NOT NULL,
	-- all departments must be a part of a faculty
	PRIMARY KEY (dept_name)
 
 );
 insert into department values 

('electrical engineering', 'engineering'),
('mechanical engineering', 'engineering'),
('chemical engineering', 'engineering'),
('food engineering', 'engineering'),
('mathematics', 'science'),
('physics', 'science'),
('biology', 'science'),
('sociology', 'social sciences'),
('history', 'social sciences');


CREATE TABLE student (
	st_id int NOT NULL,
	-- all students must have an ID
	st_name varchar(50) NOT NULL, 
	-- all students must have a name
	st_surname varchar(50) NOT NULL, 
	-- all students must have a surname
	e_mail varchar(50) NOT NULL, 
	-- all students must have an e-mail
	gpa float,
	-- some fresh students may have gpa as NULL
	st_type char(1) NOT NULL,
	-- 'm' for master students and 'b' for bachelor students
	grade char (1), 
	--bachelor students may be 1st 2nd 3rd or 4th grade
	research_area varchar(50), 
	--master students have a research area
	st_dept varchar(50) NOT NULL, 
	-- all students must register a department
	PRIMARY KEY (st_id),
	FOREIGN KEY (st_dept) REFERENCES department(dept_name)
	);

	insert into student values 

(101, 'ali', 'acikbas', 'ali.acikbas@metu.edu.tr', 2.53, 'b', '4', NULL, 'electrical engineering'),
(102, 'ayse', 'kaya', 'ayse.kaya@metu.edu.tr', 3.22, 'b', '2', NULL, 'mechanical engineering'),
(103, 'anil', 'aydin', 'anil.aydin@metu.edu.tr', 3.54, 'm',NULL, 'VLSI Design', 'physics'),
(104, 'zeynep', 'tabak', 'zeynep.tabak@metu.edu.tr', 2.15, 'm',NULL, 'Liberalism in Turkey', 'sociology'),
(105, 'mehmet', 'akal', 'mehmet.akal@metu.edu.tr', 3.07, 'm',NULL, 'Battery Technologies', 'chemical engineering');


create table professor (
	prof_id int NOT NULL,
	-- all professors must have an ID
	prof_name varchar(50) NOT NULL, 
	-- all professors must have a name
	prof_surname varchar(50) NOT NULL, 
	-- all professors must have a surname
	e_mail varchar(50) NOT NULL, 
	-- all professors must have an e-mail
	prof_dept varchar(50) NOT NULL, 
	-- all professors must work at department
	PRIMARY KEY (prof_id),
	FOREIGN KEY (prof_dept) REFERENCES department(dept_name)
	);

insert into professor values 

(201, 'fuat', 'akal', 'fuat.akal@metu.edu.tr','electrical engineering'),
(202, 'ayca', 'tarhan', 'ayca.tarhan@metu.edu.tr','mechanical engineering'),
(203, 'onder', 'efe', 'onder.efe@metu.edu.tr', 'physics');

create table course (
	code int NOT NULL,
	-- all courses must have a code
	course_name varchar(50) NOT NULL, 
	-- all courses must have a name
	capacity int NOT NULL, 
	-- all courses have a course capacity
	PRIMARY KEY (code),
	);

insert into course values 

(5670201, 'circuit theory', 100),
(5690204, 'thermodynamics', 200),
(2360119, 'calculus', 50);

create table car (
	license_number varchar(50) NOT NULL,
	-- all cars must have a license number
	owner_id int NOT NULL, 
	-- all cars must have a unique owner
	PRIMARY KEY (license_number,owner_id),
	FOREIGN KEY (owner_id) REFERENCES professor (prof_id)
	);

insert into car values 

('06 AB 123', 201),
('34 CD 3456', 202),
('35 EF 5698', 203);

create table club (
	foundation_year int NOT NULL,
	-- all clubs must have a foundation year
	club_name varchar(50) NOT NULL, 
	-- all clubs must have a name
	PRIMARY KEY (club_name),
	);

insert into club values 

(2014, 'Quidditch'),
(1968, 'Chess'),
(1962, 'Football');


create table exam (
	course_code int NOT NULL,
	-- all exams must belong to a course
	exam_date date NOT NULL, 
	-- all exams must have a date
	PRIMARY KEY (course_code,exam_date),
	FOREIGN KEY (course_code) REFERENCES course (code)
	);

insert into exam values 

(5670201, '2020-12-18'),
(2360119, '2020-12-29');


create table enroll (
	st_id int NOT NULL,
	-- all enrollements must have a student id
	course_code int NOT NULL, 
	-- all enrollements must have a course code
	enr_year int NOT NULL,
	-- enrollement year must be saved
	PRIMARY KEY (st_id,course_code),
	FOREIGN KEY (st_id) REFERENCES student (st_id),
	FOREIGN KEY (course_code) REFERENCES course (code)
	);

insert into enroll values 

(101, 5670201, 2019),
(102, 2360119, 2020);


create table member (
	st_id int NOT NULL,
	-- all members must have a student id
	club_name varchar(50) NOT NULL, 
	-- all memberships must have a club name
	mem_year int NOT NULL,
	-- when membership started must be saved
	PRIMARY KEY (st_id,club_name),
	FOREIGN KEY (st_id) REFERENCES student (st_id),
	FOREIGN KEY (club_name) REFERENCES club (club_name)
	);

insert into member values 

(104, 'chess', 2018),
(105, 'quidditch', 2017);

