/*
SQL initializes tables
*/

/* Person */
CREATE TABLE User 
(
	UserId      int           NOT NULL PRIMARY KEY IDENTITY(1,1),
	FirstName	nvarchar(256) NOT NULL,
	LastName	nvarchar(256) NOT NULL,
	Email		nvarchar(256) NOT NULL,
	PhoneNumber	char(10)      NOT NULL,
);
CREATE UNIQUE INDEX IX_Users_EmailAddress ON Users(EmailAddress);

/* Authentication */
CREATE TABLE Membership(
	UserId	        int		PRIMARY KEY,
	Password_Hash	nvarchar(max)	NOT NULL,
	Password_Salt	nvarchar(max)	NOT NULL,
	LastLogin	    date	
);

/* User Type- Account Executive or Consultant, also their permissions */
CREATE TABLE Type(
	TypeId	    int	PRIMARY KEY IDENTITY(1,1),
	TypeName	nvarchar(50)	NOT NULL,
    Permissions nvarchar(max)   NOT NULL
);

/* Type for User */
CREATE TABLE UserType(
	UserId	    int	    NOT NULL,
	TypeId	    int	    NOT NULL,
	DateFrom	date	NOT NULL,
	DateTo	    date,
	PRIMARY KEY (UserId, TypeId)
	CONSTRAINT FK_UserType_User FOREIGN KEY (UserId) REFERENCES User(UserId),
	CONSTRAINT FK_UserType_Type FOREIGN KEY (TypeId) REFERENCES Type(TypeId)
);

/* User Beach Status */
CREATE TABLE UserStatus(
	UserId	    int	    NOT NULL,
    IsOnBeach   bit     NOT NULL DEFAULT 0,
	DateFrom	date	NOT NULL,
	DateTo	    date,
	PRIMARY KEY (UserId, IsOnBeach, DateFrom)
	CONSTRAINT FK_UserStatus_User FOREIGN KEY (UserId) REFERENCES User(UserId)
);

/* Resume */
CREATE TABLE Resume
(
	ResumeId   INT             NOT NULL PRIMARY KEY IDENTITY(1, 1),
	UserId     int             NOT NULL,
	FileData   varbinary(max)  NULL,
	[FileName] nvarchar(max)   NULL,
	MimeType   nvarchar(max)   NULL,
	CONSTRAINT FK_Resume_User FOREIGN KEY (UserId) REFERENCES User(Id)
);
CREATE UNIQUE INDEX IX_Resume_UserId ON Resume(UserId); -- A user can only have one resume.

/* Skill with keywords */
CREATE TABLE Tag
(
	TagId              int NOT NULL PRIMARY KEY IDENTITY(1, 1),
	Keyword            nvarchar(450) NOT NULL,
	SkillDescription   nvarchar(max) NULL,
	IsCanonical        bit NOT NULL
);
CREATE INDEX IX_Tag_IsCanonical ON Tag(IsCanonical) INCLUDE(Keyword);

/* Skills of consultants */
CREATE TABLE ConsultantTag
(
	UserId     int NOT NULL,
	TagId      int NOT NULL,
	PRIMARY KEY (UserId, TagId),
	CONSTRAINT FK_ConsultantTag_User FOREIGN KEY (UserId) REFERENCES User(UserId),
	CONSTRAINT FK_ConsultantTag_Tag FOREIGN KEY (TagId) REFERENCES Tag(TagId)
);
CREATE INDEX IX_ConsultantTag_UserId ON ConsultantTag(UserId) INCLUDE(TagId);

/* Proficiency Levels for skills */

/* tracks SQL database migration */
 CREATE TABLE __MigrationHistory
                      (
                          MigrationId bigint NOT NULL PRIMARY KEY,
                          Name nvarchar(MAX) NOT NULL,
                          Script nvarchar(MAX) NOT NULL,
                          DateAppliedUtc datetime NOT NULL DEFAULT GETUTCDATE()
                      );