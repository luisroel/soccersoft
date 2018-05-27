USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Insert_Position]'))
	DROP PROCEDURE [dbo].[spCore_Insert_Position]
GO

CREATE PROCEDURE [dbo].[spCore_Insert_Position]
	  @Position	VARCHAR(30)
	, @Abbrev	VARCHAR(5)
	, @UserId	BIGINT
	, @Msg		VARCHAR(255) OUTPUT
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
	IF EXISTS(SELECT * FROM [dbo].[tbCore_Position] [SO] WHERE [SO].[Position] = @Position)
		SELECT
			@Msg = 'Position already exist. Please verify!'
	ELSE
		INSERT [dbo].[tbCore_Position] ( 
			  [Position]
			, [Abbrev]
			, [IsActive]
			, [EntryUserId]
			, [EntryDate]
			, [ModUserId]
			, [ModDate]
		 ) VALUES (
		 	  @Position
			, @Abbrev
			, 1
			, @UserId
			, @Date
			, @UserId
			, @Date
		)
END
