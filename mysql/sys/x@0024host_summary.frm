TYPE=VIEW
query=select if(`performance_schema`.`accounts`.`HOST` is null,\'background\',`performance_schema`.`accounts`.`HOST`) AS `host`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,sum(`stmt`.`total_latency`) / sum(`stmt`.`total`) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`USER`) AS `unique_users`,sum(`mem`.`current_allocated`) AS `current_memory`,sum(`mem`.`total_allocated`) AS `total_memory_allocated` from (((`performance_schema`.`accounts` join `sys`.`x$host_summary_by_statement_latency` `stmt` on(`performance_schema`.`accounts`.`HOST` = `stmt`.`host`)) join `sys`.`x$host_summary_by_file_io` `io` on(`performance_schema`.`accounts`.`HOST` = `io`.`host`)) join `sys`.`x$memory_by_host_by_current_bytes` `mem` on(`performance_schema`.`accounts`.`HOST` = `mem`.`host`)) group by if(`performance_schema`.`accounts`.`HOST` is null,\'background\',`performance_schema`.`accounts`.`HOST`)
md5=67e4bc9e1f0f2c08e58833e2d5538896
updatable=0
algorithm=2
definer_user=mariadb.sys
definer_host=localhost
suid=0
with_check_option=0
timestamp=0001713776621057209
create-version=2
source=SELECT IF(accounts.host IS NULL, \'background\', accounts.host) AS host,\n       SUM(stmt.total) AS statements,\n       SUM(stmt.total_latency) AS statement_latency,\n       SUM(stmt.total_latency) / SUM(stmt.total) AS statement_avg_latency,\n       SUM(stmt.full_scans) AS table_scans,\n       SUM(io.ios) AS file_ios,\n       SUM(io.io_latency) AS file_io_latency,\n       SUM(accounts.current_connections) AS current_connections,\n       SUM(accounts.total_connections) AS total_connections,\n       COUNT(DISTINCT accounts.user) AS unique_users,\n       SUM(mem.current_allocated) AS current_memory,\n       SUM(mem.total_allocated) AS total_memory_allocated\n  FROM performance_schema.accounts\n  JOIN sys.x$host_summary_by_statement_latency AS stmt ON accounts.host = stmt.host\n  JOIN sys.x$host_summary_by_file_io AS io ON accounts.host = io.host\n  JOIN sys.x$memory_by_host_by_current_bytes mem ON accounts.host = mem.host\n GROUP BY IF(accounts.host IS NULL, \'background\', accounts.host);
client_cs_name=utf8mb3
connection_cl_name=utf8mb3_general_ci
view_body_utf8=select if(`performance_schema`.`accounts`.`HOST` is null,\'background\',`performance_schema`.`accounts`.`HOST`) AS `host`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,sum(`stmt`.`total_latency`) / sum(`stmt`.`total`) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`USER`) AS `unique_users`,sum(`mem`.`current_allocated`) AS `current_memory`,sum(`mem`.`total_allocated`) AS `total_memory_allocated` from (((`performance_schema`.`accounts` join `sys`.`x$host_summary_by_statement_latency` `stmt` on(`performance_schema`.`accounts`.`HOST` = `stmt`.`host`)) join `sys`.`x$host_summary_by_file_io` `io` on(`performance_schema`.`accounts`.`HOST` = `io`.`host`)) join `sys`.`x$memory_by_host_by_current_bytes` `mem` on(`performance_schema`.`accounts`.`HOST` = `mem`.`host`)) group by if(`performance_schema`.`accounts`.`HOST` is null,\'background\',`performance_schema`.`accounts`.`HOST`)
mariadb-version=100617
