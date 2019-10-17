#!/bin/bash



function find_metadata() {
touch metadata.txt
curl -w "\n" http://169.254.169.254/latest/meta-data/ami-id
curl -w "\n" http://169.254.169.254/latest/meta-data/instance-id
curl -w "\n" http://169.254.169.254/latest/meta-data/hostname
curl -w "\n" http://169.254.169.254/latest/meta-data/security-groups
curl -w "\n" http://169.254.169.254/latest/meta-data/public-hostname
}


function version_number() {
echo "1.0"
}


function no_arg() {
sudo yum update -y
}


function wrong() {
echo "script name: midterm; valid arguments '-m, --metadata, -v, --version, or no argument'"

}
case $1 in
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
