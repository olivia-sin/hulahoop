EXEC dbo.User_Insert
	@emailAddress = 'email@address.com',
	@firstName = 'firstly',
	@lastName = 'lastly',
	@phoneNumber = '1234567890',
	@passwordHash = 'hsah',
	@passwordSalt = 'tlas',
	@userType = 'CONSULTANT'

EXEC dbo.User_Insert
	@emailAddress = 'e@add.com',
	@firstName = 'Frank',
	@lastName = 'Lyman',
	@phoneNumber = '0004567890',
	@passwordHash = 'hashes',
	@passwordSalt = 'salts',
	@userType = 'ACCOUNT_EXECUTIVE'

select * from dbo.Users;
select * from dbo.Memberships;
select * from dbo.UserType;
select * from dbo.UserStatus;
