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

#4)  How do you pass arguments to a shell script?
Answer: Use $1, $2, ..., $n for positional arguments. $@ for all.
# Script:
# #!/bin/bash
echo "First arg: $1"
echo "Second arg: $2"
# Run the script :
./script.sh hello world
# Output :
First arg: hello
Second arg: world

#5) System resource monitoring script for cpu, memory, disk.
# #!/bin/bash
# The script is a system resource monitoring script.
# It checks:
#   CPU usage
#   Available memory
#   Disk usage
# It then compares these values against preset thresholds and prints a warning or OK message based on the results.
echo `date`
#cpu use threshold
cpu_threshold='80'
#mem idle threshold
mem_threshold='100'
#disk use threshold
disk_threshold='90'
#---cpu
cpu_usage () {
cpu_idle=`top -b -n 1 | grep Cpu | awk '{print $8}'|cut -f 1 -d "."`
# top -b -n 1: Run top once in batch mode.
   # top Shows system performance in real time (like Task Manager in Windows).
   # By default, it runs in interactive mode (you can press keys to sort, kill, etc).
# -b = Batch mode
       # Makes top non-interactive.
       # Outputs the data as plain text — good for use in scripts or to pipe into other commands like grep or awk.
# -n 1 = Number of iterations
       # Tells top to run only once, then exit. If you do -n 5, it will run 5 times and update the output each time.
# grep Cpu: Look for the line with CPU info.
# awk '{print $8}': Get the 8th column → idle CPU percentage.
# cut -f 1 -d ".": Remove decimal → get whole number of idle %
cpu_use=`expr 100 - $cpu_idle`
# expr 100 - $cpu_idle: This does basic arithmetic, subtracting that idle percentage from 100 to get how much the CPU is being used.
 echo "cpu utilization: $cpu_use"
if [ $cpu_use -gt $cpu_threshold ]
    then
        echo "cpu warning!!!"
    else
        echo "cpu ok!!!"
fi
}
#---mem
mem_usage () {
 #MB units
mem_free=`free -m | grep "Mem" | awk '{print $5+$7}'`
# free -m: Show memory in MB
# grep "Mem": Pick total memory row
# $5 + $7: Add used + cached/freeable memory
# $5 is used memory
# $7 is freeable/cache memory
echo "memory space remaining : $mem_free MB"
if [ $mem_free -lt $mem_threshold  ]
    then
        echo "mem warning!!!"
    else
        echo "mem ok!!!"
fi
}
#---disk
disk_usage () {
disk_use=`df -P | grep /dev | grep -v -E '(tmp|boot)' | awk '{print $6}' | cut -f 1 -d "%"`
# df -P: Show disk usage in POSIX format
# grep /dev: Get only real disk partitions
# grep -v -E '(tmp|boot)': Exclude temporary and boot partitions
# awk '{print $6}': Get percentage used column
# cut -f 1 -d "%" : Remove % symbol to get the number only
 echo "disk usage : $disk_use" 
if [ $disk_use -gt $disk_threshold ]
    then
        echo "disk warning!!!"
    else
        echo "disk ok!!!"
fi
}
# Function Calls at the End:
cpu_usage
mem_usage
disk_usage



