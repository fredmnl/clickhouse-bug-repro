# Clickhouse Bug Repro (Issue 70023)
Simple setup to repro the clickhouse TTL bug https://github.com/ClickHouse/ClickHouse/issues/70023

## How to reproduce
* I have used the docke image `clickhouse/clickhouse-server:24.3.2.23-alpine`
* All table definition, a docker-compose file and a script to insert dummy data are available in this git repo https://github.com/fredmnl/clickhouse-bug-repro
* Run the clickhouse-server, the table will automatically populate. 
* Run the shell script to automatically insert data. Make sure that the first data point does not lie exactly on a round minute (e.g. 12:34:00), otherwise the bug will not be visible. 
* The behavior should be visible after a minute, when the TTL triggers. 
