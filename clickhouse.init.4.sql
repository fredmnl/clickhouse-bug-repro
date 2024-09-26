CREATE MATERIALIZED VIEW logs.events_aggregation_mv
TO logs.events_aggregated
AS
SELECT
    timestamp,
    count() as number_of_op
FROM logs.events
GROUP BY timestamp

