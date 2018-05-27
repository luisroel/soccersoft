DROP VIEW IF EXISTS vwCore_Get_FixtureList;
CREATE VIEW vwCore_Get_FixtureList AS
SELECT
	  AA.AssociationId
	, AA.ShortName		AS `Association`
    , TT.TournamentId
    , TT.ShortName		AS `Tournament`
	, FT.FixtureId
	, FT.SeasonId
	, SS.ShortName		AS `Season`
	, FT.PhaseId
	, PH.ShortName		AS `Phase`
	, FT.Round
	, FT.Time
	, FT.HomeTeamId
	, TH.ShortName		AS `Home`
	, FT.ScoredHome
	, FT.VisitorTeamId
	, TV.ShortName		AS `Visitor`
	, FT.ScoredVisitor
	, FT.StadiumId
	, ST.ShortName		AS `Stadium`
	, FT.RefereeId
	, RF.NickName		AS `Referee`
	, FT.FixtureStatusId
	, FS.ShortName		AS `Status`
	, FT.Odd_1
	, FT.Odd_X
	, FT.Odd_2
	, FT.WeekNo
    , FT.Tendency
	, FT.EntryDate
	, FT.EntryUserId
	, U1.Username AS EntryUser
	, FT.ModDate
	, FT.ModUserId
	, U2.Username AS ModUser
FROM 
	tbCore_Fixture FT
	INNER JOIN tbCore_Season SS ON
		SS.SeasonId = FT.SeasonId
	INNER JOIN tbCore_Phase	PH ON
		PH.PhaseId = FT.PhaseId
	INNER JOIN tbCore_Team TH ON
		TH.TeamId = FT.HomeTeamId
	INNER JOIN tbCore_Team TV ON
		TV.TeamId = FT.VisitorTeamId
	INNER JOIN tbCore_Tournament TT ON
		TT.TournamentId = SS.TournamentId
	INNER JOIN tbCore_Association AA ON
		AA.AssociationId = TT.AssociationId
    INNER JOIN tbCore_Stadium ST ON
		ST.StadiumId = FT.StadiumId
	INNER JOIN tbCore_Referee RF ON
		RF.RefereeId = FT.RefereeId
	INNER JOIN tbCore_FixtureStatus FS ON
		FS.FixtureStatusId = FT.FixtureStatusId
	INNER JOIN tbSecurity_User U1 ON
		U1.UserId = FT.EntryUserId
	INNER JOIN tbSecurity_User U2 ON
		U2.UserId = FT.ModUserId;