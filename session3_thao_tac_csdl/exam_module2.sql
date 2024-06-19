create database c0324h1;

use c0324h1;

create table Account_Student
(
    username varchar(200) primary key,
    password varchar(200)
);

create table Teachers
(
    id     int primary key auto_increment,
    name   varchar(100),
    dob    date,
    gender bit(1),
    phone  varchar(10)
);

create table Classes
(
    id   int primary key auto_increment,
    name varchar(50)
);

create table Teachers_Classes
(
    id_teacher int,
    id_class   int,
    primary key (id_teacher, id_class),
    foreign key fk_classes_teachers (id_class) references Classes (id),
    foreign key fk_classes_teachers2 (id_teacher) references Teachers (id)
);

create table Students
(
    id       int primary key auto_increment,
    name     varchar(100),
    dob      date,
    gender   bit(1),
    phone    varchar(10),
    id_class int,
    username varchar(100) unique,
    foreign key fk_account_students (username) references Account_Student (username),
    foreign key fk_classes_students (id_class) references Classes (id)
);

insert into Account_Student (username, password)
values ('hoang2000', 'password1'),
       ('tien1999', 'password2'),
       ('toan1998', 'password3'),
       ('tien2008', 'password4');

insert into Teachers(name, dob, gender, phone)
values ('Hai', '1978-10-20', 0, 08383833),
       ('KA', '1985-08-29', 1, 0393838);

insert into Classes(name)
values ('c03'),
       ('c04');

insert into Teachers_Classes(id_teacher, id_class)
values (1, 1),
       (2, 2);

insert into Students(name, dob, gender, phone, id_class, username)
values ('Hoang', '2000-08-21', 0, 03737393, 1, 'hoang2000'),
       ('Tien', '1999-07-10', 1, 038384844, 2, 'tien1999'),
       ('Toan', '1998-10-10', 0, 08378433, 1, 'toan1998'),
       ('Tien', '2008-01-03', 1, 03884443, 2, 'tien2008');
# 1
select Students.name   as StudentName,
       Students.dob    as DateOfBirth,
       Students.gender as Gender,
       Students.phone  as Phone,
       Classes.name    as ClassName
from Students
         join Classes on Students.id_class = Classes.id;
# 2
select Students.name   as StudentName,
       Students.dob    as DateOfBirth,
       Students.gender as Gender,
       Students.phone  as Phone,
       Classes.name    as ClassName,
       Teachers.name   as TeacherName
from Students
         join Classes on Students.id_class = Classes.id
         join Teachers_Classes on Classes.id = Teachers_Classes.id_class
         join Teachers on Teachers_Classes.id_teacher = Teachers.id;
# 3
select Students.name   as StudentName,
       Students.dob    as DateOfBirth,
       Students.gender as Gender,
       Students.phone  as Phone,
       Classes.name    as ClassName,
       Teachers.name   as TeacherName
from Students
         left join Classes on Students.id_class = Classes.id
         left join Teachers_Classes on Classes.id = Teachers_Classes.id_class
         left join Teachers on Teachers_Classes.id_teacher = Teachers.id;
# 4
select name, dob, gender, phone
from Students
where name = 'Tien'
   or name = 'Toan';
# 5
select Classes.name       as ClassName,
       count(Students.id) as TotalStudents
from Classes
         left join Students on Classes.id = Students.id_class
group by Classes.name;
# 6
select *
from Students
order by name;