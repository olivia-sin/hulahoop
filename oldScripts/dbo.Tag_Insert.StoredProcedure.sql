USE [SogetiSkills]
GO
/****** Object:  StoredProcedure [dbo].[Tag_Insert]    Script Date: 10/2/14 7:31:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Tag_Insert]
(
    @keyword			nvarchar(128),
	@skillDescription	nvarchar(max)
)
AS

INSERT into dbo.Tags
	(
		Keyword,
		SkillDescription,
		IsCanonical
	)
VALUES
	(
		 @keyword,
		 @skillDescription,
		 1
	)
GO
