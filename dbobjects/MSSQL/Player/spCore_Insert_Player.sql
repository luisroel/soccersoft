USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Insert_Player]'))
	DROP PROCEDURE [dbo].[spCore_Insert_Player]
GO

CREATE PROCEDURE [dbo].[spCore_Insert_Player]
	  @NickName		VARCHAR(30)
	, @FirstName	VARCHAR(30)
	, @MiddleName	VARCHAR(30)
	, @LastName		VARCHAR(30)
	, @PositionId	BIGINT
	, @BirthDate	DATETIME
	, @CountryId	BIGINT
	, @UserId		BIGINT
	, @Msg			VARCHAR(255) OUTPUT
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
	IF EXISTS(SELECT * FROM [dbo].[tbCore_Player] [CC] WHERE [CC].[FirstName] = @FirstName AND [CC].[LastName] = @LastName)
		SELECT
			@Msg = 'Player already exist. Please verify!'
	ELSE
		INSERT [dbo].[tbCore_Player] ( 
			  [NickName]
			, [FirstName]
			, [MiddleName]
			, [LastName]
			, [PositionId]
			, [IsActive]
			, [BirthDate]
			, [CountryId]
			, [EntryUserId]
			, [EntryDate]
			, [ModUserId]
			, [ModDate]
		 ) VALUES (
		 	  @NickName
			, @FirstName
			, @MiddleName
			, @LastName
			, @PositionId
			, 1
			, @BirthDate
			, @CountryId
			, @UserId
			, @Date
			, @UserId
			, @Date
		)
END
