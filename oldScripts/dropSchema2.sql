/***Drop Tables&Procedures 2.0***/
ALTER TABLE ConsultantTag DROP CONSTRAINT FK_ConsultantTag_Users;
ALTER TABLE ConsultantTag DROP CONSTRAINT FK_ConsultantTag_Tags;
ALTER TABLE ConsultantTag DROP CONSTRAINT IX_UserType_UserId;
ALTER TABLE Tags DROP CONSTRAINT IX_Tag_IsCanonical;
ALTER TABLE Resumes DROP CONSTRAINT FK_Resume_Users;
ALTER TABLE Resumes DROP CONSTRAINT IX_Resume_UserId;
ALTER TABLE UserStatus DROP CONSTRAINT FK_UserStatus_Users;
ALTER TABLE UserType DROP CONSTRAINT FK_UserType_Users;
ALTER TABLE UserType DROP CONSTRAINT FK_UserType_Types;
ALTER TABLE Membershis DROP CONSTRAINT FK_Memberships_Users;
ALTER TABLE Users DROP CONSTRAINT IX_Users_EmailAddress;
DROP TABLE ConsultantTag;
DROP TABLE Tags;
DROP TABLE Resumes;
DROP TABLE UserStatus;
DROP TABLE UserType;
DROP TABLE AccountTypes;
DROP TABLE Memberships;
DROP TABLE Users;
DROP PROCEDURE User_SelectIdByEmail;
DROP PROCEDURE User_SelectIdByEmailAddress;
DROP PROCEDURE User_SelectByEmail;
DROP PROCEDURE User_SelectByEmailAddress;
DROP PROCEDURE User_SelectById;
DROP PROCEDURE User_Insert;
DROP PROCEDURE User_UpdateContactInfo;
DROP PROCEDURE User_SelectByKeyword;
DROP PROCEDURE UserStatus_Update;
DROP PROCEDURE Tag_Insert;
DROP PROCEDURE Tag_SelectByConsultantId;
/***
select * from dbo.__MigrationHistory;
delete from dbo.__MigrationHistory where MigrationID > 635478384701170000;
drop table __MigrationHistory;
***/