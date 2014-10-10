CREATE FUNCTION dbo.DetermineUserTypeString (@userId int)
RETURNS nvarchar(50) 
WITH SCHEMABINDING AS
BEGIN
	DECLARE @userTypeString AS nvarchar(50);
	SELECT @userTypeString =
		( SELECT TOP 1 A.Description
			FROM dbo.UserType T JOIN
				dbo.AccountTypes A on T.TypeId = A.TypeId
			WHERE T.UserId = @userId
			)
RETURN @userTypeString
END;
GO

/**/
/* select * from dbo.ShowUsers() */
/**/

create function dbo.ShowUsers()
Returns TABLE 
AS
RETURN
(
Select U.UserId, A.Description, U.EmailAddress,
U.FirstName, U.LastName, U.PhoneNumber, M.Password_Hash,
  M.Password_Salt, S.IsOnBeach, M.Stamp
from Users AS U 
join Memberships AS M on (U.UserId= M.UserId)
join UserType AS T on(M.UserId=T.UserId)
join AccountTypes AS A  on(T.TypeId=A.TypeId)
full outer join UserStatus AS S on (T.UserId=S.UserId)
);