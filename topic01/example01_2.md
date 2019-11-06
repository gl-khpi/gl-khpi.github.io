[Exercise 1](exercise01.md).

```bash
#!/bin/bash

rmf="-i"
ish=0
isr=""
ddir="."

for arg in $@
do
	case $arg in
	-h|--help) ish="y";;
	-r|--recursive) isr="r";;
	-y|--yes) rmf="-f";;
	*)ddir="$arg" ;;
	esac
done

if [ "$ish" = "y" ];
then
	echo "Pass a directory to the script."
	exit 0
fi

if [ "$isr" = "r" ];
then
	find $ddir/ -name "[-_~]*.tmp" -exec rm $rmf {} \;
else
	find $ddir/ -maxdepth 1 -name "[-_~]*.tmp" -exec rm $rmf {} \;
fi

exit 0
```

