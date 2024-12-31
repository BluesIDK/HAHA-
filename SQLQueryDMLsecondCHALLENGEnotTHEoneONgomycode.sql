create database challenge
use challenge
go;

alter table students 
drop column payment_status;

create table students ( student_ID varchar(12) not null primary key, 
st_name varchar(12) not null,  
foreign key (guild_ID) references guild(guild_ID) );

create table registration ( student_ID varchar(12) not null,
guild_ID varchar(5) not null,
payment_status bit  not null,
primary key (student_ID, guild_ID),
foreign key (guild_ID) references guild(guild_ID),
foreign key (student_ID) references students(student_ID) );


alter table students
alter column payment_status bit not null;

drop table test;

create table seat ( seat_nbr varchar(10) not null primary key, 
student_ID varchar(12) not null, 
foreign key (student_ID) references students(student_ID) );

create table guild ( guild_ID varchar(5) not null primary key, 
guild_name varchar(15) not null, 
course_ID varchar(6) not null, 
instructor_ID varchar(12) not null, 
foreign key (course_ID) references course(course_ID), 
foreign key (instructor_ID) references instructor(instructor_ID) );

create table classroom (classroom_ID varchar(5) not null primary key,
guild_ID varchar(5) null,
foreign key (guild_ID) references guild(guild_ID) );

create table course ( course_ID varchar(6) not null primary key, 
course_name varchar(30), price decimal(10 , 2) );

create table instructor (instructor_ID varchar(12) not null primary key, 
instructor_name varchar(15) not null );


select  *
from classroom
select *
from course

use challenge;
go

insert into instructor values (2, 'Alice Johnson'), (3, 'Michael Lee');
insert into course values (102, 'Advanced Python', 1200), (103, 'Intro to Machine Learning', 1500);
insert into guild values (1002, 'Guild Gamma', 102, 2), (1003, 'Guild Delta', 103, 3);
insert into students (student_ID, st_name) values (301, 'emma brown'), (302, 'liam willson');
insert into classroom values (102, 1002), (103, 1003);
insert into seat values (1, 301), (2, 302);
insert into registration values (301, 1002, 1), (302, 1003, 0);


ALTER TABLE registration
ADD CONSTRAINT DF_registration_guild_ID DEFAULT 'bla' FOR guild_ID;

ALTER TABLE guild
ADD CONSTRAINT DF_guild_guild_ID DEFAULT 'bla' FOR guild_ID;

ALTER TABLE registration
DROP CONSTRAINT DF_registration_guild_ID;

ALTER TABLE guild
DROP CONSTRAINT DF_guild_guild_ID;

ALTER TABLE registration
ADD CONSTRAINT DF_registration_guild_ID DEFAULT 'bla' FOR guild_ID;


ALTER TABLE registration
ALTER COLUMN guild_ID VARCHAR(5) NULL;

alter table guild
alter column guild_ID varchar(5) null;

alter table classroom
alter column guild_ID varchar(5) null;


alter table students
drop constraint FK__students__guild___534D60F1;

ALTER TABLE students
DROP COLUMN guild_ID;

SELECT CONSTRAINT_NAME 
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE TABLE_NAME = 'students' AND COLUMN_NAME = 'guild_ID';


select *
from registration;

select *
from students;

select *
from guild;

UPDATE instructor
SET instructor_name = 'Alice Cooper'
WHERE instructor_ID = 2;

UPDATE course
SET price = 1700
WHERE course_ID = 103;

UPDATE guild
SET course_ID = 103
WHERE guild_ID = 1002;

UPDATE registration
SET payment_status = 1
WHERE student_ID = 302;

UPDATE classroom
SET guild_ID = 1003
WHERE classroom_ID = 102 AND guild_ID = 1002;

UPDATE seat
SET student_ID = 302
WHERE seat_nbr = 1;

DELETE FROM instructor
WHERE instructor_ID = 3;

select *
from registration;

UPDATE guild
SET instructor_ID = 2
WHERE guild_ID = 1003;

DELETE FROM course
WHERE course_ID = 102;

DELETE FROM guild
WHERE guild_ID = 1003;

UPDATE classroom
SET guild_ID = 1002
WHERE classroom_ID = 102;

UPDATE classroom
SET guild_ID = 1002
WHERE classroom_ID = 103;

UPDATE registration
SET guild_ID = 1002
WHERE student_ID = 302;

select * from registration;

UPDATE registration
SET student_ID = 1002
WHERE classroom_ID = 103;

DELETE FROM students
WHERE student_ID = 301;

DELETE FROM registration
WHERE student_ID = 301;

DELETE FROM classroom
WHERE classroom_ID = 103;

DELETE FROM seat
WHERE seat_nbr = 2;