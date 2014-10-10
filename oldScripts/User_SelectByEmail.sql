IF EXISTS (SELECT * 
			FROM sys.objects
			WHERE object_id = OBJECT_ID(N'dbo.User_SelectByEmailAddress')
				AND type IN ( N'P', N'PC' ) )
DROP PROCEDURE dbo.User_SelectByEmailAddress
GO

CREATE PROCEDURE User_SelectByEmailAddress
(
	@emailAddress nvarchar(256)
)
AS

SELECT TOP 1
	U.UserId,
	U.EmailAddress,
	U.FirstName,
	U.LastName,
	U.PhoneNumber,
	M.Password_Hash,
	M.Password_Salt,
	T.TypeName,
	S.IsOnBeach
FROM
    dbo.Users U INNER JOIN dbo.Memberships M ON U.UserId = M.UserId 
                INNER JOIN dbo.UserType US ON M.UserId = US.UserId 
				INNER JOIN dbo.Types T ON US.TypeId = T.TypeId
                LEFT OUTER JOIN dbo.UserStatus S ON US.UserId = S.UserId 
WHERE
	U.EmailAddress = @emailAddress


/*
EXEC dbo.User_SelectByEmailAddress 
	@emailAddress = 'e@add.com'
*/
