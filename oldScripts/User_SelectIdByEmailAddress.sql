CREATE PROCEDURE User_SelectIdByEmailAddress
(
	@emailAddress nvarchar(max)
)
AS

SELECT TOP 1
	U.UserId
FROM
	dbo.User U
WHERE
	U.EmailAddress = @emailAddress