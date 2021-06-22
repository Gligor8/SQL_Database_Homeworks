USE SEDCHome

ALTER TABLE [dbo].[Grade]
WITH CHECK ADD CONSTRAINT[FK_Grade_Course]
FOREIGN KEY([AchievementType])REFERENCES[dbo].[AchievementType]([Description])
GO