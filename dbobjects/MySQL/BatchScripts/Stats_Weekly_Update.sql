-- TRUNCATE TABLE tbStats_VisitTable;
-- TRUNCATE TABLE tbStats_HomeTable;
-- TRUNCATE TABLE tbStats_OverallTable;
-- TRUNCATE TABLE tbStats_PoissonAnalysis_t;
-- TRUNCATE TABLE tbStats_PoissonAnalysis;
-- TRUNCATE TABLE tbStats_PoissonAnalysisPts_t;


-- Season Closed
Call spStats_Create_WeeklyData(102, 1, 33);	-- Algeria Division 1 2014/15
Call spStats_Create_WeeklyData(  3, 1, 37); -- Argentina, Primera
Call spStats_Create_WeeklyData(  4, 1, 52); -- Argentina, Nac. B
Call spStats_Create_WeeklyData(  5, 1, 48); -- Argentina, Metro B
Call spStats_Create_WeeklyData( 67, 1, 35);	-- Australia A-League 2014/15
Call spStats_Create_WeeklyData( 19, 1, 33);	-- Australia NSW PL 2015
Call spStats_Create_WeeklyData( 20, 1, 36);	-- Australia Victoria PL 2015
Call spStats_Create_WeeklyData( 21, 1, 29);	-- Australia Brisbane PL 2015
Call spStats_Create_WeeklyData( 22, 1, 23);	-- Australia Western PL 2015
Call spStats_Create_WeeklyData( 23, 1, 31);	-- Australia APL PL 2015
Call spStats_Create_WeeklyData( 24, 1, 29);	-- Australia Queenland SL 2015
Call spStats_Create_WeeklyData( 25, 1, 24);	-- Australia T-League 2015
Call spStats_Create_WeeklyData( 26, 1, 23);	-- Australia Capital Territory 2015
Call spStats_Create_WeeklyData( 27, 1, 24);	-- Australia Northern NSW 2015
Call spStats_Create_WeeklyData(104, 1, 47);	-- Belgium Jupiter League 2014/15
Call spStats_Create_WeeklyData(113, 1, 21);	-- Brazil Campeonato Paulista 2015
Call spStats_Create_WeeklyData(  6, 1, 38);	-- Brazil Serie A
Call spStats_Create_WeeklyData(  7, 1, 40);	-- Brazil Serie B
Call spStats_Create_WeeklyData(  8, 1, 25);	-- Brazil Serie C
Call spStats_Create_WeeklyData(  9, 1, 33);	-- Canada CSL
Call spStats_Create_WeeklyData(105, 1, 21); -- Chile Primera Division 2015-2
Call spStats_Create_WeeklyData(107, 1, 23); -- Chile Primera Division 2015-1
Call spStats_Create_WeeklyData(108, 1, 22); -- Chile Primera Division 2014-2
Call spStats_Create_WeeklyData( 28, 1, 33);	-- China CSL
Call spStats_Create_WeeklyData( 29, 1, 32);	-- China Jia League
Call spStats_Create_WeeklyData( 10, 1, 29);	-- Ecuador Serie A First Stage
Call spStats_Create_WeeklyData( 11, 1, 28);	-- Ecuador Serie A Second Stage
Call spStats_Create_WeeklyData( 74, 1, 33);	-- El Salvador Apertura 2015
Call spStats_Create_WeeklyData( 49, 1, 51);	-- England Championship
Call spStats_Create_WeeklyData( 48, 1, 42);	-- England Premier League 2014/15
Call spStats_Create_WeeklyData( 36, 1, 42);	-- Estonia Meistriliiga
Call spStats_Create_WeeklyData( 37, 1, 42);	-- Findland Veikkausliiga
Call spStats_Create_WeeklyData( 38, 1, 31);	-- Findland Ykkönen
Call spStats_Create_WeeklyData( 50, 1, 42);	-- France League 1
Call spStats_Create_WeeklyData( 51, 1, 42);	-- France League 2
Call spStats_Create_WeeklyData( 52, 1, 34);	-- Germany Bundesliga
Call spStats_Create_WeeklyData( 53, 1, 34);	-- Germany 2.Bundesliga
Call spStats_Create_WeeklyData( 80, 1, 32);	-- Guatemala Liga Nacional Apertura 2015
Call spStats_Create_WeeklyData( 39, 1, 22);	-- Iceland Pepsideild
Call spStats_Create_WeeklyData( 40, 1, 24);	-- Iceland Division 1
Call spStats_Create_WeeklyData( 41, 1, 42);	-- Ireland Premier
Call spStats_Create_WeeklyData( 43, 1, 31);	-- Ireland Division 1
Call spStats_Create_WeeklyData( 54, 1, 40);	-- Italy Serie A
Call spStats_Create_WeeklyData( 55, 1, 52);	-- Italy Serie B
Call spStats_Create_WeeklyData( 30, 1, 41);	-- Japan J1 League
Call spStats_Create_WeeklyData( 31, 1, 46);	-- Japan J2 League
Call spStats_Create_WeeklyData( 33, 1, 25);	-- Malasya Super League
Call spStats_Create_WeeklyData( 17, 1, 23);	-- Mexico Liga MX Clausura 2015
Call spStats_Create_WeeklyData( 18, 1, 25);	-- Mexico Liga MX Aperura 2016
Call spStats_Create_WeeklyData( 77, 1, 24);	-- Mexico Liga MX Aperura 2016
Call spStats_Create_WeeklyData( 56, 1, 39);	-- Netherlands Eridivise 2014/15
Call spStats_Create_WeeklyData( 44, 1, 34);	-- Norway Tippeligaen
Call spStats_Create_WeeklyData( 45, 1, 34);	-- Norway OBOS-ligaen
Call spStats_Create_WeeklyData( 12, 1, 17);	-- Peru 1ra Apertura
Call spStats_Create_WeeklyData( 13, 1, 27);	-- Peru 1ra Clausura
Call spStats_Create_WeeklyData(103, 1, 28);	-- Qatar Premier League 2014/15
Call spStats_Create_WeeklyData( 32, 1, 43);	-- Korea South, K League
Call spStats_Create_WeeklyData( 46, 1, 39);	-- Spain La Liga 2014/15
Call spStats_Create_WeeklyData( 47, 1, 45);	-- Spain 2da Div 2014/15
Call spStats_Create_WeeklyData( 34, 1, 40);	-- Thailand PL 
Call spStats_Create_WeeklyData(  1, 1, 57); -- USA MLS
Call spStats_Create_WeeklyData( 14, 1, 11);	-- USA NASL Spring Season
Call spStats_Create_WeeklyData( 15, 1, 35);	-- USA NASL Fall Season
Call spStats_Create_WeeklyData( 16, 1, 50);	-- USA USL
Call spStats_Create_WeeklyData( 35, 1, 26);	-- Vietnam V.League

