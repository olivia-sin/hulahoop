/*
procedure to register new user
inserts into User, Membership, UserType tables
*/


IF EXISTS (SELECT * FROM sys.objects
			WHERE type = 'P' 
			AND name = 'dbo.User_Insert'))
DROP PROCEDURE dbo.User_Insert

CREATE PROCEDURE dbo.User_Insert
(
	@emailAddress	nvarchar(max),
	@firstName	 	nvarchar(max),
	@lastName 		nvarchar(max),
	@phoneNumber 	nvarchar(max),
	@passwordHash 	nvarchar(max),
	@passwordSalt 	nvarchar(max),
	@userType		nvarchar(max)
)	
AS

BEGIN

DECLARE @userId int,
	 	@now date = getutcdate()

INSERT INTO User
			(
				FirstName, 
				LastName, 
				EmailAddress, 
				PhoneNumber
			)
			VALUES 
			(
				@firstName,
				@lastName, 
				@emailAddress, 
				@phoneNumber
			)

SELECT @userId=SCOPE_IDENTITY()

INSERT INTO Membership
			(
				UserId, 
				PasswordHash, 
				PasswordSalt, 
				LastLogin
			)
			VALUES 
			(
				@userId, 
				@passwordHash, 
				@passwordSalt, 
				@now)

IF @usertype LIKE 'consultant'
INSERT INTO UserType
			(
				UserId,
				TypeId,
				DateFrom
			)
			VALUES
			(
				@userId,
				1,
				@now
			)

ELSEIF @usertype LIKE 'executive'
INSERT INTO UserType
			(
				UserId,
				TypeId,
				DateFrom
			)
			VALUES
			(
				@userId,
				2,
				@now
			)
END

//SELECT SCOPE_IDENTITY();

GO