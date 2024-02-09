source_dir=$1
destination_dir=$2
time_between_check=$3
max_number=$4

echo $max_number


while :
do
# create file and write in it state of source 
ls -lR $source_dir > current-status.txt 


diff last-status.txt current-status.txt
if [ $? -eq 0 ]; then
echo "no change"
else
echo "change"


number_of_backups=`expr $(find $destination_dir -maxdepth 1 -type d | wc -l) - 1`
echo $number_of_backups

# -t: sort them by modidfication date, newest first, -r: reverse the sorting (oldest file first)
# head -1: output first one from starting
oldest_backup=$(ls -tr $destination_dir | head -1)
echo $oldest_backup


if [ "$number_of_backups" = "$max_number" ]; then
echo "deleting oldest backup"
rm -r "$destination_dir/$oldest_backup"
fi

# make backup file
current_time=$(date +'%Y-%m-%d-%H-%M-%S')
mkdir $destination_dir/$current_time
cp -r $source_dir $destination_dir/$current_time

fi

# update last status with current status
cat current-status.txt > last-status.txt
sleep $time_between_check 
done 

