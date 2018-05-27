USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Insert_SeasonTeam]'))
	DROP PROCEDURE [dbo].[spCore_Insert_SeasonTeam]
GO

CREATE PROCEDURE [dbo].[spCore_Insert_SeasonTeam]
	  @SeasonId BIGINT
	, @TeamId	BIGINT
	, @Msg		VARCHAR(255) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
		@Msg = ''

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbCore_SeasonTeam] ([SeasonId], [TeamId]) VALUES ( @SeasonId, @TeamId )
END
