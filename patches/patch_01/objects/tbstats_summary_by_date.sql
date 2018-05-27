drop table if exists tbstats_summary_by_date;
create table tbstats_summary_by_date (
	  `day`			datetime
    , `dayofyear`	int
    , `dayofweek`	int
    , `group`		varchar(5)
    , `total`		int
    , `nohome`		int
    , `nodraw`		int
    , `novisitor`	int
    , `porhome`		float
    , `pordraw`		float
    , `porvisitor`	float
);