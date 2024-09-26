CREATE TABLE logs.events_aggregated
(
    timestamp    DateTime,
    number_of_op UInt64,
)
Engine = SummingMergeTree
PARTITION BY toStartOfDay(timestamp)
ORDER BY (
            toStartOfDay(timestamp),
            toStartOfHour(timestamp),
            toStartOfMinute(timestamp),
            timestamp,
         )
TTL
    timestamp + INTERVAL 1 MINUTE
        GROUP BY toStartOfDay(timestamp), toStartOfHour(timestamp), toStartOfMinute(timestamp)
        SET
            timestamp = toStartOfMinute(min(timestamp)),
            number_of_op = sum(number_of_op),
    timestamp + INTERVAL 30 MINUTE
        GROUP BY toStartOfDay(timestamp), toStartOfHour(timestamp)
        SET
            timestamp = toStartOfHour(min(timestamp)),
            number_of_op = sum(number_of_op),
    timestamp + INTERVAL 2 HOUR
        GROUP BY toStartOfDay(timestamp)
        SET
            timestamp = toStartOfDay(min(timestamp)),
            number_of_op = sum(number_of_op)

