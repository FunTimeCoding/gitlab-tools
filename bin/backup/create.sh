#!/bin/sh -e

# BACKUP overrides timestamp in filename
sudo gitlab-backup create BACKUP=dump GZIP_RSYNCABLE=yes SKIP=uploads,builds,artifacts,lfs,registry,pages
mkdir -p tmp
sudo cp /var/opt/gitlab/backups/dump_gitlab_backup.tar tmp/dump_gitlab_backup.tar
sudo cp /etc/gitlab/gitlab-secrets.json tmp/gitlab-secrets.json
GROUP=$(id -g -n "${USER}")
sudo chmod 600 tmp/dump_gitlab_backup.tar
sudo chown "${USER}:${GROUP}" tmp/dump_gitlab_backup.tar tmp/gitlab-secrets.json
