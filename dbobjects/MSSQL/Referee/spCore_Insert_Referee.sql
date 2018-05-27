USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Insert_Referee]'))
	DROP PROCEDURE [dbo].[spCore_Insert_Referee]
GO

CREATE PROCEDURE [dbo].[spCore_Insert_Referee]
	  @NickName		VARCHAR(30)
	, @FirstName	VARCHAR(30)
	, @MiddleName	VARCHAR(30)
	, @LastName		VARCHAR(30)
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
	IF EXISTS(SELECT * FROM [dbo].[tbCore_Referee] [CC] WHERE [CC].[FirstName] = @FirstName AND [CC].[LastName] = @LastName)
		SELECT
			@Msg = 'Referee already exist. Please verify!'
	ELSE
		INSERT [dbo].[tbCore_Referee] ( 
			  [NickName]
			, [FirstName]
			, [MiddleName]
			, [LastName]
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
			, 1
			, @BirthDate
			, @CountryId
			, @UserId
			, @Date
			, @UserId
			, @Date
		)
END
