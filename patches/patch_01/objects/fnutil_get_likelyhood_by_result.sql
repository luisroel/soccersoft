drop function if exists `fnutil_get_likelyhood_by_result`;
delimiter $$
create function`fnutil_get_likelyhood_by_result`(
	  sh_rsl_p	int
	, sv_rsl_p	int
    , sh_ply_p	int
    , sv_ply_p	int
) returns float
begin
	declare likelyhood_v float;
	set likelyhood_v = 	((sh_rsl_p + sv_rsl_p) / (case when sh_ply_p + sv_ply_p = 0 then 1 else sh_ply_p + sv_ply_p end));
	return likelyhood_v;
end$$
delimiter ;
