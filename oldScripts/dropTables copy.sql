
DROP TABLE dbo.ConsultantTag
DROP TABLE dbo.Tags
DROP TABLE dbo.Resumes
DROP TABLE dbo.UserStatus
DROP TABLE dbo.UserType
DROP TABLE dbo.AccountTypes
DROP TABLE dbo.Memberships
DROP TABLE dbo.Users 

DROP PROCEDURE dbo.User_Insert
DROP PROCEDURE dbo.User_SelectIdByEmailAddress
DROP PROCEDURE dbo.User_SelectbyId

DROP FUNCTION dbo.DetermineUserTypeString

DROP PROCEDURE dbo.User_SelectByEmailAddress
DROP PROCEDURE dbo.User_UpdateContactInfo
DROP PROCEDURE dbo.User_SelectByKeyword

	CREATE PROCEDURE dbo.UpdateEmail (@userId int, @emailAddress nvarchar(max)) AS
	UPDATE dbo.Users SET
	EmailAddress = @emailAddress WHERE UserId = @userId

	CREATE PROCEDURE dbo.UpdateFirstName (@userId int, @firstName nvarchar(max) )AS
	UPDATE dbo.Users SET FirstName = @firstName
	WHERE UserId = @userId

	CREATE PROCEDURE dbo.UpdateLastName (@userId int, @lastName nvarchar(max) )AS
	UPDATE dbo.Users SET LastName = @LastName
	WHERE UserId = @userId
	
	CREATE PROCEDURE dbo.UpdatePhoneNumber (@userId int, @phoneNumber nvarchar(max))AS
	UPDATE dbo.Users SET PhoneNumber = @phoneNumber
	WHERE UserId = @userId

