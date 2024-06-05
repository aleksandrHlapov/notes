find /path/to/files/ -name "unwantedFileNamePattern*" -delete
find /path/to/files/ -type f -delete
rsync -a --delete empty_dir/ yourdirectory/
