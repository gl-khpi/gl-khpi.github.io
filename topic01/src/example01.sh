#! /bin/bash

if [[ -d $1 ]]; then
        #echo "No dir"
        #exit 1
        dir=$1
else
        dir=.
fi

#rm ${dir}/*.tmp
#rm ${dir}/'-'*
#rm ${dir}/_*
#rm ${dir}/~*

while getopts ":hrty" opt; do
        case $opt in
        h | help)
                echo "info of use"
                exit 0
                ;;
        r | recursive)
                rm -r ${dir}/*.tmp
                rm -r ${dir}/'-'*
                rm -r ${dir}/_*
                rm -r ${dir}/~*
                rmdir -r ${dir}/*
                exit 0
                ;;
        t | test)
                cd ${dir}
                find -name "*.tmp"
                find -name "-*"
                find -name "_*"
                find -name "~*"
                cd -
                exit 0
                ;;
        y | yes)
               
                yes | rm ${dir}/*.tmp
                yes | rm ${dir}/'-'*
                yes | rm ${dir}/_*
                yes | rm ${dir}/~*
                exit 0
                ;;
        esac
done

exit $RETURN_SUCCESS

