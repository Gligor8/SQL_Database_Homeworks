/*
Declare scalar variable for storing FirstName values
	Assign value ‘Antonio’ to the FirstName variable
	Find all Students having FirstName same as the variable
Declare table variable that will contain StudentId, Student Name and DateOfBirth
	Fill the table variable with all Female students
Declare temp table that will contain LastName and EnrolledDate columns
	Fill the temp table with all Male students having First Name starting with ‘A’
	Retrieve the students from the table which last name is with 7 characters
Find all teachers whose FirstName length is less than 5
	, and the first 3 characters of their FirstName and LastName are the same
*/

use SEDCHome

DECLARE @FirstName nvarchar(100)
set @FirstName = 'Antonio'

SELECT * 
FROM Student
WHERE FirstName = @FirstName
GO
------------------------------

DECLARE @StudentList TABLE 
(StudentId int, StudentName NVARCHAR(100), DateOfBirth date);

INSERT INTO @StudentList
SELECT Id, FirstName, DateOfBirth
FROM dbo.Student
WHERE Gender = 'F'

select * from @StudentList
GO

------------------------------

CREATE TABLE #StudentList 
(LastName NVARCHAR(100), EnrolledDate date);

INSERT INTO #StudentList
SELECT LastName, EnrolledDate 
from dbo.Student
where FirstName like 'A%'

SELECT * 
FROM #StudentList
where Len(LastName) = 7

GO

------------------------------
SELECT * 
FROM dbo.Teacher
where Len(FirstName) < 5
