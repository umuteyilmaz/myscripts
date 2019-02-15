#mp3 flac
#png jpg
#avi mov

#remove .log


mkdir "music"
mkdir "images"
mkdir "videos"

dir=$(pwd)

imagesFolder=$dir/"images"/;
videosFolder=$dir/"videos"/;
musicFolder=$dir/"music"/;

echo $imagesFolder

for file in "$dir"/*
do
	if [ -d $file ]
	then
          echo $file
	else
		if [ ${file: -4} == ".mp3" ]
		then
			mv $file $musicFolder
		fi

		if [ ${file: -4} == ".flac" ]
		then
			mv $file $musicFolder
		fi

		if [ ${file: -4} == ".jpg" ]
		then
			mv $file $imagesFolder
		fi
	
		if [ ${file: -4} == ".png" ]
		then
			mv $file $imagesFolder
		fi

		if [ ${file: -4} == ".avi" ]
		then
			mv $file $videosFolder
		fi

		if [ ${file: -4} == ".mov" ]
		then
			mv $file $videosFolder
		fi

		if [ ${file: -4} == ".log" ]
		then
			rm -r $file
		fi
	fi
done


for file in "$dir"/*
do
	if [ -d $file ]
	then
          echo $file
	else
		if [ ${file: -4} == ".log" ]
		then
			echo ${file%.*}
			#mv $file $musicFolder
		fi
	fi
done


#{
#    "11.10.2017_y": "",
#    "bike.png": "",
#    "car.jpg": "",
#    "comedy.mov": "",
#    "error.log": "",
#    "horror.avi": "",
#    "info.txt": "",
#    "interview.mp3": "",
#    "song.flac": "",
#    "tree-small.jpeg": ""
#}