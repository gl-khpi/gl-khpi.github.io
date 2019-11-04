#! /bin/bash

dir=$1

find $dir -type f -mtime 30 -exec mv {} ~{} \;

exit $RETURN_SUCCESS

