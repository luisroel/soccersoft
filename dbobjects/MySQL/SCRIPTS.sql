select `shortname` from `tbcore_association`;
select * from `tbcore_fixturestatus`;

select * from `tbcore_seasonteam` `st` where `st`.`seasonid` = 572;
-- insert into `tbcore_seasonteam` (`seasonid`, `teamid`) values (572, 2800);

select max(fixtureid) from tbCore_Fixture;
select * from tbcore_fixture where fixtureid = 139910;
select * from tbcore_fixture where hometeamid = 503 order by fixtureid desc;

-- change fixture status to fnl for teh following seasons
-- update tbcore_fixture set `fixturestatusid` = 2 where `seasonid` in ( 855 ) and `time` < '2018-3-31 23:59' and fixturestatusid = 1;
-- update `tbcore_fixture` set `fixturestatusid` = 2 where seasonid >= 792 and seasonid <= 816 and `fixturestatusid` = 1 and `time` < '2018-01-27 00:00';

-- Consolidate 2 seasons fixtures in just one season
SELECT * FROM tbCore_Fixture where SeasonId = 469;
-- set @from_season 	= 546;
-- set @from_phase		= 3;
-- set @to_season 		= 853;
-- set @to_phase 		= 1;
-- update tbcore_fixture set `phaseid` = @to_phase, `seasonid` = @to_season where `seasonid` = @from_season and `phaseid` = @from_phase;

-- Move one season to a distint tournament
 set @seasonid 			= 742;
 set @new_tournamentid 	= 256;
-- update `tbcore_season` set `tournamentid` = @new_tournamentid where `seasonid` = @seasonid;

-- Change the phaseid to especific fixtures
-- update `tbcore_fixture` set `phaseId` = 36 where `fixtureid` in ( 199826, 199827, 199828, 199829 );

-- Change time fixture
select * from tbCore_Fixture where seasonid = 567 AND round = 7;
-- update `tbcore_fixture` set `time` = date_add(`time`, interval 7 day) where `seasonid` = 827 and `phaseid` = 1 and `round` > 13;

-- Change season fixture
select * from tbCore_Fixture where seasonid = 525 AND (hometeamid = 682 OR visitorteamid = 682);
-- DELETE from tbCore_Fixture where SeasonId = 525 AND (HomeTeamId = 682 OR VisitorTeamId = 682);

--  Update associationid to the tournament record
select * from tbcore_tournament where tournamentid = 235;
-- update tbcore_tournament set associationId = 99 where tournamentid in (742);
-- delete from tbcore_seasonteam where seasonid = 607;
-- delete from tbCore_Fixture where SeasonId = 607;

--
-- Update the previuos odds with after odds
--
select * from tbcore_fixture where Odd_1 = 1.0 and Odd_2 = 1.0 and Odd_X = 1.0 and (aOdd_1 <> 1.0 or aOdd_2 <> 1.0 or aOdd_X <> 1.0);
-- update tbcore_fixture set Odd_1 = aOdd_1, Odd_2 = aOdd_2, Odd_X = aOdd_X where Odd_1 = 1.0 and Odd_2 = 1.0 and Odd_X = 1.0 and (aOdd_1 <> 1.0 or aOdd_2 <> 1.0 or aOdd_X <> 1.0);

--
-- Update the after odds with previous odds
--
select * from tbcore_fixture where aOdd_1 = 1.0 and aOdd_2 = 1.0 and aOdd_X = 1.0 and (Odd_1 <> 1.0 or Odd_2 <> 1.0 or Odd_X <> 1.0);
-- update tbcore_fixture set aOdd_1 = Odd_1, aOdd_2 = Odd_2, aOdd_X = Odd_X where aOdd_1 = 1.0 and aOdd_2 = 1.0 and aOdd_X = 1.0 and (Odd_1 <> 1.0 or Odd_2 <> 1.0 or Odd_X <> 1.0);

-- update `tbcore_fixture` set `odd_1` = 1.0 where `odd_1` = 0 or `odd_1` is null;
-- update `tbcore_fixture` set `odd_x` = 1.0 where `odd_x` = 0 or `odd_x` is null;
-- update `tbcore_fixture` set `odd_2` = 1.0 where `odd_2` = 0 or `odd_2` is null;
-- update `tbcore_fixture` set `aodd_1` = 1.0 where `aodd_1` = 0 or `aodd_1` is null;
-- update `tbcore_fixture` set `aodd_x` = 1.0 where `aodd_x` = 0 or `aodd_x` is null;
-- update `tbcore_fixture` set `aodd_2` = 1.0 where `aodd_2` = 0 or `aodd_2` is null;

-- call spstats_get_tabledatalist('2018-1-25 00:00:00', '2018-1-25 23:59:59');
-- call spstats_get_tabledatalistbygoals('2018-1-27 00:00:00', '2018-1-27 23:59:59');
-- call spstats_create_tabledatalist('2018-1-26 00:00:00', '2018-1-28 23:59:59');
select * from tbStats_TableDataList;

-- call spstats_get_goalshomeprojection('2018-1-27 00:00', '2018-1-27 23:59');
set @from_date = '2017-12-2 00:00:00';
set @to_date = '2017-12-2 23:59:59';
call spstats_create_goalsprojection(@from_date, @to_date);
call spstats_create_tabledatalist(@from_date, @to_date);

select * from tbstats_goalsprojection;

call spstats_get_summaryresults('2018-02-19 00:00:00', 0, 4);


