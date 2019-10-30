--select 综合训练
--查询某个用户借阅时间超过3个月未归还的了图书信息和读者信息
select bo.*,u.*
from dbo.TBL_BorrowInfo as b,dbo.TBL_BookInfo as bo,dbo.TBL_User as u
where DATEDIFF(DAY,BorrowDate,GETDATE())>90 and IsReturned=0 and bo.BookID=b.BookID and b.UserID=u.UserID


--查询人气最旺图书的出版社


select Publisher 
from dbo.TBL_BookInfo
where BookID in(select top 1 BookID 
from dbo.TBL_BorrowInfo
group by BookID
order by COUNT(BookID)desc)                                                          

--查询未归还图书超过3本的用户信息
select top 3 u.*,b.IsReturned
from dbo.TBL_BorrowInfo as b,dbo.TBL_User as u
where  b.IsReturned=0 and b.UserID=u.UserID


--查询某个作者(姓刘)、分类为工业技术、未被借阅的图书信息
select bo.*
from dbo.TBL_BookInfo as bo , dbo.TBL_BorrowInfo as b
where Author like '刘%' and ClassID like '工业技术' and b.BookID=bo.BookID
