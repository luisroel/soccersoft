DROP FUNCTION IF EXISTS`fnUtil_Get_PowerVisitor`;
DELIMITER $$
CREATE FUNCTION `fnUtil_Get_PowerVisitor`(
	  HomeTeamId_p 		BIGINT
    , VisitorTeamId_p 	BIGINT
    , Time_p			DATETIME
) RETURNS INTEGER
BEGIN
	DECLARE result_v INTEGER;
-- select
-- sum(case 	when `ft`.`scoredhome` > `ft`.`scoredvisitor` then 1 
-- when `ft`.`scoredhome` < `ft`.`scoredvisitor` then -1
-- else 0 
-- end)	as `pw2`
-- into
-- result_v
-- from 
-- `tbcore_fixture` `ft` 
-- where 
-- `ft`.`hometeamid` 		= VisitorTeamId_p 
-- and `ft`.`visitorteamid`	= HomeTeamId_p
-- and `ft`.`fixturestatusid` 	= 2
-- and `ft`.`time`				< Time_p;
	select
		sum(`dd`.`pw2`)
	into
		result_v
	from (
		select
			sum(case when `ft`.`scoredhome` > `ft`.`scoredvisitor` then 1 else 0 end)	as `pw2`
		from 
			`tbcore_fixture` `ft` 
		where 
				`ft`.`hometeamid` 		= VisitorTeamId_p 
			and `ft`.`visitorteamid`	= HomeTeamId_p
			and `ft`.`fixturestatusid` 	= 2
			and `ft`.`time`				< Time_p
		union all
		select
			sum(case when `ft`.`scoredhome` < `ft`.`scoredvisitor` then 1 else 0 end)	as `pw2`
		from 
			`tbcore_fixture` `ft` 
		where 
				`ft`.`hometeamid` 		= HomeTeamId_p
			and `ft`.`visitorteamid`	= VisitorTeamId_p 
			and `ft`.`fixturestatusid` 	= 2
			and `ft`.`time`				< Time_p
	) `dd`;
	RETURN IFNULL(result_v,0);
END$$
DELIMITER ;
