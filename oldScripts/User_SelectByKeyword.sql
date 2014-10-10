IF EXISTS (SELECT * 
			FROM sys.objects
			WHERE object_id = OBJECT_ID(N'dbo.User_SelectByKeyword')
				AND type IN ( N'P', N'PC' ) )
DROP PROCEDURE dbo.User_SelectByKeyword
GO

CREATE PROCEDURE dbo.User_SelectByKeyword
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

/*
EXEC dbo.User_SelectByKeyword
	@keyword = 'C#'

EXEC dbo.User_SelectByKeyword 'C#'

*/