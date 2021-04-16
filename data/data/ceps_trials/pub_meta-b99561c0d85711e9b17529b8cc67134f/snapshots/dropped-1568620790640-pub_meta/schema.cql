CREATE TABLE IF NOT EXISTS ceps_trials.pub_meta (
	id uuid,
	inm_name text,
	cancer_name text,
	t_meta text,
	t_doi text,
	comments text,
	date_submition timestamp,
	link text,
	PRIMARY KEY ((id, inm_name, cancer_name, t_meta), t_doi))
	WITH ID = b99561c0-d857-11e9-b175-29b8cc67134f
	AND CLUSTERING ORDER BY (t_doi ASC)
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
