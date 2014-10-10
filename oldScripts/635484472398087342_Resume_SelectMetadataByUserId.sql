CREATE PROCEDURE dbo.Resume_SelectMetadataByUserId
(
	@userId int
)
AS

SELECT TOP 1
	R.[FileName], 
	R.MimeType
FROM
	dbo.[Resumes] R
WHERE 
	R.UserId = @userId;