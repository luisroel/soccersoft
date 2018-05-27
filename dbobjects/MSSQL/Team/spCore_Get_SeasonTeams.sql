USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Get_SeasonTeams]'))
	DROP PROCEDURE [dbo].[spCore_Get_SeasonTeams]
GO

CREATE PROCEDURE [dbo].[spCore_Get_SeasonTeams]
	@SeasonId BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT 
			  [TM].[TeamId]
			, [TM].[ShortName]
		FROM 
			[dbo].[tbCore_SeasonTeam] [ST]
			INNER JOIN [dbo].[tbCore_Team] [TM] ON
				[ST].[TeamId] = [ST].[TeamId]
		WHERE
			[ST].[SeasonId] = @SeasonId
		ORDER BY
			[TM].[ShortName]
END
