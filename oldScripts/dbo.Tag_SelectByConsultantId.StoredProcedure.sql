USE [SogetiSkills]
GO
/****** Object:  StoredProcedure [dbo].[Tag_SelectByConsultantId]    Script Date: 10/2/14 7:31:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Tag_SelectByConsultantId]
(
	@consultantId int
)
AS

SELECT
	T.TagId,
	T.Keyword,
	T.SkillDescription,
	IsCanonical
FROM
	ConsultantTag CT
INNER JOIN
	Tags T ON CT.TagId = T.TagId
WHERE
	CT.UserId = @consultantId
GO
