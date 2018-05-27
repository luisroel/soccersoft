drop table if exists tbcore_goals;
create  table tbcore_goals (
	`fixtureid` bigint not null,
    `teamid`	bigint not null,
    `starttime`	int,
    `minute`	int
);