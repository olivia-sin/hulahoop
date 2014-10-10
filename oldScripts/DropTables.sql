IF EXISTS (SELECT * 
			FROM sys.objects 
			WHERE object_id = OBJECT_ID(N'dbo.__MigrationHistory')
				 AND type in (N'U'))
DROP TABLE  dbo.__MigrationHistory

IF EXISTS (SELECT * 
			FROM sys.objects 
			WHERE object_id = OBJECT_ID(N'dbo.ConsultantTag')
				 AND type in (N'U'))
DROP TABLE  dbo.ConsultantTag

IF EXISTS (SELECT * 
			FROM sys.objects 
			WHERE object_id = OBJECT_ID(N'dbo.Tags')
				 AND type in (N'U'))
DROP TABLE  dbo.Tags

IF EXISTS (SELECT * 
			FROM sys.objects 
			WHERE object_id = OBJECT_ID(N'dbo.UserType')
				 AND type in (N'U'))
DROP TABLE  dbo.UserType

IF EXISTS (SELECT * 
			FROM sys.objects 
			WHERE object_id = OBJECT_ID(N'dbo.UserStatus')
				 AND type in (N'U'))
DROP TABLE  dbo.UserStatus

IF EXISTS (SELECT * 
			FROM sys.objects 
			WHERE object_id = OBJECT_ID(N'dbo.Resumes')
				 AND type in (N'U'))
DROP TABLE  dbo.Resumes

IF EXISTS (SELECT * 
			FROM sys.objects 
			WHERE object_id = OBJECT_ID(N'dbo.Types')
				 AND type in (N'U'))
DROP TABLE  dbo.Types

IF EXISTS (SELECT * 
			FROM sys.objects 
			WHERE object_id = OBJECT_ID(N'dbo.Memberships')
				 AND type in (N'U'))
DROP TABLE  dbo.Memberships

IF EXISTS (SELECT * 
			FROM sys.objects 
			WHERE object_id = OBJECT_ID(N'dbo.Users')
				 AND type in (N'U'))
DROP TABLE  dbo.Users
