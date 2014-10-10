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
