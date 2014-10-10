CREATE PROCEDURE dbo.Chart_UserXSkill
AS
BEGIN
DECLARE	@tags nvarchar,
		@keys nvarchar,
		@skill nvarchar
select tags,keys, skill, [1],[2],[3],[4] from (
select	((convert(nvarchar(max),US.UserId))) AS Id,
		((convert(nvarchar(max),TG.TagId)))AS tags,
		((convert(nvarchar(max),TG.Keyword)))AS keys,
		((convert(nvarchar(max),TG.SkillDescription))) AS skill,
		(convert(varbinary,TG.TagId)) as tt
from 
		dbo.Users AS US 
		join dbo.ConsultantTag AS CT on US.UserId=CT.UserId 
		join dbo.Tags AS TG on CT.TagId=TG.TagId
) up 
pivot (count(tt) for [Id] in ([1],[2],[3],[4]) ) as 
pvt
RETURN
END
GO