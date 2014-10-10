CREATE PROCEDURE dbo.Tag_Insert
(
    @keyword			nvarchar(128),
	@skillDescription	nvarchar(max),
	@isCanonical bit = 1
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
		 @isCanonical
	)

