shell-scripts
=============

This is my collection of shell scripts I've used for some purpose. I put them here to re-use them later. Maybe someone finds them useful too.

* check_row_counts.sh	- executes `SELECT COUNT(*) FROM tbl` on every table within two MySQL databases and prints differences.

* convert_to_fax - converts batch of images to the format, which can be then sent by fax. Uses `iconv` from [imagemagick](http://www.imagemagick.org/)

* monitor_progress.sh - checks the size of a file every X seconds. Compares size with specified target size. Then draws progress bar. Based on `du` tool. I've used it to monitor status of `cp` and `scp` operations.

* refactor.sh - updates batch of java files, removes old copyright, unnecessary constants. Based on `sed`.
