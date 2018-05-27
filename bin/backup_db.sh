do_help(){
	echo "Usage: "
	echo "        $0 --help | -h | help | <env> | restore <env backup file> <month> <day> <year to <env target> | list"
	echo ""
	echo "Where :"
	echo " --help, -h, help : display this help message"
	echo "            <env> : to specify the environment to be backed up."
	echo "          restore : perform a database restore using the given backup file to the enviroment specified."
	echo "<env backup file> : from where the database restore is going to be performed."
	echo "          <month> : backup month."
	echo "            <day> : backup day."
	echo "           <year> : backup year."
	echo "               to : mandatory word."
	echo "     <env target> : enviroment where the backed up will be restored."
	exit $1
}


do_backup() {
	# $1 : enviroment to be backed up
	
	# makes sure the bakcup dir exists
	BACKUP_DIR=$SOCCER/backup
	if [ ! -d $BACKUP_DIR ]; then
		echo "$BACKUP_DIR does not exists."
		exit 1
	fi

	# which database is going to be backup
	case "$1" in
		prod)
			DATABASE="soccer"
			;;
		test)
			DATABASE="soccer_dev"
			;;
		*)
			DATABASE=""
			;;
	esac

	# is an enviroment valid?
	if [ -z "$DATABASE" ]; then
		do_help 1
	fi

	# date of today as mmddyyyy
	DATE=`date +%m%d%Y`

	# file to be created by the backup
	BACKUP_FILE=soccer_$1_$DATE.sql

	# get current dir
	CUR_DIR=`pwd`

	# change to BACKUP_DIR
	cd $BACKUP_DIR

	# backup execution
	mysqldump -u soccer -p$USER_PASS $DATABASE --lock-tables=false --routines > $BACKUP_FILE

	# make sure the file has been created
	if [ ! -f $BACKUP_FILE ]; then
		echo "ERROR: backup $BACKUP_FILE file could not be create."
		exit 1
	fi

	# remove the .tar.gz file
	rm -f $BACKUP_FILE.tar.gz

	# compress the file
	tar cvfz $BACKUP_FILE.tar.gz $BACKUP_FILE

	# remove the sql file
	rm -f $BACKUP_FILE

	# return to working dir
	cd $CUR_DIR

	# done!
	echo "Backup $BACKUP_FILE.tar.gz created successfully."
	exit 0
}

do_restore() {
	# $1 : from enviroment
	# $2 : month
	# $3 : day
	# $4 : year
	# $5 : to enviroment

	# makes sure the bakcup dir exists
	BACKUP_DIR=$SOCCER/backup
	if [ ! -d $BACKUP_DIR ]; then
		echo "$BACKUP_DIR does not exists."
		exit 1
	fi

	# backup file to look for restore
	BACKUP_FILE=soccer_$1_$2$3$4.sql
	COMPRESS_FILE=$BACKUP_FILE.tar.gz

	# makes sure the file exists
	FILENAME=$BACKUP_DIR/$COMPRESS_FILE
	if [ ! -f $FILENAME ]; then
		echo "ERROR: compressed $FILENAME file not found."
		exit 1
	fi

	# which database is going to be restored
	case "$5" in
		prod)
			DATABASE="soccer"
			;;
		test)
			DATABASE="soccer_dev"
			;;
		*)
			DATABASE=""
			;;
	esac

	# is an enviroment valid?
	if [ -z "$DATABASE" ]; then
		echo "Error:  database enviroment error! ( $DATABASE )"
		do_help 1
	fi

	# get current dir
	CUR_DIR=`pwd`

	# change to BACKUP_DIR
	cd $BACKUP_DIR

	# uncompress the file
	tar xvf $COMPRESS_FILE

	# restore process execution
	mysql -u soccer -p$USER_PASS $DATABASE < $BACKUP_FILE

	# Remove the BACKUP_FILE
	rm -f $BACKUP_FILE

	# Return to the current dir
	cd $CUR_DIR

	# done !
	echo "Database restored completed!"
	exit 0
}

do_list(){
	# makes sure the bakcup dir exists
	BACKUP_DIR=$SOCCER/backup
	if [ ! -d $BACKUP_DIR ]; then
		echo "$BACKUP_DIR does not exists."
		exit 1
	fi
	ls -ltr $BACKUP_DIR
	exit 0
}


if [ -z "$SOCCER" ]; then
	echo "SOCCER environment variable is not set."
	exit 1
fi


if [ "$#" -ne 1 ] && [ "$#" -ne 2 ] && [ "$#" -ne 7 ]; then
	echo "Error: Wrong number of arguments."
	do_help 1
fi

USER_PASS='Kikakuka.01'

while true; do
	case "$1" in
		--help|-h|help)
			do_help 0
		;;
		test|prod)
			do_backup $1
		;;
		list)
			do_list
		;;
		restore)
			case $2 in
				test|prod)
					case "$3" in
						01|02|03|04|05|06|07|08|09|10|11|12)
							case "$4" in
								01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31)
									case "$5" in
										2010|2011|2012|2013|2014|2015|2016|2017|2018|2019|2020|2021|2022|2023)
											case "$6" in
												to)
													case "$7" in
														test|prod)
															do_restore $2 $3 $4 $5 $7
														;;
														*)
															echo "Error: Invalid value for enviroment paramater!"
															do_help 1
														;;
													esac
												;;
												*)
													echo "Error: Invalid keyword paramater!"
													do_help 1
											esac
										;;
										*)											
											echo "Error: Invalid value for year paramater!"
											do_help 1
										;;
									esac
								;;
								*)
									echo "Error: Invalid value for day paramater!"
									do_help	1
								;;
							esac
						;;
						*)
							echo "Error: Invalid value for month paramater!"
							do_help 1
						;;
					esac
				;;
				*)
					echo "Error: Invalid value for environment paramater!"
					do_help 1
				;;					
			esac
		;;
		*)
			echo "Error: invalid command!"
			do_help 1
		;;
	esac
done


