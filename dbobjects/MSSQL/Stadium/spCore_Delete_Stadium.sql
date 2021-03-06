USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Delete_Stadium]'))
	DROP PROCEDURE [dbo].[spCore_Delete_Stadium]
GO

CREATE PROCEDURE [dbo].[spCore_Delete_Stadium]
      @StadiumId	BIGINT
	, @Msg			VARCHAR(255) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
		@Msg = ''

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_Stadium] [CC] WHERE [CC].[StadiumId] = @StadiumId)
		SELECT
			@Msg = 'Stadium does not exist. Please verify!'
	ELSE
		DELETE FROM [dbo].[tbCore_Stadium] WHERE [StadiumId] = @StadiumId
END
