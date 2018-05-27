USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Get_AvailableTeams]'))
	DROP PROCEDURE [dbo].[spCore_Get_AvailableTeams]
GO

CREATE PROCEDURE [dbo].[spCore_Get_AvailableTeams]
	  @AssociationId	BIGINT
	, @SeasonId			BIGINT
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
			[dbo].[tbCore_Team] [TM]
		WHERE
			[TM].[AssociationId] = @AssociationId
			AND NOT [TM].[TeamId] IN (
				SELECT [TS].[TeamId] FROM [dbo].[tbCore_SeasonTeam] [TS] WHERE [TS].[SeasonId] = @SeasonId
			)
		ORDER BY
			[TM].[ShortName]
END
