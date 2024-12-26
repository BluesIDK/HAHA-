create database challenge
use challenge
go;

alter table students 
drop column payment_status;

create table students ( student_ID varchar(12) not null primary key, 
st_name varchar(12) not null,  
guild_ID varchar(5) not null, 
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
guild_ID varchar(5) not null,
foreign key (guild_ID) references guild(guild_ID) );

create table course ( course_ID varchar(6) not null primary key, 
course_name varchar(30), price decimal(10 , 2) );

create table instructor (instructor_ID varchar(12) not null primary key, 
instructor_name varchar(15) not null );


select  *
from classroom
select *
from course

