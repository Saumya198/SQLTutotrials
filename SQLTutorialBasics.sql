/*   Create Table*/

create table EmployeeDemographics
(
EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)


Create Table EmployeeSalary
(
EmloyeeID int,
JobTitle varchar(50),
Salary int,
)


/*   Insert values */

Insert Into EmployeeDemographics Values 
(1001,'Priyanshu','Maurya', 28,'Male'),
(1002,'Sanskriti','Mishra',31,'Female'),
(1003,'Shruti','Singh',34,'Female'),
(1004,'Aditi','Singh',23,'Female'),
(1005,'Aman','Soni',27,'Male'),
(1006,'Ashish','Tiwari',31,'Male'),
(1007,'Astha','Mittal',29,'Female'),
(1008,'Prakriti','Kishore',33,'Female'),
(1009,'Sunil','Biswa',32,'Male')



Insert Into EmployeeSalary Values
(1001,'Data Engineer',57000),
(1002,'Salesman',32000),
(1003,'SDE',83000),
(1004,'HR',56000),
(1005,'Salesman',32000),
(1006,'Accountant',76000),
(1007,'Regiona Manager',85000),
(1008,'Receptionist',35000),
(1009,'Supplier relations',56000)


/*Select statement(*,Top,DIstinct,Count,As,Max,Min,Avg)
*/
Select * From EmployeeDemographics
Select FirstName From EmployeeDemographics
Select Top 8 Age From EmployeeDemographics
Select distinct(Salary) From EmployeeSalary
Select Count(Salary) From EmployeeSalary

--Using Master database execute query from other database
Select Count(Salary) From 
EmployeeSalary/* It will give error over Master*/

Select * From SQLTutorial.dbo.EmployeeSalary/*It will be executed*/



/*Where Statement 
=,<,>,<=,>=,<>,AND,OR,LIKE,NULL,IN,NOT NULL
*/
Select * From EmployeeDemographics
Where LastName <>'Singh'

Select * From EmployeeDemographics
Where LastName = 'Singh' and Age <= 30

Select * From EmployeeDemographics
Where LastName = 'Singh' or Age <= 30

Select * From EmployeeDemographics
Where LastName Like  'S%' and Age <= 30


Select * From EmployeeDemographics
Where LastName In ('Mittal','Singh')



/*  Group By  */

Select Gender,Age,Count(Gender) as Counts
From EmployeeDemographics
Where Age<=40
Group By Gender, Age

 /* Order By */

Select Gender,Age,Count(Gender) as Counts
From EmployeeDemographics
Where Gender= 'Male'
Group By Gender, Age
Order by Counts



Select *
From EmployeeSalary
Where EmployeeID Like '100%'
Order by 1,2 Desc