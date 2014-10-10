USE [master]
GO
/****** Object:  StoredProcedure [sys].[sp_addapprole]    Script Date: 10/2/14 2:50:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [sys].[sp_addapprole]
    @rolename   sysname,        -- name of new app role
    @password   sysname         -- password for app role
as
    -- SETUP RUNTIME OPTIONS / DECLARE VARIABLES --
	set nocount on
	declare @ret        int,    -- return value of sp call
			@stmtR		nvarchar(4000),
			@stmtS		nvarchar(4000)
			
	-- CHECK FOR NULL PASSWORD
	if (@password is null)
	begin
		raiserror(15034,-1,-1)
		return (1)
	end

    -- DISALLOW USER TRANSACTION --
	set implicit_transactions off
	if (@@trancount > 0)
	begin
		raiserror(15002,-1,-1,'sys.sp_addapprole')
		return (1)
	end

	exec @ret = sys.sp_validname @rolename
	if @ret <> 0
		return(1)

	-- create statement to create application role
	set @stmtR = 'create application role '
	set @stmtR = @stmtR + quotename(@rolename, ']')
	set @stmtR = @stmtR + ' with password = '
	set @stmtR = @stmtR + quotename(@password, '''')
	set @stmtR = @stmtR + ', default_schema = '
	set @stmtR = @stmtR + quotename(@rolename, ']')

	-- Create Schema if not one exists with same name and owner
	set @stmtS = 'create schema '
	set @stmtS = @stmtS + quotename(@rolename, ']')
	set @stmtS = @stmtS + ' authorization '
	set @stmtS = @stmtS + quotename(@rolename, ']')
	
	BEGIN TRANSACTION

    -- issue DDL to create the role --
	exec (@stmtR)	
	if @@error <> 0
	begin
		ROLLBACK TRANSACTION
		return (1)
	end

	-- create the Schema if not one exists with same name and owner
	declare @schema_uid int
	declare @owner_uid  int
	select @owner_uid  = principal_id from sys.database_principals where name = @rolename
	select @schema_uid = principal_id from sys.schemas where name = @rolename
	if (@schema_uid is null or		-- there is no schema since if there is one, it will have an owner
		@schema_uid <> @owner_uid)  -- for error message
	begin
		exec (@stmtS)
		if @@error <> 0
		begin
			ROLLBACK TRANSACTION
			return (1)
		end
	end

	COMMIT TRANSACTION

    -- RETURN SUCCESS --
    return (0) -- sp_addapprole
