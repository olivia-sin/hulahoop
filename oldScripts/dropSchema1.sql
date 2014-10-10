/***Drop Tables&Procedures 1.0***/
ALTER TABLE Resumes DROP CONSTRAINT FK_Resume_User;
ALTER TABLE Consultant_Tag DROP CONSTRAINT FK_Consultant_Tag_Users;
ALTER TABLE Consultant_Tag DROP CONSTRAINT FK_Consultant_Tag_Tags;
DROP TABLE Consultant_Tag;
DROP TABLE Tags;
DROP TABLE Resumes;
DROP TABLE Users;
DROP PROCEDURE Resume_SelectMetadataByUserId;
DROP PROCEDURE Resume_SelectByUserId;
DROP PROCEDURE Resume_Insert;
DROP PROCEDURE Tag_SelectByConsultantId;
DROP PROCEDURE User_SelectIdByEmailAddress;
DROP PROCEDURE User_SelectByEmailAddress;
DROP PROCEDURE User_SelectById;
DROP PROCEDURE User_Insert;
DROP PROCEDURE User_UpdateContactInfo;