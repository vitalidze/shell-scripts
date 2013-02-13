#!/bin/sh


#
# sample usage
# 
# ./refactor.sh my/folder/*.java

for f in $*
do
        if [ ! -d $f ]
        then
                f_changed="${f}_new"

                #
                # 1) replace copyright
                # 2) remove all lines containing '@version' and 'REPORT_TITLE'
                #
                cat $f | sed 's/\(.*\)\(Copyright:\)\(.*\)/\1\2 Copyright \(c\) 2001-2013 MYCOMPANY, LLC<\/p>/' | sed '/\(.*\)\(\@version\|String REPORT_TITLE = \)\(.*\)/d' > $f_changed

                #
                # check sizes and replace old file if necessary
                #
                old_size=`( stat -c %s ${f} )`
                new_size=`( stat -c %s ${f_changed} )`

                if [ $old_size -ne $new_size ]
                then
                        echo "$f changed"
                        mv $f_changed $f
                else
                        rm $f_changed
                fi
        fi
done
