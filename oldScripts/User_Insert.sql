/*
procedure to register new user
inserts into User, Membership, UserType tables
*/

IF EXISTS (SELECT * 
			FROM sys.objects
			WHERE object_id = OBJECT_ID(N'dbo.User_Insert')
				AND type IN ( N'P', N'PC' ) )
DROP PROCEDURE dbo.User_Insert
GO

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
    -- declare variables --
	DECLARE 
	@now date = getutcdate(),
	@userId int   -- return value of sp call

BEGIN
    INSERT INTO dbo.Users
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
			);

    SET @userId=SCOPE_IDENTITY();

    INSERT INTO dbo.Memberships
			(
				UserId, 
				Password_Hash, 
				Password_Salt, 
				LastLogin
			)
			VALUES 
			(
				@userId, 
				@passwordHash, 
				@passwordSalt, 
				@now
			);

    IF (@usertype = 'CONSULTANT')
	BEGIN
        INSERT into dbo.UserType
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
			);
		INSERT into dbo.UserStatus
			(
				UserId,
				IsOnBeach,
				DateFrom
			)
			VALUES
			(
				@userId,
				0,
				@now
			);
	END
		ELSE
		BEGIN
			IF (@usertype = 'ACCOUNT_EXECUTIVE')
			BEGIN
			INSERT into dbo.UserType
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
        END
END
GO