
Insert into AccountTypes (Description) VALUES ('Consultant');
Insert into AccountTypes (Description) VALUES ('Account Executive');
SELECT * FROM AccountTypes


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

EXEC dbo.User_Insert 'CONSULTANT'
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
,'ZHK1SS8tRxGOfgAAcnfHTQ'

Select * from Users U full outer join Memberships M on U.UserId=M.UserId
	full outer JOIN UserType T on M.UserId= T.UserId
	full outer JOIN UserStatus S on T.UserId = S.UserId
