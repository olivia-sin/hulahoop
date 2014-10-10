CREATE TABLE dbo.Users 
(
	UserId       int           NOT NULL PRIMARY KEY IDENTITY(1,1),
	FirstName	 nvarchar(256) NOT NULL,
	LastName	 nvarchar(256) NOT NULL,
	EmailAddress nvarchar(256) NOT NULL,
	PhoneNumber	 char(10)      NOT NULL,
);
CREATE UNIQUE INDEX IX_Users_EmailAddress ON Users(EmailAddress);

CREATE TABLE dbo.Memberships
(
	UserId	        int		PRIMARY KEY,
	Password_Hash	nvarchar(max)	NOT NULL,
	Password_Salt	nvarchar(max)	NOT NULL,
	LastLogin	    date,
	CONSTRAINT FK_Memberships_Users FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

CREATE TABLE dbo.AccountTypes
(
	TypeId	    int	PRIMARY KEY IDENTITY(1,1),
	Description	nvarchar(450)	NOT NULL
);

CREATE TABLE dbo.UserType
(
	UserId	    int	    NOT NULL,
	TypeId	    int	    NOT NULL,
    timestamp,
	PRIMARY KEY (UserId, TypeId),
	CONSTRAINT FK_UserType_Users FOREIGN KEY (UserId) REFERENCES Users(UserId),
	CONSTRAINT FK_UserType_Types FOREIGN KEY (TypeId) REFERENCES Types(TypeId)
);

CREATE TABLE dbo.UserStatus
(
	UserId	    int	    NOT NULL,
    IsOnBeach   bit     NOT NULL DEFAULT 0,
    timestamp,
	PRIMARY KEY (UserId, IsOnBeach, timestamp),
	CONSTRAINT FK_UserStatus_Users FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

CREATE TABLE dbo.Resumes
(
	ResumeId   INT             NOT NULL PRIMARY KEY IDENTITY(1, 1),
	UserId     int             NOT NULL,
	FileData   varbinary(max)  NULL,
	[FileName] nvarchar(max)   NULL,
	MimeType   nvarchar(max)   NULL,
	CONSTRAINT FK_Resume_Users FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
CREATE UNIQUE INDEX IX_Resume_UserId ON Resumes(UserId); -- A user can only have one resume.

CREATE TABLE dbo.Tags
(
	TagId              int NOT NULL PRIMARY KEY IDENTITY(1, 1),
	Keyword            nvarchar(450) NOT NULL,
	SkillDescription   nvarchar(max) NULL,
	IsCanonical        bit NOT NULL
);
CREATE INDEX IX_Tag_IsCanonical ON Tags(IsCanonical) INCLUDE(Keyword);

CREATE TABLE dbo.ConsultantTag
(
	UserId     int NOT NULL,
	TagId      int NOT NULL,
	PRIMARY KEY (UserId, TagId),
	CONSTRAINT FK_ConsultantTag_Users FOREIGN KEY (UserId) REFERENCES Users(UserId),
	CONSTRAINT FK_ConsultantTag_Tags FOREIGN KEY (TagId) REFERENCES Tags(TagId)
);
CREATE INDEX IX_ConsultantTag_UserId ON ConsultantTag(UserId) INCLUDE(TagId);

/* Proficiency Levels for skills */