USE [SogetiSkills]
GO
/****** Object:  StoredProcedure [dbo].[User_SelectById]    Script Date: 10/2/14 7:31:59 PM ******/
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
