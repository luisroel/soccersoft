DROP PROCEDURE IF EXISTS spCore_Get_TournamentListByAssociation;
DELIMITER $$
CREATE PROCEDURE [dbo].[spCore_Get_TournamentListByAssociation]
	AssociationId_p BIGINT
AS
BEGIN
    -- Insert statements for procedure here
	SELECT 
		  CC.TournamentId]
		, CC.ShortName]
		, CC.Name]
		, CC.IsActive]
		, CC.AssociationId]
		, CF.ShortName]			AS [AssociationName]
		, CC.EntryDate]
		, CC.EntryUserId]
		, U1.Username] AS [EntryUser]
		, CC.ModDate]
		, CC.ModUserId]
		, U2.[Username] AS [ModUser]
	FROM 
		[dbo].[tbCore_Tournament] [CC]
		INNER JOIN [dbo].[tbCore_Association] [CF] ON
			[CF].[AssociationId] = [CC].[AssociationId]
		INNER JOIN [Credentials].[dbo].[tbSecurity_User] [U1] ON
			[U1].[UserId] = [CC].[EntryUserId]
		INNER JOIN [Credentials].[dbo].[tbSecurity_User] [U2] ON
			[U2].[UserId] = [CC].[ModUserId]
	WHERE 
		    [CC].[AssociationId] = AssociationId_p
		AND [CC].[IsActive] = 1
	ORDER BY
		[CC].[ShortName]
END
