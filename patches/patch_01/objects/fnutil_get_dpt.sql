drop function if exists `fnutil_get_dpt`;
delimiter $$
create function`fnutil_get_dpt`(
	  sh_gls_p 	int
	, sv_gls_p	int
	, sh_agn_p	int
	, sv_agn_p	int
) returns float
begin
	declare dpt_v float;
	set dpt_v =	(	(sh_gls_p / (case when sh_gls_p + sv_gls_p = 0 then 1 else sh_gls_p + sv_gls_p end)) -
					(sh_agn_p / (case when sh_agn_p + sv_agn_p = 0 then 1 else sh_agn_p + sv_agn_p end)) 
				) * 100.0;
	return dpt_v;
end$$
delimiter ;
