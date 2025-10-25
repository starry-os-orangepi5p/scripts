# archive old log
mkdir -p ${STARRY_LOG}/archive
mv ${STARRY_LOG}/last_console*.log ${STARRY_LOG}/archive

log_file=${STARRY_CON_LOG}/last_console$(date +%Y%m%d_%H%M%S).log
touch ${log_file}
minicom -C ${log_file}
git add ${log_file}
git commit -m "Update logs"
git push
