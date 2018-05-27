DROP TABLE IF EXISTS tbCore_Simulation;
CREATE TABLE tbCore_Simulation (
    `SimId`			BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	`Description`	VARCHAR(50)
);
INSERT INTO tbCore_Simulation (`Description`) VALUES ('Win 7');
INSERT INTO tbCore_Simulation (`Description`) VALUES ('Win Win 7');
INSERT INTO tbCore_Simulation (`Description`) VALUES ('Win Tie 7');
INSERT INTO tbCore_Simulation (`Description`) VALUES ('Tie Win 7');
INSERT INTO tbCore_Simulation (`Description`) VALUES ('All 7');

INSERT INTO tbCore_Simulation (`Description`) VALUES ('Win Full');
INSERT INTO tbCore_Simulation (`Description`) VALUES ('Win Win Full');
INSERT INTO tbCore_Simulation (`Description`) VALUES ('Win Tie Full');
INSERT INTO tbCore_Simulation (`Description`) VALUES ('Tie Win Full');

INSERT INTO tbCore_Simulation (`Description`) VALUES ('Visit Win 7');
INSERT INTO tbCore_Simulation (`Description`) VALUES ('Home Win 7');


