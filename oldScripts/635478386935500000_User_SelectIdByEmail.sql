CREATE PROCEDURE User_SelectIdByEmail
(
	@emailAddress nvarchar(max)
)
AS

SELECT TOP 1
	U.UserId
FROM
	dbo.Users U
WHERE
	U.EmailAddress = @emailAddress

/*
EXEC User_SelectIdByEmailAddress 
	@emailAddress = 'email@address.com'
*/
