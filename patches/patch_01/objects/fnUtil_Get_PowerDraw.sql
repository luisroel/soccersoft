DROP FUNCTION IF EXISTS `fnUtil_Get_PowerDraw`;
DELIMITER $$
CREATE FUNCTION `fnUtil_Get_PowerDraw`(
	  HomeTeamId_p 		BIGINT
    , VisitorTeamId_p 	BIGINT
    , Time_p			DATETIME
) RETURNS INTEGER
BEGIN
	DECLARE result_v INTEGER;
	select
		sum(`dd`.`pwx`)
	into 
		result_v
	from (
		select
			(case when `ft`.`scoredhome` = `ft`.`scoredvisitor` then 1 else 0 end) 	as `pwx`
		from 
			`tbcore_fixture` `ft` 
		where 
				`ft`.`hometeamid` 		= HomeTeamId_p 
			and `ft`.`visitorteamid`	= VisitorTeamId_p
            and `ft`.`fixturestatusid` 	= 2
            and `ft`.`time`				< Time_p
		union all
		select
			(case when `ft`.`scoredhome` = `ft`.`scoredvisitor` then 1 else 0 end) 	as `pwx`
		from
			`tbcore_fixture` `ft` 
		where
				`ft`.`hometeamid` 		= VisitorTeamId_p
			and `ft`.`visitorteamid`	= HomeTeamId_p 
            and `ft`.`fixturestatusid` 	= 2
            and `ft`.`time`				< Time_p
	) `dd`;
	RETURN IFNULL(result_v,0);
END$$
DELIMITER ;
