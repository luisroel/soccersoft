
select * from `tbcore_seasonteam` `st` where `st`.`seasonid` = 853;
-- delete from `tbcore_seasonteam` where `seasonid` = 853;

insert into `tbcore_seasonteam` 
select  `tl`.`seasonid`, `tl`.`teamid` from 
(
select `fx`.`seasonid`, `fx`.`hometeamid` as `teamid` from `tbcore_fixture` `fx` where `fx`.`seasonid` = 853
union
select `fx`.`seasonid`, `fx`.`visitorteamid` from `tbcore_fixture` `fx` where `fx`.`seasonid` = 853
) `tl`;


