USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Delete_Stat]'))
	DROP PROCEDURE [dbo].[spCore_Delete_Stat]
GO

CREATE PROCEDURE [dbo].[spCore_Delete_Stat]
      @StatId	BIGINT
	, @Msg			VARCHAR(255) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
		@Msg = ''

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_Stat] [CC] WHERE [CC].[StatId] = @StatId)
		SELECT
			@Msg = 'Stat does not exist. Please verify!'
	ELSE
		DELETE FROM [dbo].[tbCore_Stat] WHERE [StatId] = @StatId
END
