#!/bin/bash
area51=/Mysql_backup/
#====== Script to backup Racktables database ==========
echo "===== Racktables database backup started ===="
cd /var/lib/mysql
echo "Current Dir:- $PWD"
x=`date | awk '{print $2$3"-"$6}'`
f=`date | awk '{print $2}'`
if [ -d "/Mysql_backup/$f/" ]; then
	echo "Destination folder $area51 exists..."
	echo "Dumping MySQL DB racktables to $area51"
	mysqldump -uroot -psupp0rt racktables2 > /Mysql_backup/racktables$x.sql
	y=`echo $?`
	echo "Exit status is $y..sql dumped to $area51"
	echo "MySQL dump file:- racktables$x.sql"
else
	echo "Destination folder /Mysql_backup does not exist. Creating..."
	sleep 1;
	mkdir /Mysql_backup/$f
	echo "/Mysql_backup Created..." 
	mysqldump -uroot -psupp0rt racktables2 > /Mysql_backup/racktables$x.sql
	y=`echo $?`
	echo "Exit status is $y..sql dumped to $area51"
fi
cd /Mysql_backup/$f
echo "Archiving /Mysql_backup/racktables$x.sql into /Mysql_backup/$f/ "
tar zcfP  racktables$x.sql.tar /Mysql_backup/racktables$x.sql
y=`echo $?`
echo "Exit status is $y...Archive complete..."
echo "Current Dir:- $PWD"
echo "Archived file:- racktables$x.sql.tar"
echo "Removing backup file /Mysql_backup/racktables$x.sql to free space since its already archived"
rm -rf /Mysql_backup/racktables$x.sql
sleep 1;
echo "Backup file removed"
echo "Uploading archive to S3..."
sleep 1;
#mv racktables$x.sql.tar /Mysql_backup/
/usr/bin/trickle -s -u 1500 s3cmd sync *$x.sql.tar s3://networkedinsights.com/racktablesdb/$f/
y=`echo $?`
echo "Exit status is $y...upload to s3 complete"
if [ $y == 0 ]; then
echo "Removing archive racktables$x.sql.tar since its already backup up on S3" 
sleep 1;
rm -rf racktables$x.sql.tar
echo "Archived removed"
else
echo "upload failed"
fi
