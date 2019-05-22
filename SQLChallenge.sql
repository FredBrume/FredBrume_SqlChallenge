Create database SqlChallenge;

create table Department (

	dep_Id int identity primary key,
	[Name] varchar(max) not null,
	[Location] varchar(max) not null,

);

go

create table Employee (
	Employ_Id int identity primary key,
	FirstName varchar(max) not null,
	LastName varchar(max) not null,
	SSN varchar(max) not null,
	dep_Id int references Department(dep_Id)

);

go

create table EmployeeDetails (
	
	Ed_Id int identity primary key,
	Salary decimal not null,
	Address1 varchar(max),
	Address2 varchar(max),
	City varchar(max),
	[State] varchar(max),
	Country varchar(max),
	Employ_Id int references Employee(Employ_Id)
);

select * from Department;
select * from Employee;

insert Department([Name], [Location]) values ('Information Technology','DownTown Brooklyn');
insert Department([Name], [Location]) values ('Human Resources','MidTown Brooklyn');
insert Department([Name], [Location]) values ('Housing','Uptown Brooklyn');
insert Department([Name], [Location]) values ('Marketing','Uptown Brooklyn');

select * from Employee;
insert Employee(FirstName, LastName, SSN, Dep_Id) values ('Fred','Brume', '234-672-108','1');
insert Employee(FirstName, LastName, SSN, Dep_Id) values ('Michael','Scolfield', '601-222-189','2');
insert Employee(FirstName, LastName, SSN, Dep_Id) values ('Paul','Beer', '455-672-234','3');
insert Employee(FirstName, LastName, SSN, Dep_Id) values ('Tina','Smith', '534-222-101','1');

select * from EmployeeDetails;

insert EmployeeDetails(Salary, Address1, Address2, City, [State], Country, Employ_Id) 
values (5000.0,'8 FairView', '21 East New york','Brookyn','NY','USA', '4');

insert EmployeeDetails(Salary, Address1, Address2, City, [State], Country, Employ_Id) 
values (8000.0,'213 Columbus Ave', 'West 58 Columbus Ave','mahattan','NY','USA', '2');

insert EmployeeDetails(Salary, Address1, Address2, City, [State], Country, Employ_Id) 
values (9000.0,'300 East Micthell', '21 East New york','Brookyn','NY','USA', '3');

select sum(Salary) as 'Marketing Total Salary' from Employee e left join EmployeeDetails ed on
e.dep_Id = ed.Employ_Id left join Department d on d.dep_Id = e.Employ_Id where [Name] = 'Marketing';

select count([Name]) from Employee e 
left join Department d on e.dep_Id = d.dep_Id Group by [Name];

UPDATE ed SET ed.Salary = 90000.0 
FROM EmployeeDetails ed  Left JOIN
Employee e ON ed.Employ_Id = ed.Employ_Id where FirstName = 'Tina Smith';

select * from EmployeeDetails







