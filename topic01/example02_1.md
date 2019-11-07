[Exercise 2](exercise02.md).

```bash
#! /bin/bash

if [[ -d $1 ]]; then
        dir=$1
else
        dir=.
fi

find $dir -type f -mtime 30 -exec mv {} ~{} \;

exit $RETURN_SUCCESS
```

