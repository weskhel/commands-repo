#!/bin/bash
export log_file="/var/log/docker_cleaner.log"

# Docker prune commands
for i in system container volume image; do
  echo "$(date '+%b %d %T') - Prunnig ${i}" >> ${log_file}
  docker ${i} prune -f >> ${log_file}
done

# Getting old images
echo "" > /tmp/docker_images.txt
docker images --format "{{.Repository}}:{{.Tag}} {{.CreatedSince}}"| grep -v codeclimate | grep -v days |cut -d" " -f1 > /tmp/docker_images.txt
export images_file=$(cat /tmp/docker_images.txt)

# Delete old docker images
if [ -s /tmp/docker_images.txt ]; then
  while IFS= read -r line
    do
      echo "$(date '+%b %d %T') - Removing  ${line}" >> ${log_file};
      docker rmi "${line}" >> ${log_file}
    done <<< "${images_file}"
else
  echo "$(date '+%b %d %T') - No images to prune, exiting..." >> ${log_file}
  exit 0
fi