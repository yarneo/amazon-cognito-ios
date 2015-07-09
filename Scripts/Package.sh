#!/bin/sh
set -e
# Helper function to exit on nonzero code
function exitOnFailureCode() {
    if [ $1 -ne 0 ] 
    then
    	echo "Error occurred, abort"
    	git checkout .
        exit $1
    fi
}
# remove everything generated by this script
function cleanup
{
rm -rf builtFramework
}


CURR_DIR=$(PWD)

# clean
if [ -n $1 ] && [ "$1" == "clean" ];
then
cleanup
echo "Cleaning Completed"
exit 0
fi

set -u
# clean at first
cleanup


#==================== build AWSiOSSDKCognitoSync framework ====================#
Scripts/SdkPackage.sh AWSCognito


