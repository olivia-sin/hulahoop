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