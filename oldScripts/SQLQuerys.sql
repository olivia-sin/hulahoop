/* Drop Original Tables, Procedures */



ALTER TABLE Resumes DROP CONSTRAINT FK_Resume_User;
ALTER TABLE Consultant_Tag DROP CONSTRAINT FK_Consultant_Tag_Users
;
ALTER TABLE Consultant_Tag DROP CONSTRAINT FK_Consultant_Tag_Tags;



Drop table Consultant_Tag;

drop table Tags
drop table Resumes;

drop table Users

;
DROP PROCEDURE Resume_SelectMetadataByUserId
;
DROP PROCEDURE Resume_SelectByUserId;

DROP PROCEDURE Resume_Insert;
DROP PROCEDURE Tag_SelectByConsultantId;
DROP PROCEDURE User_SelectIdByEmailAddress;

DROP PROCEDURE User_SelectByEmailAddress;
DROP PROCEDURE User_SelectById;
DROP PROCEDURE User_Insert;
DROP PROCEDURE User_UpdateContactInfo


;

/* Drop 2nd version Tables, Procedures */


ALTER TABLE ConsultantTag DROP CONSTRAINT FK_ConsultantTag_Users;

ALTER TABLE ConsultantTag DROP CONSTRAINT FK_ConsultantTag_Tags;

ALTER TABLE Resumes DROP CONSTRAINT FK_Resume_Users;

ALTER TABLE UserType DROP CONSTRAINT FK_UserType_Users
;
ALTER TABLE UserType DROP CONSTRAINT FK_UserType_Types

;
Drop table ConsultantTag
drop table Tags
drop table UserType;

drop table UserStatus;

drop table Resumes
drop table Types;

drop table Memberships;

drop table Users;


drop procedure User_SelectIdByEmail
;
drop procedure User_SelectIdByEmailAddress
;
drop procedure User_SelectByEmail;

drop procedure User_SelectByEmailAddress;

drop procedure User_SelectById;

drop procedure User_Insert;

drop procedure User_UpdateContactInfo;

drop procedure User_SelectByKeyword
;
drop procedure UserStatus_Update
;
drop procedure Tag_Insert;

drop procedure Tag_SelectByConsultantId



/*

select * from dbo.__MigrationHistory;


delete from dbo.__MigrationHistory

where MigrationID > 635478384701170000;


drop table __MigrationHistory;



IF EXISTS (SELECT *
 
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'dbo.__MigrationHistory')

			 AND type in (N'U'))

DROP TABLE dbo.__MigrationHistory;



IF EXISTS (SELECT *
 
		FROM sys.objects
 
		WHERE object_id = OBJECT_ID(N'dbo.ConsultantTag')

			 AND type in (N'U'))

DROP TABLE  dbo.ConsultantTag;



IF EXISTS (SELECT *
 
		FROM sys.objects
 
		WHERE object_id = OBJECT_ID(N'dbo.Tags')

			 AND type in (N'U'))

DROP TABLE  dbo.Tags;


IF EXISTS (SELECT *
 
		FROM sys.objects
 
		WHERE object_id = OBJECT_ID(N'dbo.UserType')

			 AND type in (N'U'))

DROP TABLE  dbo.UserType;



IF EXISTS (SELECT *
 
		FROM sys.objects
 
		WHERE object_id = OBJECT_ID(N'dbo.UserStatus')

			 AND type in (N'U'))

DROP TABLE  dbo.UserStatus;



IF EXISTS (SELECT *
 
		FROM sys.objects
 
		WHERE object_id = OBJECT_ID(N'dbo.Resumes')

			 AND type in (N'U'))

DROP TABLE  dbo.Resumes;




IF EXISTS (SELECT *
 
		FROM sys.objects
 
		WHERE object_id = OBJECT_ID(N'dbo.Types')
			 AND type in (N'U'))

DROP TABLE  dbo.Types;



IF EXISTS (SELECT *
 
		FROM sys.objects
 
		WHERE object_id = OBJECT_ID(N'dbo.Memberships')

			 AND type in (N'U'))

DROP TABLE  dbo.Memberships

;

IF EXISTS (SELECT *
 
		FROM sys.objects
 
		WHERE object_id = OBJECT_ID(N'dbo.Users')

			 AND type in (N'U'))

DROP TABLE  dbo.Users;




IF EXISTS (SELECT *
 
		FROM sys.objects

		WHERE object_id = OBJECT_ID(N'dbo.Resume_SelectMetadataByUserId')

			AND type IN ( N'P', N'PC'))

DROP PROCEDURE dbo.Resume_SelectMetadataByUserId
;


IF EXISTS (SELECT * 

		FROM sys.objects

		WHERE object_id = OBJECT_ID(N'dbo.Resume_SelectByUserId')

			AND type IN ( N'P', N'PC' ) )

DROP PROCEDURE dbo.Resume_SelectByUserId
;



IF EXISTS (SELECT *
 
		FROM sys.objects

		WHERE object_id = OBJECT_ID(N'dbo.Resume_Insert')

			AND type IN ( N'P', N'PC' ) )

DROP PROCEDURE dbo.Resume_Insert
;



IF EXISTS (SELECT *
 
		FROM sys.objects

		WHERE object_id = OBJECT_ID(N'dbo.Tag_SelectByConsultantId')

			AND type IN ( N'P', N'PC' ) )

DROP PROCEDURE dbo.Tag_SelectByConsultantId
;



IF EXISTS (SELECT *
 
		FROM sys.objects

		WHERE object_id = OBJECT_ID(N'dbo.User_SelectIdByEmailAddress')

			AND type IN ( N'P', N'PC' ) )

DROP PROCEDURE dbo.User_SelectIdByEmailAddress;


IF EXISTS (SELECT *
 
		FROM sys.objects

		WHERE object_id = OBJECT_ID(N'dbo.User_SelectByEmailAddress')

			AND type IN ( N'P', N'PC' ) )

DROP PROCEDURE dbo.User_SelectByEmailAddress
;


IF EXISTS (SELECT *
 
		FROM sys.objects

		WHERE object_id = OBJECT_ID(N'dbo.User_SelectById')

			AND type IN ( N'P', N'PC' ) )

DROP PROCEDURE dbo.User_SelectById
;


IF EXISTS (SELECT * 

		FROM sys.objects

		WHERE object_id = OBJECT_ID(N'dbo.User_Insert')

			AND type IN ( N'P', N'PC' ) )

DROP PROCEDURE dbo.User_Insert
;


IF EXISTS (SELECT * 

		FROM sys.objects

		WHERE object_id = OBJECT_ID(N'dbo.User_UpdateContactInfo')

			AND type IN ( N'P', N'PC' ) )

DROP PROCEDURE dbo.User_UpdateContactInfo;

*/



