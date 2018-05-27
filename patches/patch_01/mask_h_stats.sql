select
	  `dd`.`prev`
    , sum(case when `dd`.`rsl` = '1' then 1 else 0 end) as rsl_1
    , sum(case when `dd`.`rsl` = 'X' then 1 else 0 end) as rsl_x
    , sum(case when `dd`.`rsl` = '2' then 1 else 0 end) as rsl_2

    , sum(case when `dd`.`rsl` = '1' then 1 else 0 end) / count(`dd`.`rsl`) as prc_1
    , sum(case when `dd`.`rsl` = 'X' then 1 else 0 end) / count(`dd`.`rsl`) as prc_x
    , sum(case when `dd`.`rsl` = '2' then 1 else 0 end) / count(`dd`.`rsl`) as prc_2
from (
	select
		  (case when length(`fx`.`lh10on`) < 5 then `fx`.`lh10on` else substring(`fx`.`lh10on`, length(`fx`.`lh10on`)-5,5) end) as `prev`
		, fnutil_get_finalresult(`fx`.`scoredhome`,`fx`.`scoredvisitor`,`fx`.`fixturestatusid`) as rsl
	from
		`tbcore_fixture` `fx`
	where
			`fx`.`fixturestatusid` = 2
		and `fx`.`time` > '2017-01-01'
	) `dd`
group by
	`dd`.`prev`
order by
	`dd`.`prev`;