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

#6) Check if a service is running, restart if not :
# #!/bin/bash
service="nginx"
if ! pgrep -x "$service" > /dev/null
then
  echo "$service not running, restarting..."
  systemctl restart $service
else
  echo "$service is running."
fi

#7) Restart a Service if It's Not Running
# #!/bin/bash
# logic : Uses pgrep to check if service is running. Restarts if not
SERVICE=nginx
if ! pgrep $SERVICE > /dev/null; then
  echo "$SERVICE is down, restarting..."
  systemctl restart $SERVICE
fi

#8) Backup Files Daily to a Timestamped Directory :
#  Logic: Copies files with timestamped backup folder
#!/bin/bash
src_dir="/var/www/html"
backup_dir="/backups/html_$(date +%F_%H-%M-%S)"
mkdir -p $backup_dir
cp -r $src_dir/* $backup_dir/
echo "Backup completed to $backup_dir"

#9) Verify Application Health via HTTP :
# Logic : Performs health check and alerts if non-200 response.
#!/bin/bash
url="http://localhost:8080/health"
status=$(curl -s -o /dev/null -w "%{http_code}" $url)
if [ $status -ne 200 ]; then
  echo "App is unhealthy! Status: $status"
else
  echo "App is healthy."
fi

#10) Extract Error Lines from Log File :
# Logic : Greps latest 10 errors from logs.
#!/bin/bash
grep -i "error" /var/log/app.log | tail -n 10

#11) Loop Through Kubernetes Namespaces and Get Pod Counts :
#  Helps in cluster pod distribution visibility.
#!/bin/bash
for ns in $(kubectl get ns --no-headers | awk '{print $1}'); do
  count=$(kubectl get pods -n $ns --no-headers | wc -l)
  echo "$ns => $count pods"
done

#13) Print IP Address of the Machine :
hostname -I | awk '{print $1}'

#14) Update All Packages & Notify via Email
# Scheduled via cron, ensures system stays patched.
#!/bin/bash
apt update && apt upgrade -y
echo "Packages updated on $(hostname)" | mail -s "Update Report" user@example.com

#15) Cron Job to Monitor Failed SSH Logins :
# Helps detect brute force attacks.
#!/bin/bash
grep "Failed password" /var/log/auth.log | tail -n 5

#16) Upload Backup to S3 :
# Automates data safety to cloud.
#!/bin/bash
file="/tmp/db-backup.sql"
bucket="s3://my-backup-bucket"
aws s3 cp $file $bucket

#17) Upload Backup to S3 (Different Region + Different AWS Account) :
#!/bin/bash

# === CONFIGURATION ===
file="/tmp/db-backup.sql"                    # Path to your backup file
bucket_name="target-account-backup-bucket"   # Destination S3 bucket (in another AWS account)
region="us-west-2"                           # Destination region
aws_profile="target-account-profile"         # Named AWS CLI profile (configured for the target account)

# === Upload to S3 ===
echo "Starting upload of $file to s3://$bucket_name/ in region $region..."

# Upload using specified profile and region
aws s3 cp "$file" "s3://$bucket_name/" \
    --region "$region" \
    --profile "$aws_profile"

# === Check Result ===
if [ $? -eq 0 ]; then
    echo "✅ File uploaded successfully to s3://$bucket_name/$(basename $file)"
else
    echo "❌ Upload failed. Please check your AWS credentials, region, or bucket permissions."
    exit 1
fi

#18) Compress and Archive Old Log Files :
# Compresses logs older than 7 days to save space.
#!/bin/bash
find /var/log/myapp -type f -name "*.log" -mtime +7 -exec gzip {} \;






