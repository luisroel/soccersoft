USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Insert_FixtureType]'))
	DROP PROCEDURE [dbo].[spCore_Insert_FixtureType]
GO

CREATE PROCEDURE [dbo].[spCore_Insert_FixtureType]
	  @ShortName	VARCHAR(15)
	, @Name			VARCHAR(50)
	, @UserId		BIGINT
	, @Msg			VARCHAR(255) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT FixtureTypeements.
	SET NOCOUNT ON;

	DECLARE @Date DATETIME

	SELECT
		  @Date = GETDATE()
		, @Msg = ''

    -- Insert FixtureTypeements for procedure here
	IF EXISTS(SELECT * FROM [dbo].[tbCore_FixtureType] [SO] WHERE [SO].[ShortName] = @ShortName)
		SELECT
			@Msg = 'FixtureType already exist. Please verify!'
	ELSE
		INSERT [dbo].[tbCore_FixtureType] ( 
			  [ShortName]
			, [Name]
			, [IsActive]
			, [EntryUserId]
			, [EntryDate]
			, [ModUserId]
			, [ModDate]
		 ) VALUES (
		 	  @ShortName
			, @Name 
			, 1
			, @UserId
			, @Date
			, @UserId
			, @Date
		)
END
