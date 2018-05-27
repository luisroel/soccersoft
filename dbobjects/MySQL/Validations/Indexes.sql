-- DROP INDEX idxFixture_StatusSeasonPhase ON tbCore_Fixture;
-- DROP INDEX idxFixture_StatusVisitorTime ON tbCore_Fixture;
-- DROP INDEX idxFixture_StatusTime ON tbCore_Fixture;
-- DROP INDEX idxSeasonTeam_SeasonTeam ON tbCore_SeasonTeam;

-- CREATE INDEX idxFixture_StatusSeasonPhase ON tbCore_Fixture (FixtureStatusId, SeasonId, PhaseId);
-- CREATE INDEX idxFixture_StatusVisitorTime ON tbCore_Fixture (FixtureStatusId, VisitorTeamId, `Time`);
-- CREATE INDEX idxFixture_StatusSeasonHome ON tbCore_Fixture (FixtureStatusId, SeasonId, HomeTeamId);
-- CREATE INDEX idxFixture_StatusHomeTime ON tbCore_Fixture (FixtureStatusId, HomeTeamId, `Time`);
-- CREATE INDEX idxFixture_StatusTime ON tbCore_Fixture (FixtureStatusId, `Time`, HomeTeamId, VisitorTeamId);

CREATE INDEX idxSeasonTeam_SeasonTeam ON tbCore_SeasonTeam (SeasonId, TeamId);
CREATE INDEX idxSeasonTeam_TeamSeason ON tbCore_SeasonTeam (TeamId, SeasonId);