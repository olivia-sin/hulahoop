USE [SogetiSkills]
GO
/****** Object:  Table [dbo].[UserStatus]    Script Date: 10/2/14 7:31:59 PM ******/
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
ALTER TABLE [dbo].[UserStatus]  WITH CHECK ADD  CONSTRAINT [FK_UserStatus_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserStatus] CHECK CONSTRAINT [FK_UserStatus_Users]
GO
