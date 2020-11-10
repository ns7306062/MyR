setwd("D:/20201110/ubike")
#install.packages('jsonlite')
library(jsonlite)
download.file("https://quality.data.gov.tw/dq_download_json.php?nid=123026&md5_url=4d8de527a0bcd8a7b1aeae91120f021d","ubikeNTP.json")
jdata <- fromJSON("ubikeNTP.json")
table(jdata$sarea)



# 新北市 youbike 即時資訊僅提供 csv
# install.packages('data.table')
library(data.table)
ubike.csv <- 'youbike.csv'
url <- 'https://data.ntpc.gov.tw/api/datasets/71CD1490-A2DF-4198-BEF1-318479775E8A/csv/file'
download.file(url,ubike.csv)
# sno(站點代號)、sna(中文場站名稱)、tot(場站總停車格)、sbi(可借車位數)、sarea(中文場站區域)、mday(資料更新時間)、lat(緯度)、lng(經度)、ar(中文地址)、sareaen(英文場站區域)、snaen(英文場站名稱)、aren(英文地址)、bemp(可還空位數)、act(場站是否暫停營運)
# 改用 fread 解決 windows utf-8 中文問題
ubike <- fread(ubike.csv,header=T,encoding = 'UTF-8',stringsAsFactors=F)
