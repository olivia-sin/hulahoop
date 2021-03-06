USE [SogetiSkills]
GO
/****** Object:  StoredProcedure [dbo].[User_SelectByKeyword]    Script Date: 10/2/14 7:31:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_SelectByKeyword]
(
	@keyword nvarchar(128)
)
AS

SELECT
	U.FirstName,
	U.LastName,
	U.EmailAddress
FROM
	dbo.Users U
INNER JOIN
	ConsultantTag CT ON U.UserId = CT.UserId
INNER JOIN
	Tags T ON CT.TagId = T.TagId
WHERE
	T.Keyword = @keyword
GO
