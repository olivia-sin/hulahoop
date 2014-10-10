CREATE PROCEDURE dbo.User_SelectById
(
	@userId int
)
AS
SELECT TOP 1
	U.UserId,
	AT.Description,
	U.EmailAddress,
	U.FirstName,
	U.LastName,
	U.PhoneNumber,
	M.Password_Hash,
	M.Password_Salt,
	S.IsOnBeach

FROM
    dbo.Users U FULL OUTER JOIN dbo.Memberships M ON U.UserId = M.UserId 
                FULL OUTER JOIN dbo.UserType US ON M.UserId = US.UserId 
				FULL OUTER JOIN dbo.AccountTypes AT ON US.TypeId = AT.TypeId
                FULL OUTER JOIN dbo.UserStatus S ON US.UserId = S.UserId 
WHERE
	U.UserId = @userId
