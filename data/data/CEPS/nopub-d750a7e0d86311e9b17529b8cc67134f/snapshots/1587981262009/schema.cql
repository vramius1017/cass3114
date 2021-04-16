CREATE TABLE IF NOT EXISTS ceps.nopub (
	id uuid,
	title text,
	t_doi text,
	meta_doi text,
	inm_name text,
	cancer_name text,
	comments text,
	date_submition timeuuid,
	link text,
	date_validation_ko timeuuid,
	PRIMARY KEY ((id, title, t_doi, meta_doi, inm_name, cancer_name, comments), date_submition, link))
	WITH ID = d750a7e0-d863-11e9-b175-29b8cc67134f
	AND CLUSTERING ORDER BY (date_submition ASC, link ASC)
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
	AND comment = 'timeuuid  --> utiliser toDate(timeuuid) pour recuperer ou inserer SELECT,INSERT ouUPDATE'
	AND caching = { 'keys': 'ALL', 'rows_per_partition': 'NONE' }
	AND compaction = { 'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy' }
	AND compression = { 'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor' }
	AND cdc = false
	AND extensions = {  };
