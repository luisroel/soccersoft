drop procedure if exists `spstats_create_tabledatalist`;
delimiter $$
create procedure `spstats_create_tabledatalist`(
      in from_p datetime
    , in to_p	datetime
)
begin
	delete from `tbstats_tabledatalist` where `fixtureid` in (select `ft`.`fixtureid` from `tbcore_fixture` `ft` where `ft`.`time` >= from_p and `ft`.`time` <= to_p);
    set @from_date = from_p;
    while (@from_date < to_p) do
		set @to_date = adddate(@from_date, interval 86399 second);
		insert into	tbstats_tabledataList
		select
			  `dd`.*
			, concat((case when `dd`.`dfs` > -1 then 'P' else 'N' end) 
			, (case when `dd`.`dfa` > -1 then 'P' else 'N' end) 
			, (case when `dd`.`dfh` > -1 then 'P' else 'N' end) 
			, (case when `dd`.`dfv` > -1 then 'P' else 'N' end)	)				as `mask`
		from (
			select
				  `fx`.`fixtureid`														as `ft`
				, (`sh`.`gls` / (case when `sv`.`gls` = 0 then 1 else `sv`.`gls` end))	as `dgs`
				, (`sh`.`agn` / (case when `sv`.`agn` = 0 then 1 else `sv`.`agn` end))	as `dga`

				, (`sh`.`pts` / (case	when (`sh`.`gls` / (case when `sh`.`agn` = 0 then 1 else `sh`.`agn` end)) = 0 then 1
										else (`sh`.`gls` / (case when `sh`.`agn` = 0 then 1 else `sh`.`agn` end))
								end))
				/ (case when (`sv`.`pts` / (case
											when (`sv`.`gls` / (case when `sv`.`agn` = 0 then 1 else `sv`.`agn` end)) = 0 then 1
											else (`sv`.`gls` / (case when `sv`.`agn` = 0 then 1 else `sv`.`agn` end))
										end)) = 0 then 1
						else (`sv`.`pts` / (case
											when (`sv`.`gls` / (case when `sv`.`agn` = 0 then 1 else `sv`.`agn` end)) = 0 then 1
											else (`sv`.`gls` / (case when `sv`.`agn` = 0 then 1 else `sv`.`agn` end))
										end))
					end)																as `gpr`

				, ((`sh`.`win` + `sv`.`lst`) / (case when `sh`.`ply` + `sv`.`ply` = 0 then 1 else `sh`.`ply` + `sv`.`ply` end))	as `pwi`
				, ((`sh`.`drw` + `sv`.`drw`) / (case when `sh`.`ply` + `sv`.`ply` = 0 then 1 else `sh`.`ply` + `sv`.`ply` end)) as `pdr`
				, ((`sh`.`lst` + `sv`.`win`) / (case when `sh`.`ply` + `sv`.`ply` = 0 then 1 else `sh`.`ply` + `sv`.`ply` end)) as `plt`

				, `sh`.`h_gls`															as `gsh`
				, `sh`.`h_agn`															as `gah`
				, `sh`.`pts`															as `pth`
				, `fx`.`lh2`															as `lh`
				
				, `sv`.`v_gls`															as `gsv`
				, `sv`.`v_agn`															as `gav`
				, `sv`.`pts`															as `ptv`
				, `fx`.`lv2`															as `lv`
				
				, (		(`sh`.`gls` / (case	when `sh`.`gls` + `sv`.`gls` = 0 then 1 else `sh`.`gls` + `sv`.`gls` end))
					- 	(`sh`.`agn` / (case when `sh`.`agn` + `sv`.`agn` = 0 then 1	else `sh`.`agn` + `sv`.`agn` end))
				  ) * 100.0																as `dpt`
				, (`sh`.`gls`/(case when `sh`.`agn` = 0 then 1 else `sh`.`agn` end)) 
				- (`sv`.`gls`/(case when `sv`.`agn` = 0 then 1 else `sv`.`agn` end))	as `dft`

				, (`sh`.`gls` - `sv`.`gls`)												as `dfs`
				, (`sh`.`agn` - `sv`.`agn`) 											as `dfa`
				, (`sh`.`h_gls` - `sh`.`h_agn`)											as `dfh`
				, (`sv`.`v_gls` - `sv`.`v_agn`)											as `dfv`
				
				, fnUtil_Get_PowerHome(`fx`.`hometeamid`, `fx`.`visitorteamid`, `fx`.`time`)  		as `pw1`
				, fnUtil_Get_PowerDraw(`fx`.`hometeamid`, `fx`.`visitorteamid`, `fx`.`time`)  		as `pwx`
				, fnUtil_Get_PowerVisitor(`fx`.`hometeamid`, `fx`.`visitorteamid`, `fx`.`time`)		as `pw2`
						
				, fnutil_get_tendency(`fx`.`odd_1`, `fx`.`aodd_1`, `fx`.`odd_x`, `fx`.`aodd_x`, `fx`.`odd_2`, `fx`.`aodd_2`)	as `td`
				, (`fx`.`odd_1` - `fx`.`aodd_1`)										as `do1`
				, (`fx`.`odd_x` - `fx`.`aodd_x`)										as `dox`
				, (`fx`.`odd_2` - `fx`.`aodd_2`)										as `do2`
                
                , (`sv`.`v_agn` - `sv`.`v_gls`)	+ (`sh`.`h_gls` - `sh`.`h_agn`)			as `lvd`
                
				, (ifnull(`ph`.`prc_1`,0.0) + ifnull(`pv`.`prc_1`,0.0))/ 2.0			as `prc1`
				, (ifnull(`ph`.`prc_x`,0.0) + ifnull(`pv`.`prc_x`,0.0))/ 2.0			as `prcx`
				, (ifnull(`ph`.`prc_2`,0.0) + ifnull(`pv`.`prc_2`,0.0))/ 2.0			as `prc2`
			from
				`tbcore_fixture` `fx`
				left join (
					select
						  `dd`.`last5_h`
						, sum(case when `dd`.`rsl` = '1' then 1.0 else 0.0 end) / count(*) as `prc_1`
						, sum(case when `dd`.`rsl` = 'X' then 1.0 else 0.0 end) / count(*) as `prc_x`
						, sum(case when `dd`.`rsl` = '2' then 1.0 else 0.0 end) / count(*) as `prc_2`
					from (
						select
							  `ft`.`last5_h`
							, fnutil_get_finalresult(`ft`.`scoredhome`,`ft`.`scoredvisitor`,`ft`.`fixturestatusid`) as `rsl`
						from
							`tbcore_fixture` `ft`
						where
								`ft`.`fixturestatusid` = 2
							and `ft`.`time` < @from_date
						) `dd`
					group by
						`dd`.`last5_h`
				) `ph` on
					`ph`.`last5_h` = `fx`.`last5_h`
				left join (
					select
						  `dd`.`last5_v`
						, sum(case when `dd`.`rsl` = '1' then 1.0 else 0.0 end) / count(*) as `prc_1`
						, sum(case when `dd`.`rsl` = 'X' then 1.0 else 0.0 end) / count(*) as `prc_x`
						, sum(case when `dd`.`rsl` = '2' then 1.0 else 0.0 end) / count(*) as `prc_2`
					from (
						select
							  `ft`.`last5_v`
							, fnutil_get_finalresult(`ft`.`scoredhome`,`ft`.`scoredvisitor`,`ft`.`fixturestatusid`) as `rsl`
						from
							`tbcore_fixture` `ft`
						where
								`ft`.`fixturestatusid` = 2
							and `ft`.`time` < @from_date
						) `dd`
					group by
						`dd`.`last5_v`
				) `pv` on
					`pv`.`last5_v` = `fx`.`last5_v`
				left join (
					select
						  `tm`.`seasonid`
						, `tm`.`phaseid`
						, `tm`.`teamid`
						
						, sum(`tm`.`h_ply` + `tm`.`v_ply`) 	as `ply`
						, sum(`tm`.`h_win` + `tm`.`v_win`) 	as `win`
						, sum(`tm`.`h_drw` + `tm`.`v_drw`) 	as `drw`
						, sum(`tm`.`h_lst` + `tm`.`v_lst`) 	as `lst`
						, sum(`tm`.`h_gls` + `tm`.`v_gls`) 	as `gls`
						, sum(`tm`.`h_agn` + `tm`.`v_agn`) 	as `agn`
						, sum(`tm`.`h_pts` + `tm`.`v_pts`) 	as `pts`
						, sum(`tm`.`h_dif` + `tm`.`v_dif`) 	as `dif`
						, sum(`tm`.`h_gls`)					as `h_gls`
						, sum(`tm`.`h_agn`)					as `h_agn`
						, sum(`tm`.`v_gls`)					as `v_gls`
						, sum(`tm`.`v_agn`)					as `v_agn`
					from (
						select
							  `fx`.`seasonid`
							, `fx`.`phaseid`
							, `fx`.`hometeamid`					as `teamid`

							, ifnull(`fx`.`hplayed`,0)			as `h_ply`
							, ifnull(`fx`.`hwin`,0)				as `h_win`
							, ifnull(`fx`.`draw`,0)				as `h_drw`
							, ifnull(`fx`.`hloss`,0)			as `h_lst`
							, ifnull(`fx`.`scoredhome`,0) 		as `h_gls`
							, ifnull(`fx`.`scoredvisitor`,0)	as `h_agn`
							, ifnull(`fx`.`hpoints`,0)			as `h_pts`
							, ifnull(`fx`.`hdiff`,0)			as `h_dif`

							, 0									as `v_ply`
							, 0									as `v_win`
							, 0									as `v_drw`
							, 0									as `v_lst`
							, 0 								as `v_gls`
							, 0 								as `v_agn`
							, 0									as `v_pts`
							, 0									as `v_dif`    
						from
							`tbcore_fixture` `fx`
						where
								`fx`.`fixturestatusid` = 2
							and `fx`.`seasonid` in (select distinct `fx`.`seasonid` from `tbcore_fixture` `fx` where `fx`.`time` between @from_date and @to_date) 
							and `fx`.`time` < @from_date
						union all
						select
							  `fx`.`seasonid`
							, `fx`.`phaseid`
							, `fx`.`visitorteamid`				as `teamid`
							
							, 0									as `h_ply`
							, 0									as `h_win`
							, 0									as `h_drw`
							, 0									as `h_lst`
							, 0 								as `h_gls`
							, 0 								as `h_agn`
							, 0									as `h_pts`
							, 0									as `h_dif`

							, ifnull(`fx`.`vplayed`,0)			as `v_ply`
							, ifnull(`fx`.`vwin`,0)				as `v_win`
							, ifnull(`fx`.`draw`,0)				as `v_drw`
							, ifnull(`fx`.`vloss`,0)			as `v_lst`
							, ifnull(`fx`.`scoredvisitor`,0) 	as `v_gls`
							, ifnull(`fx`.`scoredhome`,0) 		as `v_agn`
							, ifnull(`fx`.`vpoints`,0)			as `v_pts`
							, ifnull(`fx`.`vdiff`,0)			as `v_dif`
						from
							`tbcore_fixture` `fx`
						where
								`fx`.`fixturestatusid` = 2
							and `fx`.`seasonid` in (select distinct `fx`.`seasonid` from `tbcore_fixture` `fx` where `fx`.`time` between @from_date and @to_date) 
							and `fx`.`time` < @from_date
						) `tm` 
					group by
						  `tm`.`seasonid`
						, `tm`.`phaseid`
						, `tm`.`teamid`
				) `sh` on
						`sh`.`seasonid`	= `fx`.`seasonid`
					and `sh`.`phaseid`	= `fx`.`phaseid`
					and `sh`.`teamid`	= `fx`.`hometeamid`
				left join (
					select
						  `tm`.`seasonid`
						, `tm`.`phaseid`
						, `tm`.`teamid`
						
						, sum(`tm`.`h_ply` + `tm`.`v_ply`) 	as `ply`
						, sum(`tm`.`h_win` + `tm`.`v_win`) 	as `win`
						, sum(`tm`.`h_drw` + `tm`.`v_drw`) 	as `drw`
						, sum(`tm`.`h_lst` + `tm`.`v_lst`) 	as `lst`
						, sum(`tm`.`h_gls` + `tm`.`v_gls`) 	as `gls`
						, sum(`tm`.`h_agn` + `tm`.`v_agn`) 	as `agn`
						, sum(`tm`.`h_pts` + `tm`.`v_pts`) 	as `pts`
						, sum(`tm`.`h_dif` + `tm`.`v_dif`) 	as `dif`
						, sum(`tm`.`h_gls`)					as `h_gls`
						, sum(`tm`.`h_agn`)					as `h_agn`
						, sum(`tm`.`v_gls`)					as `v_gls`
						, sum(`tm`.`v_agn`)					as `v_agn`
					from (
						select
							  `fx`.`seasonid`
							, `fx`.`phaseid`
							, `fx`.`hometeamid`					as `teamid`
							
							, ifnull(`fx`.`hplayed`,0)			as `h_ply`
							, ifnull(`fx`.`hwin`,0)				as `h_win`
							, ifnull(`fx`.`draw`,0)				as `h_drw`
							, ifnull(`fx`.`hloss`,0)			as `h_lst`
							, ifnull(`fx`.`ScoredHome`,0) 		as `h_gls`
							, ifnull(`fx`.`ScoredVisitor`,0)	as `h_agn`
							, ifnull(`fx`.`hpoints`,0)			as `h_pts`
							, ifnull(`fx`.`hdiff`,0)			as `h_dif`

							, 0									as `v_ply`
							, 0									as `v_win`
							, 0									as `v_drw`
							, 0									as `v_lst`
							, 0 								as `v_gls`
							, 0 								as `v_agn`
							, 0									as `v_pts`
							, 0									as `v_dif`    
						from
							`tbcore_fixture` `fx`
						where
								`fx`.`fixturestatusid` = 2
							and `fx`.`seasonid` in (select distinct `fx`.`seasonid` from `tbcore_fixture` `fx` where `fx`.`time` between @from_date and @to_date) 
							and `fx`.`time` < @from_date
						union all
						select
							  `fx`.`seasonid`
							, `fx`.`phaseid`
							, `fx`.`visitorteamid`				as `teamid`
							
							, 0									as `h_ply`
							, 0									as `h_win`
							, 0									as `h_drw`
							, 0									as `h_lst`
							, 0 								as `h_gls`
							, 0 								as `h_agn`
							, 0									as `h_pts`
							, 0									as `h_dif`

							, ifnull(`fx`.`vplayed`,0)			as `v_ply`
							, ifnull(`fx`.`vwin`,0)				as `v_win`
							, ifnull(`fx`.`draw`,0)				as `v_drw`
							, ifnull(`fx`.`vloss`,0)			as `v_lst`
							, ifnull(`fx`.`scoredvisitor`,0) 	as `v_gls`
							, ifnull(`fx`.`scoredhome`,0) 		as `v_agn`
							, ifnull(`fx`.`vpoints`,0)			as `v_pts`
							, ifnull(`fx`.`vdiff`,0)			as `v_dif`
						from
							`tbcore_fixture` `fx`
						where
								`fx`.`fixturestatusid` = 2
							and `fx`.`seasonid` in (select distinct `fx`.`seasonid` from `tbcore_fixture` `fx` where `fx`.`time` between @from_date and @to_date) 
							and `fx`.`time` < @from_date
						) `tm` 
					group by
						  `tm`.`seasonid`
						, `tm`.`phaseid`
						, `tm`.`teamid`
				) `sv` on
						`sv`.`seasonid`	= `fx`.`seasonid`
					and `sv`.`phaseid`	= `fx`.`phaseid`
					and `sv`.`teamid`	= `fx`.`visitorteamid`
			where
					`fx`.`time` between @from_date and @to_date
				and ifnull(`sh`.`ply`,0) + ifnull(`sv`.`ply`,0) > 2
		) dd;
        set @from_date = adddate(@from_date, interval 1 day);
	end while;
end$$
delimiter ;
