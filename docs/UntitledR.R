use ijl1db;
# Database Table Creation

#  First drop any existing tables. Any errors are ignored.

DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS applies_for;
DROP TABLE IF EXISTS remote_work;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS job_title;

# Now, add each table.

create table job_title(
  job_id INTEGER UNSIGNED,
  role varchar(50),
  description varchar
  primary key (job_id));

create table company(
  company_no INTEGER UNSIGNED,
  location varchar(30),
  size INTEGER UNSIGNED,
  primary key(company_no));

create table student(
  student_id INTEGER UNSIGNED,
  major varchar(40),
  school varchar (20),
  primary key(student_id));

create table remote_work(
  remoteemp_id INTEGER UNSIGNED,
  ratio INTEGER UNSIGNED,
  company_no INTEGER UNSIGNED not null,
  primary key(remoteemp_id),
  foreign key(company_no) references company(company_no));

create table applies_for(
  student_id INTEGER UNSIGNED,
  job_id INTEGER UNSIGNED,
  primary key(student_id, job_id),
  foreign key(student_id) references student(student_id),
  foreign key(job_id) references job_title(job_id));

create table employee(
  emp_id INTEGER UNSIGNED,
  name varchar(50),
  address varchar(50),
  phone INTEGER UNSIGNED,
  experience_level varchar(50),
  job_status varchar(50),
  hire_date DATE,
  year INTEGER UNSIGNED,
  company_no INTEGER UNSIGNED not null,
  job_id INTEGER UNSIGNED not null,
  primary key(emp_id),
  foreign key(job_id) references job_title(job_id),
  foreign key(company_no) references company(company_no));

create table salary(
  salary float(10,2),
  grade varchar(20),
  emp_id INTEGER UNSIGNED not null, 
  primary key(salary, grade, emp_id),
  foreign key(emp_id) references employee(emp_id)
  ON DELETE CASCADE);
