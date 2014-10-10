CREATE PROCEDURE dbo.Resume_Insert
(
	@userid int,
	@fileData varbinary(max),
	@fileName nvarchar(max),
	@mimeType nvarchar(max)
)
AS

IF EXISTS (SELECT COUNT(*) FROM dbo.[Resumes]R WHERE R.UserId = @userId)
	BEGIN
		DELETE Resumes WHERE UserId = @userId;
	END

INSERT INTO dbo.[Resumes]
    (R.UserId, R.FileData, R.[FileName], R.MimeType)
VALUES 
    (@userId, @fileData, @fileName, @mimeType);