USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Delete_Confederation]'))
	DROP PROCEDURE [dbo].[spCore_Delete_Confederation]
GO

CREATE PROCEDURE [dbo].[spCore_Delete_Confederation]
      @ConfederationId	BIGINT
	, @Msg				VARCHAR(255) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
		@Msg = ''

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_Confederation] [CC] WHERE [CC].[ConfederationId] = @ConfederationId)
		SELECT
			@Msg = 'Confederation does not exist. Please verify!'
	ELSE
		DELETE FROM [dbo].[tbCore_Confederation] WHERE [ConfederationId] = @ConfederationId
END
