set @start_date = '2017-10-15 00:00:00';
set @end_date = '2017-10-15 23:59:59';
SET @row_number:=0;
select
	  @row_number:=@row_number+1										as `no`
	, `dd`.*
from (
    select
		  `aa`.`associationid`
		, `aa`.`shortname`												as `ct`
		, `tt`.`tournamentid`
		, `tt`.`shortname`												as `lg`
		, `fx`.`time`													as `dt`
		, `fx`.`hometeamid`
		, `th`.`shortname`												as `hm`
		, `fx`.`visitorteamid`	
		, `tv`.`shortname`												as `vs`
		, `fx`.`scoredhome`												as `sh`
		, `fx`.`scoredvisitor`											as `sv`
        , `fx`.`last5_h`
        , `fx`.`last5_v`
		, `ph`.`prc_1` + `pv`.`prc_1`									as `prc_1`
		, `ph`.`prc_x` + `pv`.`prc_x`									as `prc_x`
		, `ph`.`prc_2` + `pv`.`prc_2`									as `prc_h`
	from
		`tbcore_fixture` `fx`
		inner join `tbcore_team` `th` on
			`th`.`teamid` 			= `fx`.`hometeamid`
		inner join `tbcore_team` `tv` on
			`tv`.`teamid` 			= `fx`.`visitorteamid`
		inner join `tbcore_season` `ss` on
			`ss`.`seasonid` 		= `fx`.`seasonid`
		inner join `tbcore_tournament` `tt` on
			`tt`.`tournamentid` 	= `ss`.`tournamentid`
		inner join `tbcore_association` `aa` on
			`aa`.`associationid` 	= `tt`.`associationid`
		left join (
			select
				  `dd`.`mask`
				, sum(case when `dd`.`rsl` = '1' then 1 else 0 end) / count(`dd`.`rsl`) as prc_1
				, sum(case when `dd`.`rsl` = 'X' then 1 else 0 end) / count(`dd`.`rsl`) as prc_x
				, sum(case when `dd`.`rsl` = '2' then 1 else 0 end) / count(`dd`.`rsl`) as prc_2
			from (
				select
					  (case when length(`fx`.`lh10o`) < 5 then `fx`.`lh10o` else substring(`fx`.`lh10o`, length(`fx`.`lh10o`)-5,5) end) as `mask`
					, fnutil_get_finalresult(`fx`.`scoredhome`,`fx`.`scoredvisitor`,`fx`.`fixturestatusid`) as rsl
				from
					`tbcore_fixture` `fx`
				where
						`fx`.`fixturestatusid` = 2
					and `fx`.`time` < @start_date
				) `dd`
			group by
				`dd`.`mask`
		) as `ph` on
			`ph`.`mask` = `fx`.`last5_h`
		left join (
			select
				  `dd`.`mask`
				, sum(case when `dd`.`rsl` = '1' then 1 else 0 end) / count(`dd`.`rsl`) as prc_1
				, sum(case when `dd`.`rsl` = 'X' then 1 else 0 end) / count(`dd`.`rsl`) as prc_x
				, sum(case when `dd`.`rsl` = '2' then 1 else 0 end) / count(`dd`.`rsl`) as prc_2
			from (
				select
					  (case when length(`fx`.`lv10o`) < 5 then `fx`.`lv10o` else substring(`fx`.`lv10o`, length(`fx`.`lv10o`)-5,5) end) as `mask`
					, fnutil_get_finalresult(`fx`.`scoredhome`,`fx`.`scoredvisitor`,`fx`.`fixturestatusid`) as rsl
				from
					`tbcore_fixture` `fx`
				where
						`fx`.`fixturestatusid` = 2
					and `fx`.`time` < @start_date
				) `dd`
			group by
				`dd`.`mask`
        ) `pv` on
			`pv`.`mask` = `fx`.`last5_h`
	where
		`fx`.`time` between @start_date and @end_date
) `dd`
order by
	`dd`.`dt`;
            
			