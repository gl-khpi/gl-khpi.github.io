[Exercise 2](exercise02.md).

```bash
#! /bin/bash

dir=$1

find $dir -type f -mtime 30 -exec mv {} ~{} \;

exit $RETURN_SUCCESS
```

