CREATE TABLE logs.events
(
    timestamp DateTime,
    msg       String,
)
Engine = MergeTree
PARTITION BY toStartOfDay(timestamp)
ORDER BY timestamp

