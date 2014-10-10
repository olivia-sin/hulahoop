CREATE PROCEDURE User_UpdateContactInfo
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

/*
EXEC dbo.User_UpdateContactInfo 
    @userId = '1',
	@emailAddress = 'newE@mail.com',
	@firstName = 'newFirst',
	@lastName = 'newLast',
	@phoneNumber = '0987654321'


EXEC dbo.User_SelectById 
	@userId = '1'
*/