#!/bin/bash
# 2013/03/27	Denny

[ "$#" -lt 1 ] &&\
	echo "
CPE (Collegiate Programming Examination) problem set downloader

find cid argument in CPE exams url 
input the value as first argument

ex: http://gpe.acm-icpc.tw/problemlisttab.php?onlinetest=1&cid=4831&public
The cid value is 4831
Execution as:
  ./CPEdownloader.sh 4831

Use second argument to rename folder
ex: 
  ./CPEdownloader.sh 4831 2013\ Mar\ 26
Folder name will be \"2013 Mar 26\"
		"\
	&& exit 0
url='http://gpe2.acm-icpc.tw/'

for path in `curl -s "http://gpe.acm-icpc.tw/problemlist.php?tab&onlinetest&cid=$1&public" |
	grep -o 'showproblemtab[^">]*' |\
	sed 's/amp;//g' |\
	sed 's/tab//'`
do
	str=$path'&nomenu&public'
	echo $str
	wget \
		--content-disposition \
		--convert-links \
		--page-requisites \
		-r -l 1 $url$path'&nomenu&public'

	cd gpe2.acm-icpc.tw
	name=`cat $str | sed '/title/!d' | sed 's/<[^>]*>//g'`
	mv $str "$name.html"
	cd ..
done

[ "$2" ] && mv gpe2.acm-icpc.tw "$2"
