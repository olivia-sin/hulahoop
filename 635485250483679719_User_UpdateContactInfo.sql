CREATE PROCEDURE dbo.User_UpdateContactInfo
(
    @userId         int,
	@emailAddress	nvarchar(max),
	@firstName	 	nvarchar(max),
	@lastName 		nvarchar(max),
	@phoneNumber 	nvarchar(max)
)
AS

UPDATE 
	dbo.Users
SET 
	FirstName = @firstName,
	LastName = @lastName,
	EmailAddress = @emailAddress,
	PhoneNumber = @phoneNumber
WHERE
	UserId = @userId

