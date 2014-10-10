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
	dbo.Users U FULL OUTER JOIN ConsultantTag CT ON U.UserId = CT.UserId 
                FULL OUTER JOIN Tags T ON CT.TagId = T.TagId 
WHERE T.Keyword = @keyword