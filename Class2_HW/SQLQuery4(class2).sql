USE SEDCHome

ALTER TABLE GradeDetails
ADD CONSTRAINT DF_GradeDetails_AchievementMaxPoints
DEFAULT 100 FOR [AchievementMaxPoints]
GO

ALTER TABLE [dbo].[GradeDetails] WITH CHECK
ADD CONSTRAINT CHK_GradeDetails_AchievementMaxPoints
CHECK (AchievementPoints>AchievementMaxPoints);
GO

ALTER TABLE [dbo].[AchievementType] WITH CHECK 
ADD CONSTRAINT UC_Code UNIQUE (Code)
GO