drop function if exists `fnutil_get_dft`;
delimiter $$
create function`fnutil_get_dft`(
	  sh_gls_p 	int
	, sv_gls_p	int
	, sh_agn_p	int
	, sv_agn_p	int
) returns float
begin
	declare dft_v float;
	set dft_v =	( 	(	sh_gls_p / (case when sh_agn_p = 0 then 1 else sh_agn_p end)	) - 
					(	sv_gls_p / (case when sv_agn_p = 0 then 1 else sv_agn_p end)	)
                ) * 10.00;
	return dft_v;
end$$
delimiter ;
