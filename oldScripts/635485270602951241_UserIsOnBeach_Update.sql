CREATE PROCEDURE dbo.UserIsOnBeach_Update
(
    @userId		int,
	@isOnBeach	bit
)
AS
DECLARE @compare bit,
        @stamp datetime =  getutcdate();

BEGIN

SELECT @compare = (SELECT TOP 1 US.IsOnBeach 
                   FROM dbo.UserStatus US 
                   WHERE US.UserId = @userId 
				   ORDER BY US.IsOnBeach DESC)

IF @compare <> @isOnBeach
    BEGIN
    UPDATE dbo.UserStatus

    SET
        IsOnBeach = @isOnBeach,
        Stamp = @stamp
    WHERE
        UserId = @userId
    END

END

/* TO DO
*
CREATE TRIGGER ON UPDATE OF USERSTATUS TABLE
TO LOG STATUS CHANGES
*
*/




/*TEST

EXEC dbo.UserIsOnBeach_Update 
    @userId = '1',
	@isOnBeach = '1'

EXEC dbo.UserIsOnBeach_Update 9,0

EXEC dbo.User_SelectById 9
*/