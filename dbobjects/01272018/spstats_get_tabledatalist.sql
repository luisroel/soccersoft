drop procedure if exists `spstats_get_tabledatalist`;
delimiter $$
create procedure `spstats_get_tabledatalist`(
	  in from_p datetime
    , in to_p	datetime
)
begin
	set @row_number:=0;
    select
		  @row_number:=@row_number+1	as `no`
        , `tt`.*
	from (
		select
			  `td`.*
			, `aa`.`associationid`
			, `aa`.`shortname`	as `ct`
			, `tn`.`tournamentid`
			, `tn`.`shortname`	as `lg`
			, `ss`.`seasonid`
			, `ss`.`shortname`	as `ss`
			, `ph`.`phaseid`
			, `ph`.`shortname`	as `ph`
			, `fx`.`time` 		as `dt`
			, `fx`.`hometeamid`
			, `th`.`shortname`	as `hm`
			, `fx`.`visitorteamid`
			, `tv`.`shortname`	as `vs`
			, `fx`.`scoredhome` as `sh`
			, `fx`.`scoredvisitor` as `sv`
			, fnutil_get_finalresult(`fx`.`scoredhome`, `fx`.`scoredvisitor`, `fx`.`fixturestatusid`)	as `rsl`
			, `fx`.`odd_1`		as `o1`
			, `fx`.`odd_x`		as `ox`
			, `fx`.`odd_2`		as `o2`
			, fnutil_get_oddvalue(`fx`.`odd_1`, `fx`.`odd_x`, `fx`.`odd_2`)	as `val`
		from
			`tbstats_tabledatalist` `td`
			inner join `tbcore_fixture` `fx` on
				`fx`.`fixtureid` = `td`.`fixtureid`
			inner join `tbcore_team` `th` on
				`th`.`teamid` = `fx`.`hometeamid`
			inner join `tbcore_team` `tv` on
				`tv`.`teamid` = `fx`.`visitorteamid`
			inner join `tbcore_season` `ss` on
				`ss`.`seasonid` = `fx`.`seasonid`
			inner join `tbcore_phase` `ph` on
				`ph`.`phaseid` 	= `fx`.`phaseid`
			inner join `tbcore_tournament` `tn` on
				`tn`.`tournamentid` = `ss`.`tournamentid`
			inner join `tbcore_association` `aa` on
				`aa`.`associationid` = `tn`.`associationid`
		where
				`fx`.`time` >= from_p 
			and `fx`.`time` <= to_p
	) `tt`
	order by
		 `tt`.`dfv`
		, (`tt`.`gsv`-`tt`.`gav`)+(`tt`.`gah` -`tt`.`gsh`)
		, `tt`.`dpt` desc
		, `tt`.`dft` desc;
end$$
delimiter ;
