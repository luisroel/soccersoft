drop function if exists `fnutil_get_relation`;
delimiter $$
create function `fnutil_get_relation`(sh_gls_p int, sv_gls_p int) returns float
begin
	declare dgs_v float;
	set dgs_v = (sh_gls_p / (case when sv_gls_p = 0 then 1 else sv_gls_p end));
	return ifnull(dgs_v, 0.0);
end$$
delimiter ;
