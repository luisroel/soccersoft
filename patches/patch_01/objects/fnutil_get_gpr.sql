drop function if exists `fnutil_get_gpr`;
delimiter $$
create function`fnutil_get_gpr`(
	  sh_pts_p 	int
	, sh_gls_p	int
	, sh_agn_p	int
	, sv_pts_p	int
	, sv_gls_p	int
	, sv_agn_p	int
) returns float
begin
	declare gpr_v float;
	set gpr_v = ((sh_pts_p * sh_agn_p) / (case when sh_gls_p = 0 then 1 else sh_gls_p end)) /
				(case when sv_pts_p * sv_agn_p *  sv_gls_p = 0 then 1 else (sv_pts_p * sv_agn_p) / sv_gls_p end);
	return gpr_v;
end$$
delimiter ;