-- 2015/16 closed



-- Seasons opened
Call spStats_Create_WeeklyData( 88, 27, 28);	-- Algeria Division 1 2015/16
Call spStats_Create_WeeklyData(110,  8, 10);	-- Argentina Prim B Metro 2016				
Call spStats_Create_WeeklyData(111,  8, 10);	-- Argentina Prim B Nac 2016
Call spStats_Create_WeeklyData(112,  8, 10);	-- Argentina Primera Div 2016
Call spStats_Create_WeeklyData( 68, 25, 27);	-- Australia A-League 2015/16
Call spStats_Create_WeeklyData(109, 28, 29);	-- Austria Tipico Bundesliga 2015/16		
Call spStats_Create_WeeklyData( 79, 31, 32);	-- Belgium Jupiter League 2015/16
Call spStats_Create_WeeklyData( 98, 32, 33);	-- Belgium Proximus League 2015/16
Call spStats_Create_WeeklyData( 99, 12, 13);	-- Bolivia Liga de Futbol Prof 2016-1
Call spStats_Create_WeeklyData(115, 11, 13);	-- Brazil Campeonato Gaucho					
Call spStats_Create_WeeklyData(116, 10, 12);	-- Brazil Campeonato Mineiro				
Call spStats_Create_WeeklyData(119, 11, 12);	-- Brazil Campeonato Paranaense				
Call spStats_Create_WeeklyData(120, 15, 17);	-- Brazil Campeonato Paulista 2016
Call spStats_Create_WeeklyData(106, 11, 13); 	-- Chile Primera Division 2016-1
Call spStats_Create_WeeklyData( 95, 15, 18);	-- Costa Rica Primera Division 2016-1
Call spStats_Create_WeeklyData( 93, 28, 29);	-- Croatia HNL 2015/16						
Call spStats_Create_WeeklyData(100, 25, 26);	-- Egypt Premier League 2015/16				
Call spStats_Create_WeeklyData( 75, 15, 17);	-- El Salvador Clasura 2016
Call spStats_Create_WeeklyData( 58, 43, 44);	-- England Championship 2015/16				
Call spStats_Create_WeeklyData( 76, 48, 52);	-- England League One 2015/16				
Call spStats_Create_WeeklyData( 97, 48, 52);	-- England League Two 2015/16				
Call spStats_Create_WeeklyData( 57, 31, 32);	-- England Premier League 2015/16			
Call spStats_Create_WeeklyData(121, 47, 51);	-- England Vanarama National League 2015/16	
Call spStats_Create_WeeklyData(122, 46, 50);	-- England Vanarama National League North 2015/16
Call spStats_Create_WeeklyData(123, 48, 53);	-- England Vanarama National League South 2015/16
Call spStats_Create_WeeklyData( 59, 34, 35);	-- France League 1 2015/16
Call spStats_Create_WeeklyData( 60, 31, 32);	-- France League 2 2015/16
Call spStats_Create_WeeklyData( 92, 30, 32);	-- France Nacional 2015/16
Call spStats_Create_WeeklyData( 70, 27, 28);	-- Germany 2.Bundesliga 2015/16				
Call spStats_Create_WeeklyData( 69, 27, 28);	-- Germany Bundesliga 2015/16				
Call spStats_Create_WeeklyData( 71, 29, 30);	-- Grecce Super League 2015/16
Call spStats_Create_WeeklyData( 81, 15, 17);	-- Guatemala Liga Nacional Clasura 2016
Call spStats_Create_WeeklyData( 89, 12, 14);	-- Honduras Liga Nacional 2016-1
Call spStats_Create_WeeklyData(125, 25, 26);	-- Iran Persian Gulf Pro League 2015/16
Call spStats_Create_WeeklyData( 91, 28, 29);	-- Israel Ligat haAl 2015/16
Call spStats_Create_WeeklyData( 61, 31, 32);	-- Italy Serie A 2015/16
Call spStats_Create_WeeklyData( 62, 35, 37);	-- Italy Serie B 2015/16
Call spStats_Create_WeeklyData( 78, 11, 13);	-- Mexico Ascenso MX Clausura 2016
Call spStats_Create_WeeklyData( 63, 11, 13);	-- Mexico Liga MX Clausura 2016
Call spStats_Create_WeeklyData( 87, 34, 35);	-- Netherlands Eerste 2015/16
Call spStats_Create_WeeklyData( 64, 28, 29);	-- Netherlands Eridivise 2015/16
Call spStats_Create_WeeklyData( 90, 38, 40);	-- North Ireland Premiership 2015/16		
Call spStats_Create_WeeklyData( 94, 11, 14);	-- Paraguay Primera Division 2016			
Call spStats_Create_WeeklyData( 72, 29, 30);	-- Portugal Primeira Liga 2015/16
Call spStats_Create_WeeklyData( 86, 41, 44);	-- Portugal Segunda Liga 2015/16
Call spStats_Create_WeeklyData(101, 24, 25);	-- Qatar Premier League 2015/16
Call spStats_Create_WeeklyData( 96, 36, 39);	-- Scotland Premiership 2015/162			
Call spStats_Create_WeeklyData( 65, 31, 32);	-- Spain La Liga 2015/16					
Call spStats_Create_WeeklyData( 82, 30, 32);	-- Spain Segunda B Gpo. 1 2015/16
Call spStats_Create_WeeklyData( 83, 30, 33);	-- Spain Segunda B Gpo. 2 2015/16
Call spStats_Create_WeeklyData( 84, 31, 33);	-- Spain Segunda B Gpo. 3 2015/16
Call spStats_Create_WeeklyData( 85, 32, 35);	-- Spain Segunda B Gpo. 4 2015/16
Call spStats_Create_WeeklyData( 66, 31, 33);	-- Spain 2da Div 2015/16
Call spStats_Create_WeeklyData(124, 14, 17);	-- Venezuela Primera Division 2016






