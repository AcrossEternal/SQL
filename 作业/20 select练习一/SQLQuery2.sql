--	查询TBL_Bookinfo 表中所有图书的索取号,标准编号,书名。

select BookID , ISBN,BookName  from dbo.TBL_BookInfo

--	在TBL_BookInfo显示书名中有“工程”两个字的图书的书名,出版社,作者及出版日期。

select *from dbo.TBL_BookInfo
where BookName like '%工程%'

--	在TBL_BookInfo中找出书名中带有“学”字，但又不带有“中学”二字的书

select *from dbo.TBL_BookInfo
where BookName <> '%中学%' and BookName like'%学%'

--	在TBL_BookInfo中找出页数大于100页并且小于200页的书（分别用比较运算符和BETWEEN两种方法实现）

select *from dbo.TBL_BookInfo
where PageCount >100 and PageCount<200--运算符

select *from dbo.TBL_BookInfo
where PageCount Between 101 and 199--BETWEEN

--	查询TBL_Bookinfo 表中所有图书的索取号,标准编号,书名，并用中文显示列名。

select BookID as 索引号,Publisher as 出版社 ,BookName as 书名 from dbo.TBL_BookInfo

--	在TBL_Bookinfo 表中查询所有“清华大学出版社”出版的书的书名, 作者及出版日期。

select BookName, Author,PublishDate from dbo.TBL_BookInfo
where Publisher='清华大学出版社' 

--	从TBL_Bookinfo表中检索出不是电子工业出版社和清华大学出版社出版的图书。

select *from dbo.TBL_BookInfo where Publisher <>'电子工业出版社'and Publisher<>'清华大学出版社'
select *from dbo.TBL_BookInfo where Publisher not in('电子工业出版社','清华大学出版社')

--	在TBL_Bookinfo显示“中国古代教育文选”和“德国近代文学史”两本书的信息。

select * from dbo.TBL_BookInfo
where BookName like '中国古代教育文选' or BookName like '德国近代文学史'

select * from TBL_BookInfo
where BookName in ('中国古代教育文选','德国近代文学史')

--	在TBL_Bookinfo显示“清华大学出版社”在1980后出版图书的书名，作者，页数。

select BookName,Author,PageCount,Publisher from dbo.TBL_BookInfo where PublishDate>1980-1-1 and Publisher = '清华大学出版社'
select BookName,Author ,PageCount from TBL_BookInfo where Publisher='清华大学出版社'and YEAR(publishDate)>=1980
--	在TBL_User表中中找出不姓“蒋”并且名字是3个字的男生

select * from dbo.TBL_User where UserName like '[^蒋]__' and Sex=1
select * from dbo.TBL_User where UserName <> '蒋%' and UserName like '___'and Sex=1

