-- Exercita a conversão e a verificação de reexecução com uma tabela sintética.
SELECT create_hypertable('public.history', 'clock', chunk_time_interval => 86400, if_not_exists => TRUE);
