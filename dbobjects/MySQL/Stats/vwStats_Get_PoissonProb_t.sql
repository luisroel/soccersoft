--
--  Get possible outcomes base on attack strength and defence strength
--
DROP VIEW IF EXISTS vwStats_Get_PoissonProb_t;
CREATE VIEW vwStats_Get_PoissonProb_t AS
SELECT
	OC.*
    
    , fnUtil_Get_PoissonProb(0, OC.OH)	AS `POH_0`
    , fnUtil_Get_PoissonProb(1, OC.OH)	AS `POH_1`
    , fnUtil_Get_PoissonProb(2, OC.OH)	AS `POH_2`
    , fnUtil_Get_PoissonProb(3, OC.OH)	AS `POH_3`
    , fnUtil_Get_PoissonProb(4, OC.OH)	AS `POH_4`
    , fnUtil_Get_PoissonProb(5, OC.OH)	AS `POH_5`
    , fnUtil_Get_PoissonProb(6, OC.OH)	AS `POH_6`
    
    , fnUtil_Get_PoissonProb(0, OC.OV)	AS `POV_0`
    , fnUtil_Get_PoissonProb(1, OC.OV)	AS `POV_1`
    , fnUtil_Get_PoissonProb(2, OC.OV)	AS `POV_2`
    , fnUtil_Get_PoissonProb(3, OC.OV)	AS `POV_3`
    , fnUtil_Get_PoissonProb(4, OC.OV)	AS `POV_4`
    , fnUtil_Get_PoissonProb(5, OC.OV)	AS `POV_5`
    , fnUtil_Get_PoissonProb(6, OC.OV)	AS `POV_6`
FROM 
	`vwStats_Get_Outcomes_t` OC;