--	从TBL_User表中检索出最前面的5 个用户名，并去掉重复值 。
select distinct top 5 UserName from dbo.TBL_User

--	从TBL_ User 表中检索出最前面的3个姓’李’的用户记录的借书证号，姓名，性别并将保存到一个新表中。
select top 3 UserID,UserName,Sex 
into dbo.TBL_Class 
from dbo.TBL_User
where UserName like '李%'

select * from dbo.TBL_Class

--	从TBL_Bookinfo (图书信息)表查询图书的总数。
select COUNT(*) 
from dbo.TBL_BorrowInfo
--	查询各出版社最薄图书的页数并将结果保存到一个新表中。


select Publisher,MIN(PageCount) as 页数
into TBL_MinPageCountBook
from TBL_BookInfo
group by Publisher

--	显示每本书至今的年限。
 select *,YEAR(GETDATE())-YEAR(publishDate)as 年限
 from TBL_Bookinfo
 
--	从TBL_Bookinfo 表查询出各出版社的图书总数在2册以上的图书总数并将结果保存到一个新表中。
select Publisher,COUNT(*)
into TBL_abb
from dbo.TBL_BookInfo
group by Publisher
HAVING COUNT(*)>2

--	从TBL_ User 表中统计出每班男女人数。
select Class ,sex,COUNT(*) as 人数
from dbo.TBL_User
group by Class,sex
order by class
--	从TBL_Bookinfo (图书信息)表查询出版社的图书总数最少的前三位的出版社。
select top 3 with ties Publisher,COUNT (*)
from dbo.TBL_BookInfo
group by Publisher
order by Publisher asc