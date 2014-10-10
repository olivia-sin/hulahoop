
Insert into AccountTypes (Description) VALUES ('Consultant');
Insert into AccountTypes (Description) VALUES ('Account Executive');
SELECT * FROM AccountTypes;

EXEC dbo.User_Insert 'CONSULTANT'
,'email@address.com'
,'Andrew'
,'Amherst'
,'1234567890'
,'ZHK1SS8tRxGOfgAAcnfHTQ'
,'FwCWROQMRYCOcQAAvQMWqQ'

EXEC dbo.User_Insert 'CONSULTANT'
,'frail@address.com'
,'Bobby'
,'Billings'
,'2345678901'
,'FwCWROQMRYCOcQAAvQMWqQ'
,'ZHK1SS8tRxGOfgAAcnfHTQ'

EXEC dbo.User_Insert 'CONSULTANT'
,'grant@address.com'
,'Chris'
,'Coldstone'
,'3456789012'
,'ZHK1SS8tRxGOfgAAcnfHTQ'
,'FwCWROQMRYCOcQAAvQMWqQ'

EXEC dbo.User_Insert 'ACCOUNTEXEC'
,'hobby@address.com'
,'Drake'
,'Dillinger'
,'4567890123'
,'FwCWROQMRYCOcQAAvQMWqQ'
,'ZHK1SS8tRxGOfgAAcnfHTQ'

EXEC dbo.User_Insert 'ACCOUNTEXEC'
,'indio@address.com'
,'Efrain'
,'Eldrige'
,'5678901234'
,'ZHK1SS8tRxGOfgAAcnfHTQ'
,'FwCWROQMRYCOcQAAvQMWqQ'

EXEC dbo.User_Insert 'ACCOUNTEXEC'
,'jokes@address.com'
,'Frank'
,'Fernandez'
,'6789012345'
,'FwCWROQMRYCOcQAAvQMWqQ'
,'ZHK1SS8tRxGOfgAAcnfHTQ';

Select * from Users U full outer join Memberships M on U.UserId=M.UserId
	full outer JOIN UserType T on M.UserId= T.UserId
	full outer JOIN UserStatus S on T.UserId = S.UserId;

*****/*****/*****/*****/*****/*****/

EXEC dbo.User_SelectIdByEmailAddress 'email@address.com';

EXEC dbo.User_SelectById '2';
EXEC dbo.User_SelectById @userId = '1'
EXEC dbo.User_SelectByEmailAddress 'email@address.com'

EXEC dbo.User_UpdateContactInfo @userId = '1',
	@emailAddress = 'new@address.com',
	@firstName = 'Andrew',
	@lastName = 'Amherst',
	@phoneNumber = '1234567890'


SELECT dbo.DetermineUserTypeString (1);

*****/*****/*****/

INSERT INTO TAGS (Keyword, SkillDescription, IsCanonical) VALUES 
('HTML5.0', 'Webpage Creation: HyperText Markup Language', 1),
('CCNA','Cisco Certified Network Associate- Routing, Switching', 1) ,
('MCT', 'Microsoft Certified Trainer', 1),
('C#','Microsoft OOProgramming Language',1)

EXEC dbo.Tag_Insert 'LPIC-1', 'Linux Professional Institute Certification- Level 1'

SELECT * FROM TAGS

INSERT INTO ConsultantTag ( UserId, TagID) VALUES (3,1) , (1,4) , (2,4) , (1,3), (3,2)
INSERT INTO dbo.ConsultantTag	(UserId,TagId) VALUES	(1,1),	(2,1)

EXEC dbo.Tag_SelectByConsultantId	@ConsultantId = 1


*****/*****/*****/

EXEC dbo.User_SelectByKeyword @keyword = 'C#'
EXEC dbo.User_SelectByKeyword 'C#'


*****/*****/*****/


EXEC dbo.Resume_SelectByUserId
EXEC dbo.Resume_SelectMetadataByUserId
EXEC dbo.Resume_Insert

*****/*****/*****/


EXEC dbo.UserIsOnBeach_Update 1,1
EXEC dbo.User_SelectById @userId = '1'
select * from dbo.ShowUsers()


*****/*****/*****/


EXEC DBO.Chart_UserXSkill



