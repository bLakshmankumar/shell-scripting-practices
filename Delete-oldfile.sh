# Write a script to delete files older than 7 days :
find /path/log/ -type f -mtime +7 -exec rm -f {} \;
