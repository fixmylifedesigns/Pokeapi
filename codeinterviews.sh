#!/bin/sh
# config options
date_start="1 may 2020"
# make and go to a dates dir for creating commits
git init
# storing the date counter
date_curr=$(date -d "$date_start" +"%s")
date_now=$(date +"%s")
# increment the current date variable by a day
increment_date() {
    date_curr=$((date_curr + 86400))
}
# get the games begin!
while [ $date_curr -lt "$date_now" ] ; do
    # create a file named with the date of commit in seconds from epoch
    touch "$date_curr"
    # add and commit it with the date
    git add "$date_curr"
    git commit -m "Autocommit: $date_curr" --date="$date_curr"
    # increment the date
    increment_date
done