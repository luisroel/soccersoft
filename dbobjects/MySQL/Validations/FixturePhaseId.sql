select
	ft.PhaseId, sp.PhaseId
from 
	tbcore_fixture ft
	left join tbcore_season ss on
		ss.SeasonId = ft.SeasonId
	left join tbcore_seasontypephase sp on
		sp.SeasonTypeId = ss.SeasonTypeId
where
	ft.PhaseId <> sp.PhaseId;

select
	ft.s1, ft.p1, ss.s2, ss.p2
from (
	select
		  ft.SeasonId	AS s1
		, ft.PhaseId	AS p1
	from
		tbcore_fixture ft
	group by
		  ft.SeasonId
		, ft.PhaseId
	) ft 
    left join (
    select
		  ss.SeasonId	AS s2
		, sp.PhaseId	AS p2
	from
		tbcore_season ss
		left join tbcore_seasontypephase sp on
			sp.SeasonTypeId = ss.SeasonTypeId
	) ss on
    ss.s2 = ft.s1
    and ss.p2 = ft.p1;
