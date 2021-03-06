USE [SogetiSkills]
GO
/****** Object:  StoredProcedure [dbo].[User_UpdateContactInfo]    Script Date: 10/2/14 7:31:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_UpdateContactInfo]
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
GO
