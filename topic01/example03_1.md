[Exercise 3](exercise03.md).

```bash
#! /bin/bash

if [[ -d $1 ]]
then
        dir=$1 # directory for rename
else
        exit 1
fi

if ! [[ -z $2 ]]
then
        path=$2 # path to task1 and task2
else
        exit 2
fi

# Also we can use $(which task1) and second if we add scripts
# to $PATH or to existing directories binaries

temp=$(${path}/task2 $dir | grep "~*")

if ! [[ -z temp ]]
then
        ${path}/task1 $dir
fi

exit $RETURN_SUCCESS
```

