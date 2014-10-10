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

