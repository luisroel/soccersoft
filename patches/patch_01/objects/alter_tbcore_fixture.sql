
alter table tbcore_fixture add lh10On varchar(15) default '';
-- update `tbcore_fixture` set lh10ON = fnutil_get_last10onormal(`hometeamid`, `time`, `seasonid`);

alter table tbcore_fixture add lv10On varchar(15) default '';
-- update `tbcore_fixture` set lv10ON = fnutil_get_last10onormal(`visitorteamid`, `time`, `seasonid`);

alter table tbcore_fixture add lh10n varchar(15) default '';
-- update `tbcore_fixture` set lh10n = fnutil_get_last10hnormal(`hometeamid`, `time`, `seasonid`);

alter table tbcore_fixture add lv10N varchar(15) default '';
-- update `tbcore_fixture` set lv10n = fnutil_get_last10vnormal(`visitorteamid`, `time`, `seasonid`);

alter table tbcore_fixture add lh10O varchar(15) default '';
-- update `tbcore_fixture` set lh10O = fnutil_get_last10o(`hometeamid`, `time`, `seasonid`);

alter table tbcore_fixture add lv10O varchar(15) default '';
-- update `tbcore_fixture` set lv10O = fnutil_get_last10o(`visitorteamid`, `time`, `seasonid`);

alter table tbcore_fixture add lh10 varchar(15) default '';
-- update `tbcore_fixture` set lh10 = fnutil_get_last10h(`hometeamid`, `time`, `seasonid`);

alter table tbcore_fixture add lv10 varchar(15) default '';
-- update `tbcore_fixture` set lv10 = fnutil_get_last10v(`visitorteamid`, `time`, `seasonid`);
