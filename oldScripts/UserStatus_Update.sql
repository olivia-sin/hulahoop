IF EXISTS (SELECT * 
			FROM sys.objects
			WHERE object_id = OBJECT_ID(N'dbo.UserStatus_Update')
				AND type IN ( N'P', N'PC' ) )
DROP PROCEDURE dbo.UserStatus_Update
GO

CREATE PROCEDURE dbo.UserStatus_Update
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


/* TO DO
*
CREATE TRIGGER ON UPDATE OF USERSTATUS TABLE
TO LOG STATUS CHANGES
*
*/




/*TEST

EXEC dbo.UserStatus_Update 
    @userId = '1',
	@isOnBeach = '1'

EXEC dbo.UserStatus_Update '1','1'

EXEC dbo.User_SelectById 1
*/