[Exercise 1](exercise01.md).

```bash
#! /bin/bash

if [[ -d $1 ]]; then
        dir=$1
else
        dir=.
fi

while getopts ":hrty" opt; do
        case $opt in
        h | help)
                echo "There is info of use:"
                echo "-r or --recursive for recursive deleting files and empty directories"
                echo "-t or --test for search files would be deleted"
                echo "-y or --yes for ignoring questions (y/n) or errors"
                ;;
        r | recursive)
                rm -r ${dir}/*.tmp
                rm -r ${dir}/'-'*
                rm -r ${dir}/_*
                rm -r ${dir}/~*
                rm -d ${dir}/*
                ;;
        t | test)
                find ${dir} -name "*.tmp" -maxdepth 1
                find ${dir} -name "-*" -maxdepth 1
                find ${dir} -name "_*" -maxdepth 1
                find ${dir} -name "~*" -maxdepth 1
                ;;
        y | yes)
                rm -f ${dir}/*.tmp     # yes | rm ...
                rm -f ${dir}/'-'*
                rm -f ${dir}/_*
                rm -f ${dir}/~*
                ;;
        *)
                rm ${dir}/*.tmp
                rm ${dir}/'-'*
                rm ${dir}/_*
                rm ${dir}/~*
                ;;
        esac
done
```

