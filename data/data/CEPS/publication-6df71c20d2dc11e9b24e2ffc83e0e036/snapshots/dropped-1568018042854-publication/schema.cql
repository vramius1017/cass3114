CREATE TYPE "CEPS".cat(name text, code text);
CREATE TYPE "CEPS".scat(name text, code text);
CREATE TABLE IF NOT EXISTS "CEPS".publication (
	id uuid PRIMARY KEY,
	abstract text,
	action text,
	authors text,
	cancer_name text,
	categ frozen<cat>,
	date_trial date,
	inm_name text,
	journal text,
	journalr_ref text,
	pmid text,
	population text,
	subcat frozen<scat>,
	title text,
	trial_design text,
	trial_doi text)
	WITH ID = 6df71c20-d2dc-11e9-b24e-2ffc83e0e036
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
