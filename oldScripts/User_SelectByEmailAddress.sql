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
	T.UserType,
	S.IsOnBeach
FROM
    dbo.User U  INNER JOIN dbo.Membership M ON U.UserId = M.UserId 
                INNER JOIN dbo.UserType T ON M.UserId = T.UserId 
                LEFT OUTER JOIN dbo.UserStatus S ON T.UserId = S.UserId
WHERE
	U.EmailAddress = @emailAddress