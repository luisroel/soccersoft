USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Insert_Season]'))
	DROP PROCEDURE [dbo].[spCore_Insert_Season]
GO

CREATE PROCEDURE [dbo].[spCore_Insert_Season]
	  @SeasonTypeId	BIGINT
	, @ShortName	VARCHAR(55)
	, @Name			VARCHAR(255)
	, @TournamentId	BIGINT
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
	IF EXISTS(SELECT * FROM [dbo].[tbCore_Season] [SO] WHERE [SO].[ShortName] = @ShortName)
		SELECT
			@Msg = 'Season already exist. Please verify!'
	ELSE
	BEGIN
		INSERT [dbo].[tbCore_Season] ( 
			  [SeasonTypeId]
			, [ShortName]
			, [Name]
			, [TournamentId]
		 ) VALUES (
			  @SeasonTypeId
		 	, @ShortName
			, @Name
			, @TournamentId
		)

		UPDATE [dbo].[tbCore_Tournament] SET
			  [ModDate]   = @Date
			, [ModUserId] = @UserId
		WHERE
			[TournamentId] = @TournamentId
	END
END
