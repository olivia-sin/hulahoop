USE [SogetiSkills]
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 10/2/14 7:31:59 PM ******/
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
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [FK_Memberships_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [FK_Memberships_Users]
GO
