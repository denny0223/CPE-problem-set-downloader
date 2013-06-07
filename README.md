CPE (Collegiate Programming Examination) problem set downloader
==========================

## About CPE

[大學程式能力檢定](http://cpe.cse.nsysu.edu.tw/)

## Usage

find cid argument in CPE exams url 

input the value as first argument

ex: http://gpe.acm-icpc.tw/problemlisttab.php?onlinetest=1&cid=4831&public

The cid value is 4831

Execution as:

```
  ./CPEdownloader.sh 4831
```

### Use second argument to rename folder

```
./CPEdownloader.sh 4831 2013\ Mar\ 26
```

Folder name will be "2013 Mar 26"
