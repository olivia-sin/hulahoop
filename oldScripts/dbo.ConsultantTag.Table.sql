USE [SogetiSkills]
GO
/****** Object:  Table [dbo].[ConsultantTag]    Script Date: 10/2/14 7:31:59 PM ******/
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
