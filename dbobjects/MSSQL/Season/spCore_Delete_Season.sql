USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Delete_Season]'))
	DROP PROCEDURE [dbo].[spCore_Delete_Season]
GO

CREATE PROCEDURE [dbo].[spCore_Delete_Season]
	  @SeasonId		BIGINT
	, @Msg			VARCHAR(255) OUTPUT
AS
BEGIN
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
		@Msg = ''

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_Season] [CC] WHERE [CC].[SeasonId] = @SeasonId)
		SELECT
			@Msg = 'Season does not exist. Please verify!'
	ELSE
		DELETE FROM [dbo].[tbCore_Season] WHERE [SeasonId] = @SeasonId
END
