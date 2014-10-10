IF EXISTS (SELECT * 
			FROM sys.objects
			WHERE object_id = OBJECT_ID(N'dbo.User_SelectIdByEmailAddress')
				AND type IN ( N'P', N'PC' ) )
DROP PROCEDURE dbo.User_SelectIdByEmailAddress
GO

CREATE PROCEDURE User_SelectIdByEmailAddress
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
