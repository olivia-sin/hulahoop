INSERT INTO dbo.Types
	(
		TypeName,
		Permission
	)
	VALUES 
	(
		'CONSULTANT',
		'Can only view and change own information'
	),
	(
		'ACCOUNT_EXECUTIVE',
		'Can only change own information; Can view public consultant data'
	)

SELECT * from dbo.Types