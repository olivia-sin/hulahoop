CREATE PROCEDURE dbo.Tag_Insert
(
    @keyword			nvarchar(128),
	@skillDescription	nvarchar(max)
)
AS

INSERT into dbo.Tags
	(
		Keyword,
		SkillDescription,
		IsCanonical
	)
VALUES
	(
		 @keyword,
		 @skillDescription,
		 1
	)

/*
EXEC dbo.Tag_Insert
	'Oracle', 'Oracle Database Management System'


SELECT * FROM TAGS
*/