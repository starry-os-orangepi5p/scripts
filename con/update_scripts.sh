set -e

ssh ${STARRY_SSH_HOST} -t "cd ${STARRY_SCRIPT} && git pull"
