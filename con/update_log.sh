set -e

ssh ${STARRY_SSH_HOST} -t "cd ${STARRY_LOG} && git pull"
