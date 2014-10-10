

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


/*
select lasts, [Cisco Certified Network Associate- Routing, Switching], [Linux Professional Institute Certification- Level 1],[Microsoft Certified Trainer],[Microsoft Programming Language],[Programming Language C#],[Webpage Creation: HyperText Markup Language]
from (
select TG.SkillDescription AS skills, US.LastName as lasts, (CT.UserID * TG.TagId)as tt
from dbo.Users AS US join dbo.ConsultantTag AS CT on US.UserId=CT.UserId 
	join Tags as TG on CT.TagId=TG.TagId
) up
pivot (count(tt) for [skills] in ([Cisco Certified Network Associate- Routing, Switching], [Linux Professional Institute Certification- Level 1],[Microsoft Certified Trainer],[Microsoft Programming Language],[Programming Language C#],[Webpage Creation: HyperText Markup Language])) as pvt2
order by lasts
[Andrew Amherst],[Bobby Billings], [Chris Coldstone], [Dillinger],[Efrain Eldrige]*/