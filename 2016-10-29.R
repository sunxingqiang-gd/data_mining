url='http://shenzhen.lashou.com/cate/meishi'
web=readLines(url,encoding = 'UTF-8')

#抓取除了第一页的全部美食页
for (i in 2:49){
  web1 <- NULL
  url <- paste(url,"/page",i,sep="")
  web1=readLines(url,encoding = 'UTF-8')
  web <- c(web,web1)
}

place1 <- web[grep("goods-place",web)]
#+2是因为匹配到的">往后+2个坐标，字符总长度减去 < 1个字符
place2 <- substr(place1,regexpr("\">",place1)+2,regexpr("</",place1)-1)

#goods_name
goods_name1 <- web[grep("goods-name",web)]
# +2 是因为 匹配到 "> 现金抵用1次，免费WiFi</a>"
goods_name2 <- substr(goods_name1,regexpr("\">",goods_name1)+2,nchar(goods_name1)-4)


#goods_text
goods_text1 <- web[grep("goods-text",web)]
# +2 是因为 匹配到 "> 现金抵用1次，免费WiFi</a>"
goods_text2 <- substr(goods_text1,regexpr("\">",goods_text1)+2,nchar(goods_text1)-4)

#price
price1 <- web[grep("class=\"price\"",web)]
price2 <- substr(price1,regexpr("</em>",price1)+5,nchar(price1)-7)

#org_price
org_price1 <- web[grep("class=\"money\"",web)]
org_price2 <- substr(org_price1,regexpr("<del>",org_price1)+5,nchar(org_price1)-13)

result <- data.frame(place=place2,goods_name=goods_name2,goods_text=goods_text2,price=price2,org_price=org_price2)

head(result)
goods_name <- web[grep("goods-name",web)]
head(goods_name)
#">【梅林】原味沙县美食
#+2是因为匹配到的">往后+2个坐标，字符总长度减去 < 1个字符
store_name <- substr(goods_name,regexpr("\">",goods_name)+2,nchar(goods_name)-4)


