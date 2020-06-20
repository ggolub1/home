#!c:/cygwin/bin/bash.exe
func ()
{
typeset INP
INP=$1
echo $INP
while read LINE
do
	if [ $LINE != $INP ];then
		echo " $LINE  not equal $INP ";
	fi
#	echo $LINE
done < ./in2
}

#MAIN

while read k
do
	echo "=== $k ===="
	func $k
#done < in1
done <  ./in3.txt #./analyze_scripts1.sh.vie.lst.txt
#done < ./in1
