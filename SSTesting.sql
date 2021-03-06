USE [master]
GO
/****** Object:  Database [SogetiSkills]    Script Date: 10/3/14 4:45:07 AM ******/
CREATE DATABASE [SogetiSkills]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SogetiSkills', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SogetiSkills.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SogetiSkills_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SogetiSkills_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SogetiSkills] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SogetiSkills].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SogetiSkills] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SogetiSkills] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SogetiSkills] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SogetiSkills] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SogetiSkills] SET ARITHABORT OFF 
GO
ALTER DATABASE [SogetiSkills] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SogetiSkills] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SogetiSkills] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SogetiSkills] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SogetiSkills] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SogetiSkills] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SogetiSkills] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SogetiSkills] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SogetiSkills] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SogetiSkills] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SogetiSkills] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SogetiSkills] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SogetiSkills] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SogetiSkills] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SogetiSkills] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SogetiSkills] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SogetiSkills] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SogetiSkills] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SogetiSkills] SET  MULTI_USER 
GO
ALTER DATABASE [SogetiSkills] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SogetiSkills] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SogetiSkills] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SogetiSkills] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SogetiSkills] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SogetiSkills]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [bigint] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Script] [nvarchar](max) NOT NULL,
	[DateAppliedUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsultantTag]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultantTag](
	[UserId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[UserId] [int] NOT NULL,
	[Password_Hash] [nvarchar](max) NOT NULL,
	[Password_Salt] [nvarchar](max) NOT NULL,
	[LastLogin] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resumes]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resumes](
	[ResumeId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FileData] [varbinary](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[MimeType] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ResumeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[Keyword] [nvarchar](450) NOT NULL,
	[SkillDescription] [nvarchar](max) NULL,
	[IsCanonical] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[Permission] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NOT NULL,
	[EmailAddress] [nvarchar](256) NOT NULL,
	[PhoneNumber] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserStatus]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStatus](
	[UserId] [int] NOT NULL,
	[IsOnBeach] [bit] NOT NULL DEFAULT ((0)),
	[DateFrom] [date] NOT NULL,
	[DateTo] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[IsOnBeach] ASC,
	[DateFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserType]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[UserId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[DateFrom] [date] NOT NULL,
	[DateTo] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_ConsultantTag_UserId]    Script Date: 10/3/14 4:45:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_ConsultantTag_UserId] ON [dbo].[ConsultantTag]
