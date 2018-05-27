set @start_date = '2017-10-22 00:00:00';
set @end_date = '2017-10-22 23:59:59';

select 
	  `dd`.*
    , (case when `dd`.`goals_h` = 0 then 0 else `dd`.`ply_h`*90/`dd`.`goals_h` end) 												as `avg_h`
    , `dd`.`ply_h` * 90 - `dd`.`last_goal_h` 																						as `last_goal_h`
    , `dd`.`ply_h` * 90 - `dd`.`last_goal_h` + (case when `dd`.`goals_h` = 0 then 0 else `dd`.`ply_h`*90/`dd`.`goals_h` end) - 90	as `1st_g_h`
    , `dd`.`ply_h` * 90 - `dd`.`last_goal_h` + 2*(case when `dd`.`goals_h` = 0 then 0 else `dd`.`ply_h`*90/`dd`.`goals_h` end) - 90 as `2st_g_h`
    , `dd`.`ply_h` * 90 - `dd`.`last_goal_h` + 3*(case when `dd`.`goals_h` = 0 then 0 else `dd`.`ply_h`*90/`dd`.`goals_h` end) - 90 as `3st_g_h`

    , (case when `dd`.`goals_v` = 0 then 0 else `dd`.`ply_v`*90/`dd`.`goals_v` end) 												as `avg_v`
    , `dd`.`ply_v` * 90 - `dd`.`last_goal_v` 																						as `last_goal_v`
    , `dd`.`ply_v` * 90 - `dd`.`last_goal_v` + (case when `dd`.`goals_v` = 0 then 0 else `dd`.`ply_v`*90/`dd`.`goals_v` end) - 90 	as `1st_g_v`
    , `dd`.`ply_v` * 90 - `dd`.`last_goal_v` + 2*(case when `dd`.`goals_v` = 0 then 0 else `dd`.`ply_v`*90/`dd`.`goals_v` end) - 90 as `2st_g_v`
    , `dd`.`ply_v` * 90 - `dd`.`last_goal_v` + 3*(case when `dd`.`goals_v` = 0 then 0 else `dd`.`ply_v`*90/`dd`.`goals_v` end) - 90 as `3st_g_v`
from (
	select
		  `fx`.`fixtureid`
		, `fx`.`hometeamid`
		, `fx`.`visitorteamid`
        
		, ifnull((select count(*) from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`hometeamid` or `ft`.`visitorteamid`=`fx`.`hometeamid`) and `ft`.`seasonid` = `fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time`<`fx`.`time`),0)  as ply_h
		, ifnull((select sum(case when `ft`.`hometeamid`=`fx`.`hometeamid` then `ft`.`scoredhome` else `ft`.`scoredvisitor` end) from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`hometeamid` or `ft`.`visitorteamid`=`fx`.`hometeamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time` < `fx`.`time`),0)  as goals_h
		, ifnull((select sum(case when `ft`.`hometeamid` = `fx`.`hometeamid` then `ft`.`scoredvisitor` else `ft`.`scoredhome` end) from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`hometeamid` or `ft`.`visitorteamid`=`fx`.`hometeamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time` < `fx`.`time`),0)  as against_h
		, ifnull((select `gl`.`minute` from `tbcore_goals` `gl` inner join `tbcore_fixture` `ft` on `ft`.`fixtureid`=`gl`.`fixtureid` where (`ft`.`hometeamid`=`fx`.`hometeamid` or `ft`.`visitorteamid`=`fx`.`hometeamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time`<`fx`.`time` order by `gl`.`minute` desc limit 1),0)  as last_goal_h
		
        , ifnull((select count(*) from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`visitorteamid` or `ft`.`visitorteamid`=`fx`.`visitorteamid`) and `ft`.`seasonid` = `fx`.`seasonid` and `ft`.`fixturestatusid` = 2 and `ft`.`time` < `fx`.`time`),0) as ply_v
		, ifnull((select sum(case when `ft`.`hometeamid` = `fx`.`visitorteamid` then `ft`.`scoredhome` else `ft`.`scoredvisitor` end) from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`visitorteamid` or `ft`.`visitorteamid`=`fx`.`visitorteamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time` < `fx`.`time`),0)  as goals_v
		, ifnull((select sum(case when `ft`.`hometeamid` = `fx`.`visitorteamid` then `ft`.`scoredvisitor` else `ft`.`scoredhome` end) from `tbcore_fixture` `ft` where (`ft`.`hometeamid`=`fx`.`visitorteamid` or `ft`.`visitorteamid`=`fx`.`visitorteamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time` < `fx`.`time`),0)  as against_v
		, ifnull((select `gl`.`minute` from `tbcore_goals` `gl` inner join `tbcore_fixture` `ft` on `ft`.`fixtureid`=`gl`.`fixtureid` where (`ft`.`hometeamid`=`fx`.`visitorteamid` or `ft`.`visitorteamid`=`fx`.`visitorteamid`) and `ft`.`seasonid`=`fx`.`seasonid` and `ft`.`fixturestatusid`=2 and `ft`.`time`<`fx`.`time` order by `gl`.`minute` desc limit 1),0)  as last_goal_v
	from
		`tbcore_fixture` `fx`
	where
		`fx`.`time` between @start_date and @end_date
) `dd`
-- where `dd`.`fixtureid` in (85707, 85708)
order by
	`dd`.`fixtureid`;