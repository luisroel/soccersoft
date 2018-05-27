--
-- Fixtures to be analyzed must have not been closed. (FixtureStatusId <> 2)
--
DROP PROCEDURE IF EXISTS spStats_Create_FrecuencyTablePts;
DELIMITER $$
CREATE PROCEDURE spStats_Create_FrecuencyTablePts(
	  IN fromDate_p	DATETIME
    , IN toDate_p 	DATETIME
)
BEGIN
	DECLARE cDate_v DATETIME;
    
	DELETE FROM tbStats_FrecuencyTablePts WHERE aDate >= fromDate_p AND aDate <= toDate_p;

	SET cDate_v = fromDate_p;
	WHILE cDate_v <= toDate_p DO
    
		INSERT INTO tbStats_FrecuencyTablePts
        SELECT
			cDate_v
            , 'THAGS'
			, TT.THAGS
			, 	(	SUM(CASE WHEN TT.Rsl = 'S' THEN 1 ELSE 0 END)
					- SUM(CASE WHEN TT.Rsl = 'F' THEN 1 ELSE 0 END ) 
				)	* 100
			/ COUNT(*)	AS 'T'
		FROM (
			SELECT
				  ROUND((TRUNCATE((PA.THAGS * 100), 0) / 100), 1) AS THAGS
				, T.Rsl
			FROM
				tbStats_PoissonAnalysisPts_t PA
				INNER JOIN  (   
					SELECT
						  PA.FixtureId
						, FT.Time
						, TH.Name AS Home
						, CASE	WHEN FT.ScoredHome > FT.ScoredVisitor THEN 'S'
								ELSE 'F'
						END AS Rsl
					FROM
						tbStats_PoissonAnalysis_t PA
						INNER JOIN tbCore_Fixture FT ON
							FT.FixtureId = PA.FixtureId
						INNER JOIN tbCore_Team TH ON
							TH.TeamId = FT.HomeTeamId
					WHERE
							PA.Pb_Home >= 0.6
						AND FT.Time < cDate_v
					ORDER BY
						  FT.Time DESC
						, TH.Name
					LIMIT 2000
				) T ON
					T.FixtureId = PA.FixtureId
				ORDER BY
					  T.Time
					, T.Home
				LIMIT 2000
			) TT
		GROUP BY 
			TT.THAGS;
    
    	INSERT INTO tbStats_FrecuencyTablePts
		SELECT
			  cDate_v
			, 'TVAGC'
			, TT.TVAGC
			,	(	SUM(CASE WHEN TT.Rsl = 'S' THEN 1 ELSE 0 END)
					- SUM(CASE WHEN TT.Rsl = 'F' THEN 1 ELSE 0 END)
				)	* 100
				/ COUNT(*)	AS 'T'
		FROM (
			SELECT
				  ROUND((TRUNCATE((PA.TVAGC * 100), 0) / 100), 1) AS TVAGC
				, T.Rsl
			FROM
				tbStats_PoissonAnalysisPts_t PA
				INNER JOIN  (   
					SELECT
						  PA.FixtureId
						, FT.Time
						, TH.Name AS Home
						, CASE	WHEN FT.ScoredHome > FT.ScoredVisitor THEN 'S'
								ELSE 'F'
						END AS Rsl
					FROM
						tbStats_PoissonAnalysis_t PA
						INNER JOIN tbCore_Fixture FT ON
							FT.FixtureId = PA.FixtureId
						INNER JOIN tbCore_Team TH ON
							TH.TeamId = FT.HomeTeamId
					WHERE
							PA.Pb_Home >= 0.6
						AND FT.Time < cDate_v
					ORDER BY
						  FT.Time DESC
						, TH.Name
					LIMIT 2000
				) T ON
					T.FixtureId = PA.FixtureId
				ORDER BY
					  T.Time
					, T.Home
				LIMIT 2000
			) TT
		GROUP BY 
			TT.TVAGC;
    
	
		INSERT INTO tbStats_FrecuencyTablePts
		SELECT
			  cDate_v
			, 'TVAGS'
			, TT.TVAGS
			, (SUM( CASE WHEN TT.Rsl = 'S' THEN 1 ELSE 0 END )
			- SUM( CASE WHEN TT.Rsl = 'F' THEN 1 ELSE 0 END ) )	* 100
			/ COUNT(*)	AS 'T'
		FROM (
			SELECT
				  ROUND((TRUNCATE((PA.TVAGS * 100), 0) / 100), 1) AS TVAGS
				, T.Rsl
			FROM
				tbStats_PoissonAnalysisPts_t PA
				INNER JOIN  (   
					SELECT
						  PA.FixtureId
						, FT.Time
						, TH.Name AS Home
						, CASE	WHEN FT.ScoredHome > FT.ScoredVisitor THEN 'S'
								ELSE 'F'
						END AS Rsl
					FROM
						tbStats_PoissonAnalysis_t PA
						INNER JOIN tbCore_Fixture FT ON
							FT.FixtureId = PA.FixtureId
						INNER JOIN tbCore_Team TH ON
							TH.TeamId = FT.HomeTeamId
					WHERE
							PA.Pb_Home >= 0.6
						AND FT.Time < cDate_v
					ORDER BY
						  FT.Time DESC
						, TH.Name
					LIMIT 2000
				) T ON
					T.FixtureId = PA.FixtureId
				ORDER BY
					  T.Time
					, T.Home
				LIMIT 2000
			) TT
		GROUP BY 
			TT.TVAGS;
            
		INSERT INTO tbStats_FrecuencyTablePts
		SELECT
			  cDate_v
			, 'THAGC'
            , TT.THAGC
			, (SUM( CASE WHEN TT.Rsl = 'S' THEN 1 ELSE 0 END )
			- SUM( CASE WHEN TT.Rsl = 'F' THEN 1 ELSE 0 END ) )	* 100
			/ COUNT(*)	AS 'T'
		FROM (
			SELECT
				  ROUND((TRUNCATE((PA.THAGC * 100), 0) / 100), 1) AS THAGC
				, T.Rsl
			FROM
				tbStats_PoissonAnalysisPts_t PA
				INNER JOIN  (   
					SELECT
						  PA.FixtureId
						, FT.Time
						, TH.Name AS Home
						, CASE	WHEN FT.ScoredHome > FT.ScoredVisitor THEN 'S'
								ELSE 'F'
						END AS Rsl
					FROM
						tbStats_PoissonAnalysis_t PA
						INNER JOIN tbCore_Fixture FT ON
							FT.FixtureId = PA.FixtureId
						INNER JOIN tbCore_Team TH ON
							TH.TeamId = FT.HomeTeamId
					WHERE
							PA.Pb_Home >= 0.6
						AND FT.Time < cDate_v
					ORDER BY
						  FT.Time DESC
						, TH.Name
					LIMIT 2000
				) T ON
					T.FixtureId = PA.FixtureId
				ORDER BY
					  T.Time
					, T.Home
				LIMIT 2000
			) TT
		GROUP BY 
			TT.THAGC;
        
		INSERT INTO tbStats_FrecuencyTablePts
		SELECT
			  cDate_v
			, 'THAS'
			, TT.THAS
			, (SUM( CASE WHEN TT.Rsl = 'S' THEN 1 ELSE 0 END )
			- SUM( CASE WHEN TT.Rsl = 'F' THEN 1 ELSE 0 END ) )	* 100
			/ COUNT(*)	AS 'T'
		FROM (
			SELECT
				  ROUND((TRUNCATE((PA.THAS * 100), 0) / 100), 1) AS THAS
				, T.Rsl
			FROM
				tbStats_PoissonAnalysisPts_t PA
				INNER JOIN  (   
					SELECT
						  PA.FixtureId
						, FT.Time
						, TH.Name AS Home
						, CASE	WHEN FT.ScoredHome > FT.ScoredVisitor THEN 'S'
								ELSE 'F'
						END AS Rsl
					FROM
						tbStats_PoissonAnalysis_t PA
						INNER JOIN tbCore_Fixture FT ON
							FT.FixtureId = PA.FixtureId
						INNER JOIN tbCore_Team TH ON
							TH.TeamId = FT.HomeTeamId
					WHERE
							PA.Pb_Home >= 0.6
						AND FT.Time < cDate_v
					ORDER BY
						  FT.Time DESC
						, TH.Name
					LIMIT 2000
				) T ON
					T.FixtureId = PA.FixtureId
				ORDER BY
					  T.Time
					, T.Home
				LIMIT 2000
			) TT
		GROUP BY 
			TT.THAS;
        
		INSERT INTO tbStats_FrecuencyTablePts
		SELECT
			  cDate_v
			, 'TVDS'
			, TT.TVDS
			, (SUM( CASE WHEN TT.Rsl = 'S' THEN 1 ELSE 0 END )
			- SUM( CASE WHEN TT.Rsl = 'F' THEN 1 ELSE 0 END ) )	* 100
			/ COUNT(*)	AS 'T'
		FROM (
			SELECT
				  ROUND((TRUNCATE((PA.TVDS * 100), 0) / 100), 1) AS TVDS
				, T.Rsl
			FROM
				tbStats_PoissonAnalysisPts_t PA
				INNER JOIN  (   
					SELECT
						  PA.FixtureId
						, FT.Time
						, TH.Name AS Home
						, CASE	WHEN FT.ScoredHome > FT.ScoredVisitor THEN 'S'
								ELSE 'F'
						END AS Rsl
					FROM
						tbStats_PoissonAnalysis_t PA
						INNER JOIN tbCore_Fixture FT ON
							FT.FixtureId = PA.FixtureId
						INNER JOIN tbCore_Team TH ON
							TH.TeamId = FT.HomeTeamId
					WHERE
							PA.Pb_Home >= 0.6
						AND FT.Time < cDate_v
					ORDER BY
						  FT.Time DESC
						, TH.Name
					LIMIT 2000
				) T ON
					T.FixtureId = PA.FixtureId
				ORDER BY
					  T.Time
					, T.Home
				LIMIT 2000
			) TT
		GROUP BY 
			TT.TVDS;
        
		INSERT INTO tbStats_FrecuencyTablePts
		SELECT
			  cDate_v
            , 'TVAS'
			, TT.TVAS
			, (SUM( CASE WHEN TT.Rsl = 'S' THEN 1 ELSE 0 END )
			- SUM( CASE WHEN TT.Rsl = 'F' THEN 1 ELSE 0 END ) )	* 100
			/ COUNT(*)	AS 'T'
		FROM (
			SELECT
				  ROUND((TRUNCATE((PA.TVAS * 100), 0) / 100), 1) AS TVAS
				, T.Rsl
			FROM
				tbStats_PoissonAnalysisPts_t PA
				INNER JOIN  (   
					SELECT
						  PA.FixtureId
						, FT.Time
						, TH.Name AS Home
						, CASE	WHEN FT.ScoredHome > FT.ScoredVisitor THEN 'S'
								ELSE 'F'
						END AS Rsl
					FROM
						tbStats_PoissonAnalysis_t PA
						INNER JOIN tbCore_Fixture FT ON
							FT.FixtureId = PA.FixtureId
						INNER JOIN tbCore_Team TH ON
							TH.TeamId = FT.HomeTeamId
					WHERE
							PA.Pb_Home >= 0.6
						AND FT.Time < cDate_v
					ORDER BY
						  FT.Time DESC
						, TH.Name
					LIMIT 2000
				) T ON
					T.FixtureId = PA.FixtureId
				ORDER BY
					  T.Time
					, T.Home
				LIMIT 2000
			) TT
		GROUP BY 
			TT.TVAS;

		INSERT INTO tbStats_FrecuencyTablePts
		SELECT
			  cDate_v
			, 'THDS'
			, TT.THDS
			, (SUM( CASE WHEN TT.Rsl = 'S' THEN 1 ELSE 0 END )
			- SUM( CASE WHEN TT.Rsl = 'F' THEN 1 ELSE 0 END ) )	* 100
			/ COUNT(*)	AS 'T'
		FROM (
			SELECT
				  ROUND((TRUNCATE((PA.THDS * 100), 0) / 100), 1) AS THDS
				, T.Rsl
			FROM
				tbStats_PoissonAnalysisPts_t PA
				INNER JOIN  (   
					SELECT
						  PA.FixtureId
						, FT.Time
						, TH.Name AS Home
						, CASE	WHEN FT.ScoredHome > FT.ScoredVisitor THEN 'S'
								ELSE 'F'
						END AS Rsl
					FROM
						tbStats_PoissonAnalysis_t PA
						INNER JOIN tbCore_Fixture FT ON
							FT.FixtureId = PA.FixtureId
						INNER JOIN tbCore_Team TH ON
							TH.TeamId = FT.HomeTeamId
					WHERE
							PA.Pb_Home >= 0.6
						AND FT.Time < cDate_v
					ORDER BY
						  FT.Time DESC
						, TH.Name
					LIMIT 2000
				) T ON
					T.FixtureId = PA.FixtureId
				ORDER BY
					  T.Time
					, T.Home
				LIMIT 2000
			) TT
		GROUP BY 
			TT.THDS;
        
		SET cDate_v = DATE_ADD(cDate_v, INTERVAL 1 DAY);
	END WHILE;

END$$
DELIMITER ;
