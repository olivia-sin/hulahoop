CREATE PROCEDURE dbo.Resume_SelectByUserId
(
	@userId int
)
AS

SELECT TOP 1
    R.ResumeId,
	R.UserId,
	R.FileData,
	R.[FileName], 
	R.MimeType
FROM
	dbo.[Resumes] R
WHERE
	R.UserId = @userId;