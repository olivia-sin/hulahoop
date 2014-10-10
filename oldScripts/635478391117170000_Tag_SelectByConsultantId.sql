CREATE PROCEDURE dbo.Tag_SelectByConsultantId
(
	@consultantId int
)
AS

SELECT
	T.TagId,
	T.Keyword,
	T.SkillDescription,
	IsCanonical
FROM
	ConsultantTag CT
INNER JOIN
	Tags T ON CT.TagId = T.TagId
WHERE
	CT.UserId = @consultantId

/*
INSERT INTO dbo.Tags
	(
		Keyword,
		SkillDescription,
		IsCanonical
	)
	VALUES
	(
		'C#',
		'Programming Language C#',
		'true'
	)
INSERT INTO dbo.ConsultantTag
	(
		UserId,
		TagId
	)
	VALUES
	(
		1,
		1
	),
	(
		2,
		1
	)
*/

/*
EXEC dbo.Tag_SelectByConsultantId
	@ConsultantId = 2
*/

