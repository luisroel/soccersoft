USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Delete_Tournament]'))
	DROP PROCEDURE [dbo].[spCore_Delete_Tournament]
GO

CREATE PROCEDURE [dbo].[spCore_Delete_Tournament]
      @TournamentId	BIGINT
	, @Msg				VARCHAR(255) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
		@Msg = ''

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_Tournament] [CC] WHERE [CC].[TournamentId] = @TournamentId)
		SELECT
			@Msg = 'Tournament does not exist. Please verify!'
	ELSE
		DELETE FROM [dbo].[tbCore_Tournament] WHERE [TournamentId] = @TournamentId
END
