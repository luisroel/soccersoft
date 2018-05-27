
set @start_date = '2017-12-04 00:00:00';
set @end_date = '2017-12-04 23:59:59';

select
	  `tt`.`fixtureid`
	, `aa`.`shortname`	as `ct`
	, `tn`.`shortname`	as `lg`
	, `ss`.`shortname`	as `ss`
    , `tt`.`dt`
	, `th`.`shortname`	as `hm`
	, `tv`.`shortname`	as `vs`
    , `tt`.`sh`
    , `tt`.`sv`
    , `tt`.`rsl`
    , `tt`.`odd_1`
    , `tt`.`odd_x`
    , `tt`.`odd_2`
    , `tt`.`avg_g_h`
    , `tt`.`last_goal_h`
    , `tt`.`1st_g_h`
    , `tt`.`2nd_g_h`
    , `tt`.`3rd_g_h`
    , `tt`.`avg_g_v`
    , `tt`.`last_goal_v`
    , `tt`.`1st_g_v`
    , `tt`.`2nd_g_v`
    , `tt`.`3rd_g_v`
    , `tt`.`avg_a_h`
    , `tt`.`last_against_h`
    , `tt`.`1st_a_h`
    , `tt`.`2nd_a_h`
    , `tt`.`3rd_a_h`
    , `tt`.`avg_a_v`
    , `tt`.`last_against_v`
    , `tt`.`1st_a_v`
    , `tt`.`2nd_a_v`
    , `tt`.`3rd_a_v`
