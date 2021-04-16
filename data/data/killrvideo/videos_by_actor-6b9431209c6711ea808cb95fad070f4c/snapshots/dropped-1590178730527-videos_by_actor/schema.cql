CREATE TYPE killrvideo.video_encoding(encoding text, height int, width int, bit_rates set<text>);
CREATE TABLE IF NOT EXISTS killrvideo.videos_by_actor (
	actor text,
	added_date timestamp,
	video_id timeuuid,
	character_name text,
	description text,
	encoding frozen<video_encoding>,
	title text,
	user_id uuid,
	tags set<text>,
	PRIMARY KEY (actor, added_date, video_id))
	WITH ID = 6b943120-9c67-11ea-808c-b95fad070f4c
	AND CLUSTERING ORDER BY (added_date DESC, video_id ASC)
	AND bloom_filter_fp_chance = 0.01
	AND dclocal_read_repair_chance = 0.1
	AND crc_check_chance = 1.0
	AND default_time_to_live = 0
	AND gc_grace_seconds = 864000
	AND min_index_interval = 128
	AND max_index_interval = 2048
	AND memtable_flush_period_in_ms = 0
	AND read_repair_chance = 0.0
	AND speculative_retry = '99PERCENTILE'
	AND comment = ''
	AND caching = { 'keys': 'ALL', 'rows_per_partition': 'NONE' }
	AND compaction = { 'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy' }
	AND compression = { 'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor' }
	AND cdc = false
	AND extensions = {  };
