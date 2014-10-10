CREATE PROCEDURE dbo.User_Insert
(   
	@userType nvarchar(450),
	@emailAddress nvarchar(450),
	@firstName nvarchar(max),
	@lastName nvarchar(max),
	@phoneNumber nvarchar(max),
	@passwordHash nvarchar(max),
	@passwordSalt nvarchar(max)
)	
AS
    -- declare variables --
	DECLARE 
	@now datetime = getutcdate(),
	@userId int,   -- return value of sp call
	@typeId int

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

SELECT @userId=SCOPE_IDENTITY();

INSERT INTO dbo.Memberships
		(
			UserId, 
			Password_Hash, 
			Password_Salt, 
			Stamp
		)
		VALUES 
		(
			@userId, 
			@passwordHash, 
			@passwordSalt,
			@now
		)


IF (@usertype LIKE 'Consult%')
	
  BEGIN
	SELECT @typeID = (
	SELECT TypeId
	from dbo.AccountTypes
	where Description LIKE 'Consult%'
	)

	INSERT into dbo.UserType
		(
			UserId,
			TypeId,
			Stamp
		)
		VALUES
		(
			@userId,
			@typeId,
			@now
		);
	INSERT into dbo.UserStatus
		(
			UserId,
			IsOnBeach,
			Stamp
		)
		VALUES
		(
			@userId,
			0,
			@now
		)
  END
	IF (@usertype LIKE 'Account%')
	BEGIN
	SELECT @typeID = (
		SELECT TypeId
		from dbo.AccountTypes
		where Description LIKE 'Account%'
	)

	INSERT into dbo.UserType
	(
		UserId,
		TypeId,
		Stamp
	)
	VALUES
	(
		@userId,
		@typeId,
		@now
	)
	END
END
