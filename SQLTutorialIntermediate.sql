Insert into EmployeeDemographics VALUES
(1011, 'Rehaan', 'Dwiwedi', 26, 'Male'),
(NULL, 'Dolly', 'Roy', NULL, NULL),
(1013, 'Milesh', 'Pandey', NULL, 'Male')

Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)


Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Milesh', 'Pandey', NULL, 'Male'),
(1050, 'Rohan', 'Awasthi', 31, 'Male'),
(1051, 'Harish', 'Kushwaha', 40, 'Male'),
(1052, 'Sriti', 'Johnson', 31, 'Female')


/* Inner join, Full/Left/Right/Outer Joins
*/

Select * From SQLTutorial.dbo.EmployeeDemographics
Select * from SQLTutorial.dbo.EmployeeSalary

Select * From SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
On EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID



Select * From SQLTutorial.dbo.EmployeeDemographics
Full Outer Join SQLTutorial.dbo.EmployeeSalary
On EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID


Select * From SQLTutorial.dbo.EmployeeDemographics
Left Outer Join SQLTutorial.dbo.EmployeeSalary
On EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

Select * From SQLTutorial.dbo.EmployeeDemographics
Right Outer Join SQLTutorial.dbo.EmployeeSalary
On EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

select * from SQLTutorial.dbo.WareHouseEmployeeDemographics

Select *
From SQLTutorial.dbo.EmployeeDemographics
Full Outer Join SQLTutorial.dbo.WareHouseEmployeeDemographics
On EmployeeDemographics.EmployeeID=WareHouseEmployeeDemographics.EmployeeID



/*Union, Union All*/
select * from SQLTutorial.dbo.WareHouseEmployeeDemographics
Union
select * from SQLTutorial.dbo.EmployeeDemographics

select * from SQLTutorial.dbo.WareHouseEmployeeDemographics
Union All
select * from SQLTutorial.dbo.EmployeeDemographics
order by EmployeeID

/*It get executed because the datatypes are same*/
select EmployeeID, FirstName, Age from SQLTutorial.dbo.WareHouseEmployeeDemographics
Union
select EmployeeID, JobTitle, Salary from SQLTutorial.dbo.EmployeeSalary



Case Statement

Select FirstName, LastName,Age,
Case 
	When Age =34 Then 'Adult'
	When Age >31 then 'Old'
	Else 'Baby'
End
 From EmployeeDemographics
 Where Age is not null
 Order By Age


Select FirstName, Lastname, JobTitle, Salary,
Case
	When JobTitle= 'Salesman' Then Salary + (Salary*.10)
	When JobTitle= 'Accountant' Then Salary + (Salary*.05)
	When JobTitle= 'HR' Then Salary + (Salary*.03)
	Else Salary +(Salary* .001)
End as SalaryIncrement
From SQLTutorial.dbo.EmployeeDemographics JOIN SQLTutorial.dbo.EmployeeSalary
On EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID




/* Having Clause */

Select JobTitle, Count(Salary)
From SQLTutorial.dbo.EmployeeSalary
Group by JobTitle
Having Count(Salary)> 1



Select JobTitle, AVG(Salary) as AvgSalary
From SQLTutorial.dbo.EmployeeDemographics JOIN SQLTutorial.dbo.EmployeeSalary
On EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
Group by JobTitle
Having AVG(Salary)> 45000
Order by JobTitle




/*Update and Delete Statement*/

Update SQLTutorial.dbo.EmployeeSalary
Set Jobtitle = 'Regional Manager'
Where EmployeeID= 1007


Select * from SQLTutorial.dbo.EmployeeSalary


Delete SQLTutorial.dbo.EmployeeSalary
Where JobTitle= 'SDE'

Select FirstName + ' '+ LastName as FullName
From SQLTutorial.dbo.EmployeeDemographics

Select Demo.Age
From  SQLTutorial.dbo.EmployeeDemographics as Demo
Where Age is not null

Select Demo.Age, Sal.Salary
From  SQLTutorial.dbo.EmployeeDemographics as Demo
Join  SQLTutorial.dbo.EmployeeSalary as Sal
On Demo.EmployeeID= Sal.EmployeeID
Order By Age


Select a.EmployeeID, a.FirstName, b.JobTitle, c.Age
From SQLTutorial.dbo.EmployeeDemographics as a
Left join SQLTutorial.dbo.EmployeeSalary as b
on a.EmployeeID= b.EmployeeID
Left Join SQLTutorial.dbo.WareHouseEmployeeDemographics as c
on a.EmployeeID= c.EmployeeID



/*Partition By  Statement*/
Select * 
From SQLTutorial..EmployeeDemographics


Select *
From SQLTutorial..EmployeeSalary

Select FirstName, Lastname, Gender, Salary, 
Count(Gender) Over (Partition By Gender) as TotalGender
From SQLTutorial..EmployeeDemographics Dm
Join SQLTutorial..EmployeeSalary Sal
on Dm.EmployeeID=Sal.EmployeeID