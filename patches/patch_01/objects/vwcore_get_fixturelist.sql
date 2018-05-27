drop view if exists`vwcore_get_fixturelist`;
create view`vwcore_get_fixturelist` 
as 
	select
		  `aa`.`associationId` 	as `associationId`
        , `aa`.`ShortName` 		as `association`
        , `tt`.`TournamentId` 	as `TournamentId`
        , `tt`.`ShortName` 		as `Tournament`
        , `ft`.`FixtureId` 		as `FixtureId`
        , `ft`.`SeasonId` 		as `SeasonId`
        , `ss`.`ShortName` 		as `Season`
        , `ft`.`PhaseId` 		as `PhaseId`
        , `ph`.`ShortName` 		as `Phase`
        , `ft`.`Round` 			as `Round`
        , `ft`.`Time` 			as `Time`
        , `ft`.`HomeTeamId` 	as `HomeTeamId`
        , `th`.`ShortName` 		as `Home`
        , `ft`.`ScoredHome` 	as `ScoredHome`
        , `ft`.`VisitorTeamId` 	as `VisitorTeamId`
        , `tv`.`ShortName` 		as `Visitor`
        , `ft`.`ScoredVisitor` 	as `ScoredVisitor`
        , `ft`.`StadiumId` 		as `StadiumId`
        , `st`.`ShortName` 		as `Stadium`
        , `ft`.`RefereeId` 		as `RefereeId`
        , `rf`.`NickName` 		as `Referee`
        , `ft`.`FixtureStatusId` as `FixtureStatusId`
        , `fs`.`ShortName` 		as `Status`
        , `ft`.`Odd_1` 			as `Odd_1`
        , `ft`.`Odd_X` 			as `Odd_X`
        , `ft`.`Odd_2` 			as `Odd_2`
        , `ft`.`WeekNo` 		as `WeekNo`
        , fnutil_get_tendency(`ft`.`odd_1`, `ft`.`aodd_1`, `ft`.`odd_x`, `ft`.`aodd_x`, `ft`.`odd_2`, `ft`.`aodd_2`) as `Tendency`
        , `ft`.`EntryDate` 		as `EntryDate`
        , `ft`.`EntryUserId` 	as `EntryUserId`
        , `u1`.`UserName` 		as `EntryUser`
        , `ft`.`ModDate` 		as `ModDate`
        , `ft`.`ModUserId` 		as `ModUserId`
        , `u2`.`UserName` 		as `ModUser` 
	from
		`tbcore_fixture` `ft` 
        inner join `tbcore_season` `ss` on
			`ss`.`SeasonId` = `ft`.`SeasonId`
        inner join `tbcore_phase` `ph` on
			`ph`.`PhaseId` = `ft`.`PhaseId`
		inner join `tbcore_team` `th` on
			`th`.`TeamId` = `ft`.`HomeTeamId`
		inner join `tbcore_team` `tv` on
			`tv`.`TeamId` = `ft`.`VisitorTeamId`
		inner join `tbcore_tournament` `tt` on
			`tt`.`TournamentId` = `ss`.`TournamentId`
		inner join `tbcore_association` `aa` on
			`aa`.`associationId` = `tt`.`associationId`
		inner join `tbcore_stadium` `st` on
			`st`.`StadiumId` = `ft`.`StadiumId`
		inner join `tbcore_referee` `rf` on
			`rf`.`RefereeId` = `ft`.`RefereeId`
		inner join `tbcore_fixturestatus` `fs` on
			`fs`.`FixtureStatusId` = `ft`.`FixtureStatusId`
		inner join `tbsecurity_user` `u1` on
			`u1`.`UserId` = `ft`.`EntryUserId`
		inner join `tbsecurity_user` `u2` on
			`u2`.`UserId` = `ft`.`ModUserId`;
