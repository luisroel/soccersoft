--
--  Overall Raw Stats
--
DROP VIEW IF EXISTS vwStats_Get_RawOverall_Tmp;
CREATE VIEW vwStats_Get_RawOverall_Tmp AS
SELECT
	  T.SeasonId
	, T.Time
    , T.Round
    , T.TeamId
	, T.Played		AS PLH
    , T.Wins		AS WNH
    , T.Draws		AS DRH
    , T.Losses		AS LSH
    , T.Scored		AS SCH
    , T.Against		AS AGH
    , T.Diff		AS DFH
    , T.Points		AS PTH
    , 0				AS PLA
    , 0				AS WNA
    , 0				AS DRA
    , 0				AS LSA
    , 0				AS SCA
    , 0				AS AGA
    , 0				AS DFA
    , 0				AS PTA
	, T.Played		AS PLO
    , T.Wins		AS WNO
    , T.Draws		AS DRO
    , T.Losses		AS LSO
    , T.Scored		AS SCO
    , T.Against		AS AGO
    , T.Diff		AS DFO
    , T.Points		AS PTO
FROM
	`vwStats_Get_RawHome_Tmp` T
UNION ALL
SELECT
	  T.SeasonId
	, T.Time
    , T.Round
    , T.TeamId
    , 0				AS PLH
    , 0				AS WNH
    , 0				AS DRH
    , 0				AS LSH
    , 0				AS SCH
    , 0				AS AGH
    , 0				AS DFH
    , 0				AS PTH
	, T.Played		AS PLA
    , T.Wins		AS WNA
    , T.Draws		AS DRA
    , T.Losses		AS LSA
    , T.Scored		AS SCA
    , T.Against		AS AGA
    , T.Diff		AS DFA
    , T.Points		AS PTA
	, T.Played		AS PLO
    , T.Wins		AS WNO
    , T.Draws		AS DRO
    , T.Losses		AS LSO
    , T.Scored		AS SCO
    , T.Against		AS AGO
    , T.Diff		AS DFO
    , T.Points		AS PTO
FROM
	`vwStats_Get_RawAway_Tmp` T;