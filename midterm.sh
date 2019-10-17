#!/bin/bash


function listing(){
ls *txt

}


function find_metadata() {
touch metadata.txt
curl -w "\n" http://169.254.169.254/latest/meta-data/ami-id>>metadata.txt
curl -w "\n" http://169.254.169.254/latest/meta-data/instance-id>>metadata.txt
curl -w "\n" http://169.254.169.254/latest/meta-data/hostname>>metadata.txt
curl -w "\n" http://169.254.169.254/latest/meta-data/security-groups>>metadata.txt
curl -w "\n" http://169.254.169.254/latest/meta-data/public-hostname>>metadata.txt
}


function version_number() {
echo "2.0"
}


function no_arg() {
sudo yum update -y
}


function wrong() {
echo "script name: midterm; valid arguments '-l, --list, -m, --metadata, -v, --version, or no argument'"

}

case $1 in
	-l|--list)
		listing
		;;
	-m|--metadata)
		find_metadata
		;;
	-v|--version)
                version_number
                ;;
	'')
		no_arg
		;;

	*)
		wrong
		;;
esac