(
	[UserId] ASC
)
INCLUDE ( 	[TagId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Resume_UserId]    Script Date: 10/3/14 4:45:07 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Resume_UserId] ON [dbo].[Resumes]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Tag_IsCanonical]    Script Date: 10/3/14 4:45:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tag_IsCanonical] ON [dbo].[Tags]
(
	[IsCanonical] ASC
)
INCLUDE ( 	[Keyword]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Users_EmailAddress]    Script Date: 10/3/14 4:45:07 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_EmailAddress] ON [dbo].[Users]
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[__MigrationHistory] ADD  DEFAULT (getutcdate()) FOR [DateAppliedUtc]
GO
ALTER TABLE [dbo].[ConsultantTag]  WITH CHECK ADD  CONSTRAINT [FK_ConsultantTag_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[ConsultantTag] CHECK CONSTRAINT [FK_ConsultantTag_Tags]
GO
ALTER TABLE [dbo].[ConsultantTag]  WITH CHECK ADD  CONSTRAINT [FK_ConsultantTag_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[ConsultantTag] CHECK CONSTRAINT [FK_ConsultantTag_Users]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [FK_Memberships_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [FK_Memberships_Users]
GO
ALTER TABLE [dbo].[Resumes]  WITH CHECK ADD  CONSTRAINT [FK_Resume_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Resumes] CHECK CONSTRAINT [FK_Resume_Users]
GO
ALTER TABLE [dbo].[UserStatus]  WITH CHECK ADD  CONSTRAINT [FK_UserStatus_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserStatus] CHECK CONSTRAINT [FK_UserStatus_Users]
GO
ALTER TABLE [dbo].[UserType]  WITH CHECK ADD  CONSTRAINT [FK_UserType_Types] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Types] ([TypeId])
GO
ALTER TABLE [dbo].[UserType] CHECK CONSTRAINT [FK_UserType_Types]
GO
ALTER TABLE [dbo].[UserType]  WITH CHECK ADD  CONSTRAINT [FK_UserType_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserType] CHECK CONSTRAINT [FK_UserType_Users]
GO
/****** Object:  StoredProcedure [dbo].[Tag_Insert]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Tag_Insert]
(
    @keyword			nvarchar(128),
	@skillDescription	nvarchar(max)
)
AS

INSERT into dbo.Tags
	(
		Keyword,
		SkillDescription,
		IsCanonical
	)
VALUES
	(
		 @keyword,
		 @skillDescription,
		 1
	)
GO
/****** Object:  StoredProcedure [dbo].[Tag_SelectByConsultantId]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Tag_SelectByConsultantId]
(
	@consultantId int
)
AS

SELECT
	T.TagId,
	T.Keyword,
	T.SkillDescription,
	IsCanonical
FROM
	ConsultantTag CT
INNER JOIN
	Tags T ON CT.TagId = T.TagId
WHERE
	CT.UserId = @consultantId
GO
/****** Object:  StoredProcedure [dbo].[User_Insert]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Insert]
(
	@emailAddress	nvarchar(max),
	@firstName	 	nvarchar(max),
	@lastName 		nvarchar(max),
	@phoneNumber 	nvarchar(max),
	@passwordHash 	nvarchar(max),
	@passwordSalt 	nvarchar(max),
	@userType		nvarchar(max)
)	
AS
    -- declare variables --
	DECLARE 
	@now date = getutcdate(),
	@userId int   -- return value of sp call

BEGIN
    INSERT INTO dbo.Users
			(
				FirstName, 
				LastName, 
				EmailAddress, 
				PhoneNumber
			)
			VALUES
			(
				@firstName,
				@lastName, 
				@emailAddress, 
				@phoneNumber
			);

    SET @userId=SCOPE_IDENTITY();

    INSERT INTO dbo.Memberships
			(
				UserId, 
				Password_Hash, 
				Password_Salt, 
				LastLogin
			)
			VALUES 
			(
				@userId, 
				@passwordHash, 
				@passwordSalt, 
				@now
			);

    IF (@usertype = 'CONSULTANT')
	BEGIN
        INSERT into dbo.UserType
			(
				UserId,
				TypeId,
				DateFrom
			)
			VALUES
			(
				@userId,
				1,
				@now
			);
		INSERT into dbo.UserStatus
			(
				UserId,
				IsOnBeach,
				DateFrom
			)
			VALUES
			(
				@userId,
				0,
				@now
			);
	END
		ELSE
		BEGIN
			IF (@usertype = 'ACCOUNT_EXECUTIVE')
			BEGIN
			INSERT into dbo.UserType
				(
					UserId,
					TypeId,
					DateFrom
				)
				VALUES
				(
					@userId,
					2,
					@now
				)
			END
        END
END

GO
/****** Object:  StoredProcedure [dbo].[User_SelectByEmailAddress]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_SelectByEmailAddress]
(
	@emailAddress nvarchar(256)
)
AS

SELECT TOP 1
	U.UserId,
	U.EmailAddress,
	U.FirstName,
	U.LastName,
	U.PhoneNumber,
	M.Password_Hash,
	M.Password_Salt,
	T.TypeName,
	S.IsOnBeach
FROM
    dbo.Users U INNER JOIN dbo.Memberships M ON U.UserId = M.UserId 
                INNER JOIN dbo.UserType US ON M.UserId = US.UserId 
				INNER JOIN dbo.Types T ON US.TypeId = T.TypeId
                LEFT OUTER JOIN dbo.UserStatus S ON US.UserId = S.UserId 
WHERE
	U.EmailAddress = @emailAddress
GO
/****** Object:  StoredProcedure [dbo].[User_SelectById]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_SelectById]
(
	@userId int
)
AS
SELECT TOP 1
	U.UserId,
	U.EmailAddress,
	U.FirstName,
	U.LastName,
	U.PhoneNumber,
	M.Password_Hash,
	M.Password_Salt,
	T.TypeName,
	S.IsOnBeach
FROM
    dbo.Users U INNER JOIN dbo.Memberships M ON U.UserId = M.UserId 
                INNER JOIN dbo.UserType US ON M.UserId = US.UserId 
				INNER JOIN dbo.Types T ON US.TypeId = T.TypeId
                LEFT OUTER JOIN dbo.UserStatus S ON US.UserId = S.UserId 
WHERE
	U.UserId = @userId
GO
/****** Object:  StoredProcedure [dbo].[User_SelectByKeyword]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_SelectByKeyword]
(
	@keyword nvarchar(128)
)
AS

SELECT
	U.FirstName,
	U.LastName,
	U.EmailAddress
FROM
	dbo.Users U
INNER JOIN
	ConsultantTag CT ON U.UserId = CT.UserId
INNER JOIN
	Tags T ON CT.TagId = T.TagId
WHERE
	T.Keyword = @keyword
GO
/****** Object:  StoredProcedure [dbo].[User_SelectIdByEmailAddress]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_SelectIdByEmailAddress]
(
	@emailAddress nvarchar(max)
)
AS

SELECT TOP 1
	U.UserId
FROM
	dbo.Users U
WHERE
	U.EmailAddress = @emailAddress
GO
/****** Object:  StoredProcedure [dbo].[User_UpdateContactInfo]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_UpdateContactInfo]
(
    @userId         int,
	@emailAddress	nvarchar(max),
	@firstName	 	nvarchar(max),
	@lastName 		nvarchar(max),
	@phoneNumber 	nvarchar(max)
)
AS

UPDATE 
	dbo.Users
SET 
	FirstName = @firstName,
	LastName = @lastName,
	EmailAddress = @emailAddress,
	PhoneNumber = @phoneNumber
WHERE
	UserId = @userId
GO
/****** Object:  StoredProcedure [dbo].[UserStatus_Update]    Script Date: 10/3/14 4:45:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserStatus_Update]
(
    @userId		int,
	@isOnBeach	bit
)
AS

UPDATE 
	dbo.UserStatus
SET 
	IsOnBeach = @isOnBeach,
	DateFrom = getutcdate()
WHERE
	UserId = @userId
GO
USE [master]
GO
ALTER DATABASE [SogetiSkills] SET  READ_WRITE 
GO
