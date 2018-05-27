USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Delete_Referee]'))
	DROP PROCEDURE [dbo].[spCore_Delete_Referee]
GO

CREATE PROCEDURE [dbo].[spCore_Delete_Referee]
      @RefereeId	BIGINT
	, @Msg			VARCHAR(255) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
		@Msg = ''

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_Referee] [CC] WHERE [CC].[RefereeId] = @RefereeId)
		SELECT
			@Msg = 'Referee does not exist. Please verify!'
	ELSE
		DELETE FROM [dbo].[tbCore_Referee] WHERE [RefereeId] = @RefereeId
END
