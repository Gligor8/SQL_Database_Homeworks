USE SEDCHome

SELECT * 
FROM Student
WHERE FirstName = 'Antonio'
Order by LastName
GO

SELECT * 
FROM Student
Order by LastName 
GO


SELECT * 
FROM Student
WHERE Gender = 'M'
ORDER by EnrolledDate desc
GO