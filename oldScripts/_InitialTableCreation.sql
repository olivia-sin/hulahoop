/* Person */
CREATE TABLE Users 
(
	UserId       int           NOT NULL PRIMARY KEY IDENTITY(1,1),
	FirstName	 nvarchar(256) NOT NULL,
	LastName	 nvarchar(256) NOT NULL,
	EmailAddress nvarchar(256) NOT NULL,
	PhoneNumber	 char(10)      NOT NULL,
);
CREATE UNIQUE INDEX IX_Users_EmailAddress ON Users(EmailAddress);

/* Authentication */
CREATE TABLE Memberships
(
	UserId	        int		PRIMARY KEY,
	Password_Hash	nvarchar(max)	NOT NULL,
	Password_Salt	nvarchar(max)	NOT NULL,
	LastLogin	    date	
);

/* User Type- Account Executive or Consultant, also their permissions */
CREATE TABLE Types
(
	TypeId	    int	PRIMARY KEY IDENTITY(1,1),
	TypeName	nvarchar(50)	NOT NULL,
    Permissions nvarchar(max)   NOT NULL
);

/* Type for User */
CREATE TABLE UserType
(
	UserId	    int	    NOT NULL,
	TypeId	    int	    NOT NULL,
	DateFrom	date	NOT NULL,
	DateTo	    date,
	PRIMARY KEY (UserId, TypeId)
	CONSTRAINT FK_UserType_Users FOREIGN KEY (UserId) REFERENCES Users(UserId),
	CONSTRAINT FK_UserType_Types FOREIGN KEY (TypeId) REFERENCES Types(TypeId)
);

/* User Beach Status */
CREATE TABLE UserStatus
(
	UserId	    int	    NOT NULL,
    IsOnBeach   bit     NOT NULL DEFAULT 0,
	DateFrom	date	NOT NULL,
	DateTo	    date,
	PRIMARY KEY (UserId, IsOnBeach, DateFrom)
	CONSTRAINT FK_UserStatus_Users FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

/* Resume */
CREATE TABLE Resumes
(
	ResumeId   INT             NOT NULL PRIMARY KEY IDENTITY(1, 1),
	UserId     int             NOT NULL,
	FileData   varbinary(max)  NULL,
	[FileName] nvarchar(max)   NULL,
	MimeType   nvarchar(max)   NULL,
	CONSTRAINT FK_Resume_Users FOREIGN KEY (UserId) REFERENCES Users(Id)
);
CREATE UNIQUE INDEX IX_Resume_UserId ON Resumes(UserId); -- A user can only have one resume.

/* Skill with keywords */
CREATE TABLE Tags
(
	TagId              int NOT NULL PRIMARY KEY IDENTITY(1, 1),
	Keyword            nvarchar(450) NOT NULL,
	SkillDescription   nvarchar(max) NULL,
	IsCanonical        bit NOT NULL
);
CREATE INDEX IX_Tag_IsCanonical ON Tags(IsCanonical) INCLUDE(Keyword);

/* Skills of consultants */
CREATE TABLE ConsultantTag
(
	UserId     int NOT NULL,
	TagId      int NOT NULL,
	PRIMARY KEY (UserId, TagId),
	CONSTRAINT FK_ConsultantTag_Users FOREIGN KEY (UserId) REFERENCES Users(UserId),
	CONSTRAINT FK_ConsultantTag_Tags FOREIGN KEY (TagId) REFERENCES Tags(TagId)
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