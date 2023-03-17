/* CTE - Common Table Expression  */

With CTE_Employee as 
(
Select FirstName, Lastname, Gender, Salary, 
Count(Gender) Over (Partition By Gender) as TotalGender,
Avg(Salary)Over (Partition By Salary) as AvgSalary
From SQLTutorial..EmployeeDemographics Dm
Join SQLTutorial..EmployeeSalary Sal
on Dm.EmployeeID=Sal.EmployeeID
 where salary > '45000'
 )
 Select * From CTE_Employee



/*TEMP TABLE --- The only difference between normal table and temp table is # */

Create Table #Temp_Emp
(
EmployeeID int,
JobTitle varchar(50),
salary int 
)

Select * From  #Temp_Emp


Insert Into #Temp_Emp Values 
( '1001','HR','45000')

Insert Into #Temp_Emp 
Select * From SQLTutorial..EmployeeSalary



Drop Table if exists #Temp_Emp2  /**/
Create Table #Temp_Emp2
(
Jobtitle varchar(50),
EmployeePerjob int,
AvgAge int,
AvgSalary int
)

Insert Into #Temp_Emp2
Select JobTitle, Count(JobTitle), AVG(Age),AVG(Salary)
From SQLTutorial..EmployeeDemographics Dm
Join SQLTutorial..EmployeeSalary Sal
on Dm.EmployeeID=Sal.EmployeeID
Group By JobTitle

Select * From #Temp_Emp2
/* #Temp_Emp2 would not run after one run as it is saved somewhere 
so we can do one thing . We can add drop table that it will delete existing table and create new one. */



/*Sring Function- TRIM, LTRIM, RTRIM, REPLACE, SUBSTRING, UPPER, LOWER */
Drop Table EmpErrors


Create Table EmpErrors
(
EmplyoeeID varchar(50),
FirstName varchar(50),
LastName Varchar(50)
)

Insert Into EmpErrors Values
('  1001','ALEx','JimmY'),
('  1002','MinnI','singh'),
('  1003  ','JiMMy','shergiL')


Select * From EmpErrors



Insert Into EmpErrors Values
('  1004  ','shreYa','MishrA'),
('  1005      ','MilII','singH'),
('  1006       ','KamaL','ShergiL')


Insert Into EmpErrors Values
('1004   ','shreYA   ','pateL')
Insert Into EmpErrors Values
('1004   ','shreYA   ','pateL - EY')


Select EmplyoeeID, Trim(EmplyoeeID) as IDTrim
From EmpErrors

Select EmplyoeeID, LTrim(EmplyoeeID) as IDTrim
From EmpErrors

Select EmplyoeeID, RTrim(EmplyoeeID) as IDTrim
From EmpErrors



-----Replace
Select LastName, REPLACE(LastName, ' - EY', '') as fixName
From EmpErrors


----Substring  (FirstName,1,4)  1=first letter, 3= third letter
Select FirstName, Substring(FirstName,1,4) as fixName
From EmpErrors

Select FirstName, Substring(FirstName,3,4) as fixName
From EmpErrors



-----Upper and Lower

Select FirstName, Upper(FirstName) as fixName
From EmpErrors



Select FirstName, Lower(FirstName) as fixName
From EmpErrors


/* Stored Procedure*/

CREATE PROCEDURE Test
as
Select * From EmployeeDemographics

EXEC Test



Create PROCEDURE Temp_Emp
as

Create Table #Temp_Emp2
(
Jobtitle varchar(50),
EmployeePerjob int,
AvgAge int,
AvgSalary int
)

Insert Into #Temp_Emp2
Select JobTitle, Count(JobTitle), AVG(Age),AVG(Salary)
From SQLTutorial..EmployeeDemographics Dm
Join SQLTutorial..EmployeeSalary Sal
on Dm.EmployeeID=Sal.EmployeeID
Group By JobTitle 

select * From #Temp_Emp

Exec Temp_Emp @JobTitle ='Salesman'



/* SubQuery In select */

Select * From EmployeeSalary

Select  EmployeeID, JobTitle, (Select Avg(Salary) From EmployeeSalary)From EmployeeSalary
