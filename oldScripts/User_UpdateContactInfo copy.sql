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
	dbo.User U
SET 
	U.FirstName = @firstName,
	U.LastName = @lastName,
	U.EmailAddress = @emailAddress,
	U.PhoneNumber = @phoneNumber
WHERE
	U.UserId = @userId
