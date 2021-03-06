/*
Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId in the following format:
	- StudentCardNumber without sc-
	-   
	- First character of student FirstName
	- .
	- Student LastName
	
	example:
	sc-77712 => 77712-P.Manaskov
*/

use SEDCHome

DROP FUNCTION IF EXISTS dbo.fn_FormatStudentName;
GO

CREATE FUNCTION dbo.fn_FormatStudentName (@StudentId int)
RETURNS Nvarchar(100)
AS 
BEGIN

DECLARE @Output Nvarchar(100)

select @Output = Replace(StudentCardNumber,'sc-','') +  ' - ' + Left(FirstName,1) + '.' + LastName
from dbo.Student
where id = @StudentId

RETURN @Output

END
GO
