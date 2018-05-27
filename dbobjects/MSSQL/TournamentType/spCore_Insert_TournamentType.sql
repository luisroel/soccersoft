USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Insert_TournamentType]'))
	DROP PROCEDURE [dbo].[spCore_Insert_TournamentType]
GO

CREATE PROCEDURE [dbo].[spCore_Insert_TournamentType]
	  @ShortName	VARCHAR(15)
	, @Name			VARCHAR(50)
	, @UserId		BIGINT
	, @Msg			VARCHAR(255) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Date DATETIME

	SELECT
		  @Date = GETDATE()
		, @Msg = ''

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM [dbo].[tbCore_TournamentType] [SO] WHERE [SO].[ShortName] = @ShortName)
		SELECT
			@Msg = 'TournamentType already exist. Please verify!'
	ELSE
		INSERT [dbo].[tbCore_TournamentType] ( 
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
