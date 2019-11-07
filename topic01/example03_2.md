[Exercise 3](exercise03.md).

```bash
#!/bin/bash

sc1_arg=""
sc2_arg=""
dir=.

for arg in $@
do
	case $arg in
	-s|--superficial)
	sc2_arg="$sc2_arg -r"
	;;
	-h|--help)
	sc1_arg="$sc1_arg -h"
	;;
	-r|--recursive)
	sc1_arg="$sc1_arg -r"
	;;
	-y|--yes)
	sc1_arg="$sc1_arg -h"
	;;
	*)
	if [ -d "$arg" ];
	then
		sc1_arg="$sc1_arg $arg"
		sc2_arg="$sc2_arg $arg"
	fi
	esac
done

./gl_script2_v2.sh $sc2_arg 

if [ $? -ne 0 ];
then
	./gl_script1.sh $sc1_arg;
else
	echo "Nothing to be done."
fi
```

