USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Insert_Team]'))
	DROP PROCEDURE [dbo].[spCore_Insert_Team]
GO

CREATE PROCEDURE [dbo].[spCore_Insert_Team]
	  @ShortName		VARCHAR(55)
	, @Name				VARCHAR(255)
	, @AssociationId	BIGINT
	, @Alias01			VARCHAR(50)
	, @Alias02			VARCHAR(50)
	, @Alias03			VARCHAR(50)
	, @Alias04			VARCHAR(50)
	, @Alias05			VARCHAR(50)
	, @Alias06			VARCHAR(50)
	, @Alias07			VARCHAR(50)
	, @Alias08			VARCHAR(50)
	, @Alias09			VARCHAR(50)
	, @Alias10			VARCHAR(50)
	, @UserId			BIGINT
	, @Msg				VARCHAR(255) OUTPUT
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
	IF EXISTS(SELECT * FROM [dbo].[tbCore_Team] [SO] WHERE [SO].[ShortName] = @ShortName)
		SELECT
			@Msg = 'Team already exist. Please verify!'
	ELSE
		INSERT [dbo].[tbCore_Team] ( 
			  [ShortName]
			, [Name]
			, [IsActive]
			, [AssociationId]
			, [Alias01]
			, [Alias02]
			, [Alias03]
			, [Alias04]
			, [Alias05]
			, [Alias06]
			, [Alias07]
			, [Alias08]
			, [Alias09]
			, [Alias10]
			, [EntryUserId]
			, [EntryDate]
			, [ModUserId]
			, [ModDate]
		 ) VALUES (
		 	  @ShortName
			, @Name 
			, 1
			, @AssociationId
			, @Alias01
			, @Alias02
			, @Alias03
			, @Alias04
			, @Alias05
			, @Alias06
			, @Alias07
			, @Alias08
			, @Alias09
			, @Alias10
			, @UserId
			, @Date
			, @UserId
			, @Date
		)
END