from (
	select 
		  `dd`.`fixtureid`
		, `dd`.`seasonid`
		, `dd`.`dt`
		, `dd`.`hometeamid`
		, `dd`.`visitorteamid`
		, `dd`.`sh`
		, `dd`.`sv`
		, `dd`.`rsl`
		, `dd`.`odd_1`
		, `dd`.`odd_x`
		, `dd`.`odd_2`
		, (case when `dd`.`goals_h` = 0 then 0 else `dd`.`ply_h`*90/`dd`.`goals_h` end) 														as `avg_g_h`
		, `dd`.`ply_h` * 90 - `dd`.`last_goal_h` 																								as `last_goal_h`
		, `dd`.`ply_h` * 90 - `dd`.`last_goal_h` + (case when `dd`.`goals_h` = 0 then 0 else `dd`.`ply_h`*90/`dd`.`goals_h` end) - 90			as `1st_g_h`
		, `dd`.`ply_h` * 90 - `dd`.`last_goal_h` + 2*(case when `dd`.`goals_h` = 0 then 0 else `dd`.`ply_h`*90/`dd`.`goals_h` end) - 90 		as `2nd_g_h`
		, `dd`.`ply_h` * 90 - `dd`.`last_goal_h` + 3*(case when `dd`.`goals_h` = 0 then 0 else `dd`.`ply_h`*90/`dd`.`goals_h` end) - 90 		as `3rd_g_h`

		, (case when `dd`.`goals_v` = 0 then 0 else `dd`.`ply_v`*90/`dd`.`goals_v` end) 														as `avg_g_v`
		, `dd`.`ply_v` * 90 - `dd`.`last_goal_v` 																								as `last_goal_v`
		, `dd`.`ply_v` * 90 - `dd`.`last_goal_v` + (case when `dd`.`goals_v` = 0 then 0 else `dd`.`ply_v`*90/`dd`.`goals_v` end) - 90 			as `1st_g_v`
		, `dd`.`ply_v` * 90 - `dd`.`last_goal_v` + 2*(case when `dd`.`goals_v` = 0 then 0 else `dd`.`ply_v`*90/`dd`.`goals_v` end) - 90 		as `2nd_g_v`
		, `dd`.`ply_v` * 90 - `dd`.`last_goal_v` + 3*(case when `dd`.`goals_v` = 0 then 0 else `dd`.`ply_v`*90/`dd`.`goals_v` end) - 90 		as `3rd_g_v`

		, (case when `dd`.`against_h` = 0 then 0 else `dd`.`ply_h`*90/`dd`.`against_h` end) 													as `avg_a_h`
		, `dd`.`ply_h` * 90 - `dd`.`last_against_h` 																							as `last_against_h`
		, `dd`.`ply_h` * 90 - `dd`.`last_against_h` + (case when `dd`.`against_h` = 0 then 0 else `dd`.`ply_h`*90/`dd`.`against_h` end) - 90	as `1st_a_h`
		, `dd`.`ply_h` * 90 - `dd`.`last_against_h` + 2*(case when `dd`.`against_h` = 0 then 0 else `dd`.`ply_h`*90/`dd`.`against_h` end) - 90 	as `2nd_a_h`
		, `dd`.`ply_h` * 90 - `dd`.`last_against_h` + 3*(case when `dd`.`against_h` = 0 then 0 else `dd`.`ply_h`*90/`dd`.`against_h` end) - 90 	as `3rd_a_h`

		, (case when `dd`.`against_v` = 0 then 0 else `dd`.`ply_v`*90/`dd`.`against_v` end) 													as `avg_a_v`
		, `dd`.`ply_v` * 90 - `dd`.`last_against_v` 																							as `last_against_v`
		, `dd`.`ply_v` * 90 - `dd`.`last_against_v` + (case when `dd`.`against_v` = 0 then 0 else `dd`.`ply_v`*90/`dd`.`against_v` end) - 90 	as `1st_a_v`
		, `dd`.`ply_v` * 90 - `dd`.`last_against_v` + 2*(case when `dd`.`against_v` = 0 then 0 else `dd`.`ply_v`*90/`dd`.`against_v` end) - 90 	as `2nd_a_v`
		, `dd`.`ply_v` * 90 - `dd`.`last_against_v` + 3*(case when `dd`.`against_v` = 0 then 0 else `dd`.`ply_v`*90/`dd`.`against_v` end) - 90 	as `3rd_a_v`
	from (
		select
			  `fx`.`fixtureid`
			, `fx`.`seasonid`
			, `fx`.`time`													as `dt`
			, `fx`.`hometeamid`
			, `fx`.`visitorteamid`
			, `fx`.`scoredhome`												as `sh`
			, `fx`.`scoredvisitor`											as `sv`
			, `fx`.`odd_1`
			, `fx`.`odd_x`
			, `fx`.`odd_2`
			, fnutil_get_finalresult(`fx`.`scoredhome`, `fx`.`scoredvisitor`, `fx`.`fixturestatusid`)	as `rsl`
			, ifnull((select count(*) from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`hometeamid` or `ft`.`visitorteamid`=`fx`.`hometeamid`) and `ft`.`seasonid` = `fx`.`seasonid` and `ft`.`fixturestatusid` = 2 and `ft`.`time` < `fx`.`time`),0)  as ply_h
			, ifnull((select sum(case when `ft`.`hometeamid` = `fx`.`hometeamid` then `ft`.`scoredhome` else `ft`.`scoredvisitor` end) from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`hometeamid` or `ft`.`visitorteamid`=`fx`.`hometeamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time` < `fx`.`time`),0)  as goals_h
			, ifnull((select sum(case when `ft`.`hometeamid` = `fx`.`hometeamid` then `ft`.`scoredvisitor` else `ft`.`scoredhome` end) from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`hometeamid` or `ft`.`visitorteamid`=`fx`.`hometeamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time` < `fx`.`time`),0)  as against_h
			, ifnull((select `gl`.`minute` from `tbcore_goals` `gl` where `gl`.`teamid` = `fx`.`hometeamid` and `gl`.`fixtureid` in (select `ft`.`fixtureid` from `tbcore_fixture` `ft`	where (`ft`.`hometeamid`=`fx`.`hometeamid` or `ft`.`visitorteamid`=`fx`.`hometeamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time`<`fx`.`time`) order by `gl`.`minute` desc limit 1),0)  as last_goal_h
			, ifnull((select `gl`.`minute` from `tbcore_goals` `gl` where `gl`.`teamid` in ( select (case when `ft`.`hometeamid`=`fx`.`hometeamid` then `ft`.`visitorteamid` else `ft`.`hometeamid` end) from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`hometeamid` or `ft`.`visitorteamid`=`fx`.`hometeamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time`<`fx`.`time`) and `gl`.`fixtureid` in (select `ft`.`fixtureid` from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`hometeamid` or `ft`.`visitorteamid`=`fx`.`hometeamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time`<`fx`.`time`) order by `gl`.`minute` desc limit 1),0)  as last_against_h
			, ifnull((select count(*) from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`visitorteamid` or `ft`.`visitorteamid`=`fx`.`visitorteamid`) and `ft`.`seasonid` = `fx`.`seasonid` and `ft`.`fixturestatusid` = 2 and `ft`.`time` < `fx`.`time`),0) as ply_v
			, ifnull((select sum(case when `ft`.`hometeamid` = `fx`.`visitorteamid` then `ft`.`scoredhome` else `ft`.`scoredvisitor` end) from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`visitorteamid` or `ft`.`visitorteamid`=`fx`.`visitorteamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time` < `fx`.`time`),0)  as goals_v
			, ifnull((select sum(case when `ft`.`hometeamid` = `fx`.`visitorteamid` then `ft`.`scoredvisitor` else `ft`.`scoredhome` end) from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`visitorteamid` or `ft`.`visitorteamid`=`fx`.`visitorteamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time` < `fx`.`time`),0)  as against_v
			, ifnull((select `gl`.`minute` from `tbcore_goals` `gl` where `gl`.`teamid` = `fx`.`visitorteamid` and `gl`.`fixtureid` in ( select `ft`.`fixtureid` from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`visitorteamid` or `ft`.`visitorteamid`=`fx`.`visitorteamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time`<`fx`.`time` ) order by `gl`.`minute` desc limit 1),0)  as last_goal_v
			, ifnull((select `gl`.`minute` from `tbcore_goals` `gl` where `gl`.`teamid` in (select (case when `ft`.`hometeamid`=`fx`.`visitorteamid` then `ft`.`hometeamid` else `ft`.`visitorteamid` end) from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`visitorteamid` or `ft`.`visitorteamid`=`fx`.`visitorteamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time`<`fx`.`time`) and `gl`.`fixtureid` in ( select `ft`.`fixtureid` from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`visitorteamid` or `ft`.`visitorteamid`=`fx`.`visitorteamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time`<`fx`.`time`) order by `gl`.`minute` desc limit 1),0)  as last_against_v
		from
			`tbcore_fixture` `fx`
		where
			`fx`.`time` between @start_date and @end_date
	) `dd`
) `tt`
	inner join `tbcore_team` `th` on
		`th`.`teamid` = `tt`.`hometeamid`
	inner join `tbcore_team` `tv` on
		`tv`.`teamid` = `tt`.`visitorteamid`
	inner join `tbcore_season` `ss` on
		`ss`.`seasonid` = `tt`.`seasonid`
	inner join `tbcore_tournament` `tn` on
		`tn`.`tournamentid` = `ss`.`tournamentid`
	inner join `tbcore_association` `aa` on
		`aa`.`associationid` = `tn`.`associationid`
where
--		`tt`.`1st_g_h` > 90
--    and `tt`.`2nd_g_v` < 90
     `tt`.`fixtureid` in ( 
 152451
,147271
,150016
,145870
,180631
,142653
,131685
)
order by
	  `tt`.`last_goal_v`
    , `tt`.`last_goal_h`;