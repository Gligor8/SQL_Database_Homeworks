USE SEDCHome

/*
Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count
Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
List Student First Name and Last Name next to the other details from previous query
*/

SELECT TeacherID as Teacher, count(Grade) as Total
FROM dbo.[Grade] 
GROUP BY TeacherID
HAVING count(Grade) > 200
GO

SELECT TeacherID as Teacher, count(Grade) as CountGrade
FROM dbo.[Grade] 
WHERE StudentID < 100 
GROUP BY TeacherID
HAVING count(Grade) > 50
GO

SELECT StudentID, Max(Grade) as Total, AVG(Grade) as Average
FROM dbo.[Grade]
GROUP BY StudentID
HAVING  Max(Grade) = AVG(Grade)
GO