#!/bin/bash

DB_OLD='_old_db'
DB_NEW='_new_db'

MY_LOGIN=root
MY_PASS=root

for tbl in `mysql -u$MY_LOGIN -p$MY_PASS -e "SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_SCHEMA='$DB_OLD'"`
do
        RC_OLD=`mysql --skip-column-names -u$MY_LOGIN -p$MY_PASS -e "SELECT COUNT(*) FROM $DB_OLD.$tbl" | grep '[0-9]*'`
        RC_NEW=`mysql --skip-column-names -u$MY_LOGIN -p$MY_PASS -e "SELECT COUNT(*) FROM $DB_NEW.$tbl" | grep '[0-9]*'`
        if [ ! $RC_OLD == $RC_NEW ]; then
                echo "$tbl $RC_OLD $RC_NEW"
        fi
done
