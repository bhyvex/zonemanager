#!/bin/sh
# This script allows sharing /etc/local/.dns between many users through Git repository.

if [ -d /etc/local/.dns/.git ]; then
	DIR="`pwd`"
	cd /etc/local/.dns
	if grep -q git@ /etc/local/.dns/.git/config && [ -f /etc/local/.ssh/id_github_zonemaster ]; then
		GIT_SSH=/opt/farm/scripts/git/helper.sh GIT_KEY=/etc/local/.ssh/id_github_zonemaster \
		git pull |grep -v "Already up-to-date"
	else
		git pull |grep -v "Already up-to-date"
	fi
	cd "$DIR"
fi
