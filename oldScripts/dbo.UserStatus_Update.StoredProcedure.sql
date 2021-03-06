USE [SogetiSkills]
GO
/****** Object:  StoredProcedure [dbo].[UserStatus_Update]    Script Date: 10/2/14 7:31:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserStatus_Update]
(
    @userId		int,
	@isOnBeach	bit
)
AS

UPDATE 
	dbo.UserStatus
SET 
	IsOnBeach = @isOnBeach,
	DateFrom = getutcdate()
WHERE
	UserId = @userId
GO
