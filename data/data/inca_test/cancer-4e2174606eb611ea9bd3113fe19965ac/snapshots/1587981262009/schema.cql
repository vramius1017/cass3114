CREATE TABLE IF NOT EXISTS inca_test.cancer (
	cid uuid,
	cname text,
	idd text,
	cclass text,
	define text,
	label text,
	PRIMARY KEY ((cid, cname), idd, cclass))
	WITH ID = 4e217460-6eb6-11ea-9bd3-113fe19965ac
	AND CLUSTERING ORDER BY (idd ASC, cclass ASC)
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
ALTER TABLE inca_test.cancer DROP label USING TIMESTAMP 1585154728690000;
