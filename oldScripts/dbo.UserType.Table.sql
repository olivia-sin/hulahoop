USE [SogetiSkills]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 10/2/14 7:31:59 PM ******/
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
