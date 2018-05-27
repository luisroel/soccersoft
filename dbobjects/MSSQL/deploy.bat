
ECHO OFF
SET ServerName=%1
SET DbUser=%2
SET DbPassword=%3
SET DBName=SoccerSoft

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Market\tbCore_Market.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Market\spCore_Delete_Market.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Market\spCore_Get_MarketList.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Market\spCore_Insert_Market.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Market\spCore_Update_Market.sql

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Country\tbCore_Country.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Country\spCore_Delete_Country.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Country\spCore_Get_CountryList.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Country\spCore_Insert_Country.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Country\spCore_Update_Country.sql

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Confederation\tbCore_Confederation.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Confederation\spCore_Delete_Confederation.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Confederation\spCore_Get_ConfederationList.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Confederation\spCore_Insert_Confederation.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Confederation\spCore_Update_Confederation.sql

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Association\tbCore_Association.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Association\spCore_Delete_Association.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Association\spCore_Get_AssociationList.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Association\spCore_Insert_Association.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Association\spCore_Update_Association.sql

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Position\tbCore_Position.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Position\spCore_Delete_Position.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Position\spCore_Get_PositionList.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Position\spCore_Insert_Position.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Position\spCore_Update_Position.sql

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Player\tbCore_Player.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Player\spCore_Delete_Player.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Player\spCore_Get_PlayerList.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Player\spCore_Insert_Player.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Player\spCore_Update_Player.sql

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Team\tbCore_Team.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Team\tbCore_SeasonTeam.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Team\spCore_Insert_SeasonTeam.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Team\spCore_Insert_Team.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Team\spCore_Update_Team.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Team\spCore_Delete_Team.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Team\spCore_Delete_SeasonTeams.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Team\spCore_Get_TeamList.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Team\spCore_Get_AvailableTeams.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Team\spCore_Get_SeasonTeams.sql

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\FixtureType\tbCore_FixtureType.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\FixtureType\spCore_Delete_FixtureType.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\FixtureType\spCore_Get_FixtureTypeList.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\FixtureType\spCore_Insert_FixtureType.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\FixtureType\spCore_Update_FixtureType.sql

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\TournamentType\tbCore_TournamentType.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\TournamentType\tbCore_TournamentPhase.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\TournamentType\spCore_Delete_TournamentType.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\TournamentType\spCore_Get_TournamentTypeList.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\TournamentType\spCore_Insert_TournamentType.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\TournamentType\spCore_Update_TournamentType.sql

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Fixture\tbCore_Fixture.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Fixture\spCore_Delete_Fixture.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Fixture\spCore_Get_FixtureList.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Fixture\spCore_Insert_Fixture.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Fixture\spCore_Update_Fixture.sql

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Phase\tbCore_Phase.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Phase\spCore_Delete_Phase.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Phase\spCore_Get_PhaseList.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Phase\spCore_Insert_Phase.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Phase\spCore_Update_Phase.sql

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Stadium\tbCore_Stadium.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Stadium\spCore_Delete_Stadium.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Stadium\spCore_Get_StadiumList.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Stadium\spCore_Insert_Stadium.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Stadium\spCore_Update_Stadium.sql

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Season\tbCore_Season.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Season\spCore_Delete_Season.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Season\spCore_Get_SeasonList.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Season\spCore_Insert_Season.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Season\spCore_Update_Season.sql

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Tournament\tbCore_Tournament.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Tournament\spCore_Delete_Tournament.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Tournament\spCore_Get_TournamentList.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Tournament\spCore_Get_TournamentListByAssociation.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Tournament\spCore_Insert_Tournament.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Tournament\spCore_Update_Tournament.sql

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Stat\tbCore_Stat.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Stat\spCore_Delete_Stat.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Stat\spCore_Get_StatList.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Stat\spCore_Insert_Stat.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i .\Stat\spCore_Update_Stat.sql

osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i dtCore_Init_Data.sql
osql -S %ServerName% -U %DbUser% -P %DbPassword% -d %DBName% -i dtCore_Init_SetupData.sql
