#!/bin/bash

numOfAccessFiles=0
numOfErrorFiles=0
maxCount=28

dir=$(pwd)

for file in "$dir"/*
do
	if [ -d $file ]
	then
		:
	else
		if [[ "$file" == *"access"* ]]
		then
			#echo $file
			numOfAccessFiles=$[$numOfAccessFiles+1]
		
		elif [[ "$file" == *"error"* ]]
		then
			#echo $file
			numOfErrorFiles=$[$numOfErrorFiles+1]
		fi
	fi
done

#echo $numOfAccessFiles
#echo $numOfErrorFiles

if (( "$numOfAccessFiles" < "$maxCount" ))   #Controlling max Access log file value of 28
then
	for((i=numOfAccessFiles; i>=1; i--))do
	
		let oldIndex=$[i-1]

		if (($oldIndex==0))
		then	
			mv "access.log" "access.log."$i
		else
			mv "access.log."$oldIndex "access.log."$i
		fi
	done

	touch "access.log"
	echo "Access log operations done!"

else
	echo "Not permitted this operations!"
fi

if (( "$numOfErrorFiles" < "$maxCount" ))  #Controlling max Error log file value of 28
then
	for((i=numOfErrorFiles; i>=1; i--))do
	
		let oldIndex=$[i-1]

		if (($oldIndex==0))
		then	
			mv "error.log" "error.log."$i
		else
			mv "error.log."$oldIndex "error.log."$i
		fi
	done

	touch "error.log"
	echo "Error log operations done!"

else
	echo "Not permitted this operations!"
fi

