#1) Write a script to delete files older than 7 days :
find /path/log/ -type f -mtime +7 -exec rm -f {} \;
# Explanation :
# -mtime +7: modified more than 7 days ago
# -exec rm -f {}: deletes each matched file

#2) Write a script to find the largest file in a directory :
find . -type f -exec du -h {} + | sort -hr | head -1
# du -h: human-readable sizes
# sort -hr: sort by size
# head -1: show largest

#3) How do you check if a file exists?
if [-f /myfile/file] ; then
  echo "file exists"
else 
  echo "file not found"
fi
