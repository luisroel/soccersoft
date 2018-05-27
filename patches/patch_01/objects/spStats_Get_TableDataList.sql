DROP PROCEDURE IF EXISTS `spstats_get_tabledataList`;
DELIMITER $$
CREATE PROCEDURE `spstats_get_tabledatalist`(
      IN From_p	DATETIME
    , IN To_p	DATETIME
)
BEGIN
	SET @row_number:=0;
	select
		  @row_number:=@row_number+1										as `no`
		, `dd`.*
		, concat((case when `dd`.`dfs` > -1 then 'P' else 'N' end) 
		, (case when `dd`.`dfa` > -1 then 'P' else 'N' end) 
		, (case when `dd`.`dfh` > -1 then 'P' else 'N' end) 
		, (case when `dd`.`dfv` > -1 then 'P' else 'N' end)	)				as `mask`
	from (
		select
			  `fx`.`fixtureid`												as `ft`
			, `aa`.`associationid`
			, `aa`.`shortname`												as `ct`
			, `tt`.`tournamentid`
			, `tt`.`shortname`												as `lg`
			, `ss`.`seasonid`
			, `ss`.`shortname`												as `ss`
			, `ph`.`phaseid`
			, `ph`.`shortname`												as `ph`
			, `fx`.`time`													as `dt`
			, `fx`.`hometeamid`
			, `th`.`shortname`												as `hm`
			, `fx`.`visitorteamid`	
			, `tv`.`shortname`												as `vs`
			, `fx`.`scoredhome`												as `sh`
			, `fx`.`scoredvisitor`											as `sv`
			
			, fnutil_get_finalresult(`fx`.`scoredhome`, `fx`.`scoredvisitor`, `fx`.`fixturestatusid`)	as `rsl`
			, `fx`.`odd_1`													as `o1`
			, `fx`.`odd_x`													as `ox`
			, `fx`.`odd_2`													as `o2`
			, fnutil_get_oddvalue(`fx`.`odd_1`, `fx`.`odd_x`, `fx`.`odd_2`)	as `val`
			, fnutil_get_relation(`sh`.`gls`, `sv`.`gls`)					as `dgs`
			, fnutil_get_relation(`sh`.`agn`,`sv`.`agn`)					as `dga`
			, fnutil_get_gpr(`sh`.`pts`, `sh`.`gls`, `sh`.`agn`, `sv`.`pts`, `sv`.`gls`, `sv`.`agn`) as `gpr`

			, fnutil_get_likelyhood_by_result(`sh`.`win`, `sv`.`lst`, `sh`.`ply`, `sv`.`ply`)	as `pwi`
			, fnutil_get_likelyhood_by_result(`sh`.`drw`, `sv`.`drw`, `sh`.`ply`, `sv`.`ply`)	as `pdr`
			, fnutil_get_likelyhood_by_result(`sh`.`lst`, `sv`.`win`, `sh`.`ply`, `sv`.`ply`)	as `plt`

			, `sh`.`h_gls`													as `gsh`
			, `sh`.`h_agn`													as `gah`
			, `sh`.`pts`													as `pth`
			, `fx`.`lh2`													as `lh`
			
			, `sv`.`v_gls`													as `gsv`
			, `sv`.`v_agn`													as `gav`
			, `sv`.`pts`													as `ptv`
			, `fx`.`lv2`													as `lv`
			
			, fnutil_get_dpt(`sh`.`gls`, `sv`.`gls`, `sh`.`agn`, `sv`.`agn`)	as `dpt`
			, fnutil_get_dft(`sh`.`gls`, `sv`.`gls`, `sh`.`agn`, `sv`.`agn`)	as `dft`

			, (`sh`.`gls` - `sv`.`gls`)												as `dfs`
			, (`sh`.`agn` - `sv`.`agn`) 											as `dfa`
			, (`sh`.`h_gls` - `sh`.`h_agn`)											as `dfh`
			, (`sv`.`v_gls` - `sv`.`v_agn`)											as `dfv`
            
			, fnUtil_Get_PowerHome(`fx`.`hometeamid`, `fx`.`visitorteamid`, `fx`.`time`)  		as `pw1`
			, fnUtil_Get_PowerDraw(`fx`.`hometeamid`, `fx`.`visitorteamid`, `fx`.`time`)  		as `pwx`
			, fnUtil_Get_PowerVisitor(`fx`.`hometeamid`, `fx`.`visitorteamid`, `fx`.`time`) 	as `pw2`

			, fnutil_get_tendency(`fx`.`odd_1`, `fx`.`aodd_1`, `fx`.`odd_x`, `fx`.`aodd_x`, `fx`.`odd_2`, `fx`.`aodd_2`)	as `td`
			, (`fx`.`odd_1` - `fx`.`aodd_1`)	as `do1`
			, (`fx`.`odd_x` - `fx`.`aodd_x`)	as `dox`
			, (`fx`.`odd_2` - `fx`.`aodd_2`)	as `do2`
            
			, (`sv`.`v_agn` - `sv`.`v_gls`)	+ (`sh`.`h_gls` - `sh`.`h_agn`)			as `lvd`
			, ifnull(`ph`.`prc_1`,0.0) + ifnull(`pv`.`prc_1`,0.0)					as `prc1`
			, ifnull(`ph`.`prc_x`,0.0) + ifnull(`pv`.`prc_x`,0.0)					as `prcx`
			, ifnull(`ph`.`prc_2`,0.0) + ifnull(`pv`.`prc_2`,0.0)					as `prc2`
		from
			`tbcore_fixture` `fx`
			inner join `tbcore_team` `th` on
				`th`.`teamid` 			= `fx`.`hometeamid`
			inner join `tbcore_team` `tv` on
				`tv`.`teamid` 			= `fx`.`visitorteamid`
			inner join `tbcore_fixturestatus` `fs` on
				`fs`.`fixturestatusid`	= `fx`.`fixturestatusid`
			inner join `tbcore_season` `ss` on
				`ss`.`seasonid` 		= `fx`.`seasonid`
			inner join `tbcore_phase` `ph` on
				`ph`.`phaseid` 			= `fx`.`phaseid`
			inner join `tbcore_tournament` `tt` on
				`tt`.`tournamentid` 	= `ss`.`tournamentid`
			inner join `tbcore_association` `aa` on
				`aa`.`associationid` 	= `tt`.`associationid`
			left join (
				select
					  `dd`.`mask`
					, sum(case when `dd`.`rsl` = '1' then 1 else 0 end) / count(`dd`.`rsl`) as `prc_1`
					, sum(case when `dd`.`rsl` = 'X' then 1 else 0 end) / count(`dd`.`rsl`) as `prc_x`
					, sum(case when `dd`.`rsl` = '2' then 1 else 0 end) / count(`dd`.`rsl`) as `prc_2`
				from (
					select
						  (case when length(`fx`.`lh10o`) < 5 then `fx`.`lh10o` else substring(`fx`.`lh10o`, length(`fx`.`lh10o`)-4,5) end) as `mask`
						, fnutil_get_finalresult(`fx`.`scoredhome`,`fx`.`scoredvisitor`,`fx`.`fixturestatusid`) as `rsl`
					from
						`tbcore_fixture` `fx`
					where
							`fx`.`fixturestatusid` = 2
						and `fx`.`time` < From_p
					) `dd`
				group by
					`dd`.`mask`
			) as `ph` on
				`ph`.`mask` = `fx`.`last5_h`
			left join (
				select
					  `dd`.`mask`
					, sum(case when `dd`.`rsl` = '1' then 1 else 0 end) / count(`dd`.`rsl`) as `prc_1`
					, sum(case when `dd`.`rsl` = 'X' then 1 else 0 end) / count(`dd`.`rsl`) as `prc_x`
					, sum(case when `dd`.`rsl` = '2' then 1 else 0 end) / count(`dd`.`rsl`) as `prc_2`
				from (
					select
						  (case when length(`fx`.`lv10o`) < 5 then `fx`.`lv10o` else substring(`fx`.`lv10o`, length(`fx`.`lv10o`)-4,5) end) as `mask`
						, fnutil_get_finalresult(`fx`.`scoredhome`,`fx`.`scoredvisitor`,`fx`.`fixturestatusid`) as `rsl`
					from
						`tbcore_fixture` `fx`
					where
							`fx`.`fixturestatusid` = 2
						and `fx`.`time` < From_p
					) `dd`
				group by
					`dd`.`mask`
			) `pv` on
				`pv`.`mask` = `fx`.`last5_h`
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
						and `fx`.`seasonid` in (select distinct `fx`.`seasonid` from `tbcore_fixture` `fx` where `fx`.`time` between From_p and To_p) 
						and `fx`.`time` < From_p
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
						and `fx`.`seasonid` in (select distinct `fx`.`seasonid` from `tbcore_fixture` `fx` where `fx`.`time` between From_p and To_p) 
						and `fx`.`time` < From_p
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
						and `fx`.`seasonid` in (select distinct `fx`.`seasonid` from `tbcore_fixture` `fx` where `fx`.`time` between From_p and To_p) 
						and `fx`.`time` < From_p
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
						and `fx`.`seasonid` in (select distinct `fx`.`seasonid` from `tbcore_fixture` `fx` where `fx`.`time` between From_p and To_p) 
						and `fx`.`time` < From_p
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
				`fx`.`time` between From_p and To_p
			and ifnull(`sh`.`ply`,0) + ifnull(`sv`.`ply`,0) > 2
	) `dd`
	order by
		 `dd`.`dfv`
		, (`dd`.`gsv`-`dd`.`gav`)+(`dd`.`gah` -`dd`.`gsh`)
		, `dd`.`dpt` desc
		, `dd`.`dft` desc;
END$$
DELIMITER ;
