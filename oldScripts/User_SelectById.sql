IF EXISTS (SELECT * 
			FROM sys.objects
			WHERE object_id = OBJECT_ID(N'dbo.User_SelectById')
				AND type IN ( N'P', N'PC' ) )
DROP PROCEDURE dbo.User_SelectById
GO

CREATE PROCEDURE User_SelectById
(
	@userId int
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
	U.UserId = @userId


/*
EXEC dbo.User_SelectById 
	@userId = '2'
*/