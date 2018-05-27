-- integrity verification

-- teamid's verification in tbcore_fixture
select
	*
from
	`tbcore_fixture` `fx`
where
	not `fx`.`hometeamid` in (
		select `tm`.`teamid` from `tbcore_team` `tm`
    ) or
    not `fx`.`visitorteamid` in (
		select `tm`.`teamid` from `tbcore_team` `tm`
    );

-- teamid's verification in tbcore_seasonteam
select
	*
from
	`tbcore_seasonteam` `st`
where
    not `st`.`teamid` in (
		select `tm`.`teamid` from `tbcore_team` `tm`
    );


-- is the tbcore_fixture.hometeamid in seasonteam.teamid 
select
	*
from
	`tbcore_fixture` `fx`
    left join `tbcore_seasonteam` `st` on
			`st`.`seasonid` = `fx`.`seasonid`
        and `st`.`teamid` 	= `fx`.`hometeamid`
where
	`st`.`seasonid` is null;

-- is the tbcore_fixture.visitorteamid in seasonteam.teamid 
select
	*
from
	`tbcore_fixture` `fx`
    left join `tbcore_seasonteam` `st` on
			`st`.`seasonid` = `fx`.`seasonid`
        and `st`.`teamid` 	= `fx`.`visitorteamid`
where
	`st`.`seasonid` is null;


-- check seasons dates
select
	  `as`.`associationid`
	, `as`.`name` as `association`
    , `tr`.`tournamentid`
    , `tr`.`name` as `tournament`
    , `ss`.`seasonid`
    , `ss`.`name` as `season`
    , `ss`.`startdate`
    , `ss`.`enddate`
    , `tb`.`min_date`
    , `tb`.`max_date`
from 
	`tbcore_association` `as` 
    left join `tbcore_tournament` `tr` on
		`tr`.`associationid` = `as`.`associationid`
    left join `tbcore_season` `ss` on
		`ss`.`tournamentid` = `tr`.`tournamentid`
    left join (
		select
			  `fx`.`seasonid`
			, min(`fx`.`time`)	as `min_date`
			, max(`fx`.`time`)	as `max_date`
		from
			`tbcore_fixture` `fx`
		group by
			`fx`.`seasonid`
	) `tb` on
		`tb`.`seasonid` = `ss`.`seasonid`
where
	`ss`.`startdate` > `tb`.`min_date`
    or `ss`.`enddate` < `tb`.`max_date`
order by
	`as`.`name`;