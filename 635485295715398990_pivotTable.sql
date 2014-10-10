

/**** Pivot Table of ConsultantTags ****/



select tags,keys, skill, [Andrew Amherst],[Bobby Billings],[Chris Coldstone],[Efrain Eldrige] from (
select	((convert(nvarchar(max),US.FirstName))+' '
		+(convert(nvarchar(max),US.LastName)))As names,
		((convert(nvarchar(max),TG.TagId)))AS tags,
		((convert(nvarchar(max),TG.Keyword)))AS keys,
		((convert(nvarchar(max),TG.SkillDescription))) AS skill,
		(convert(varbinary,TG.TagId)) as tt
from 
		dbo.Users AS US 
		join dbo.ConsultantTag AS CT on US.UserId=CT.UserId 
		join dbo.Tags AS TG on CT.TagId=TG.TagId
) up 
pivot (count(tt) for [names] in ([Andrew Amherst],[Bobby Billings],[Chris Coldstone],[Efrain Eldrige]) ) as 
pvt
END

/********//********//********//********//********//********/

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

/********//********//********//********//********//********/

