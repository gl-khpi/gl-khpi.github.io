[Exercise 2](exercise02.md).

```bash
#!/bin/bash

dir=.
modified=0

for arg in $@
do
	case $arg in
	-s|--superficial) rec="-maxdepth 1";;
	*) if [ -d "$arg" ];
	then
		dir=$arg	
	fi
	;;
	esac
done

for file in $(find $dir/ $rec -name "*" -mtime +30)
do
	file_m=$(date -r "$file" "+%m" | bc)
	file_p=$(dirname "$file")
	file_b=$(basename "$file")
	if [ -f "$file" ];
	then
		case $file_m in
		4|6|9|11)
		modified=$[$modified + 1]
		mv "$file" $file_p/~$file_b;;
		esac
	fi
done

for file in $(find $dir/ $rec -name "*" -mtime +31)
do
	file_m=$(date -r "$file" "+%m" | bc)
	file_p=$(dirname "$file")
	file_b=$(basename "$file")
	if [ -f "$file" ];
	then
		case $file_m in
		1|3|5|7|8|10|12) 
			modified=$[$modified + 1]
			mv "$file" $file_p/~$file_b;;
		esac
	fi
done

for file in $(find $dir/ $rec -name "*" -mtime +28)
do
	file_m=$(date -r "$file" "+%m" | bc)
	file_p=$(dirname "$file")
	file_b=$(basename "$file")
	if [ -f "$file" ];
	then
		case $file_m in
		2)
			modified=$[$modified + 1]
			mv "$file" $file_p/~$file_b;;
		esac
	fi
done

exit $modified
```

