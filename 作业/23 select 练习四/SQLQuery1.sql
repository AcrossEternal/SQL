--	查询出图书的索取号，书名，出版社，类别名称。
select a.BookID,a.BookName,a.Publisher,b.ClassName
from TBL_BookInfo as a,TBL_BookClass as b
where a.ClassID=b.ClassID  

select a.BookID,a.BookName,a.Publisher,b.ClassName
from TBL_BookInfo as a inner join TBL_BookClass as b
On a.ClassID=b.ClassID
--	在TBL_Borrowinfo用语句插入如下两条数据：
--          (‘G40-092.2/5’,’ 01022’,2007-1-6’,null,0)
--          (‘G633.7/202 ’,’ 01022’,2007-3-16’,null,0)
insert dbo.TBL_BorrowInfo
Values('G40-092.2/5','20170310040',2007-1-6,null,0)

insert dbo.TBL_BorrowInfo
Values('G633.7/202',20170310040,2007-3-16,null,0)
--	查询出借阅索取号为“G40-092.2/5”图书的读者姓名，班级。
select BookID,UserName,Class
from TBL_BorrowInfo as a inner join TBL_User as b 
on a.UserID=b.UserID
where BookID= 'G40-092.2/5'

--	显示没有归还书的书名、读者、读者的班级。
select bo.BookName,u.UserName,u.Class
from TBL_BorrowInfo as br,TBL_User as u,TBL_BookInfo as bo
where br.BookID=bo.BookID and br.UserID=u.UserID and IsReturned=0

select bo.BookName,u.UserName,u.Class
from TBL_BorrowInfo as br inner join TBL_BookInfo as bo 
On br.BookID=bo.BookID
inner join TBL_User as u 
On br.UserID=u.UserID
where IsReturned=0

--	查询出所有借过书的女生的信息。
select bo.BookName,u.UserName,u.Class
from TBL_BorrowInfo as br,TBL_User as u,TBL_BookInfo as bo
where br.BookID=bo.BookID and br.UserID=u.UserID and IsReturned=0 and Sex=0

select bo.BookName,u.UserName,u.Class
from TBL_BorrowInfo as br inner join TBL_BookInfo as bo
On br.BookID=bo.BookID
inner join TBL_User as u
On br.UserID=u.UserID
where IsReturned=0 and Sex=0

--	查询出所有2007年7月、8月被借出过的书的信息及借出时间。
select *,BorrowDate as bo,BookName as bo
from TBL_BorrowInfo as br,TBL_BookInfo as bo
where br.BookID=bo.BookID and BorrowDate between '2007-07-01'and'2007-08-31'

select *,BorrowDate as bo,BookName as bo
from TBL_BorrowInfo as br inner join TBL_BookInfo as bo
On br.BookID=bo.BookID and BorrowDate between '2007-07-01'and'2007-08-31'
--	查询出男、女生各借过多少本书。

select sex ,COUNT(*) as 数量
from TBL_BorrowInfo a,TBL_User b
Where a.UserID=b.UserID
group by sex

select sex ,COUNT(*) as 数量
from TBL_BorrowInfo as br inner join TBL_User as u
on br.UserID=u.UserID
group by sex
--	查询出各出版社在1985年以后出版的图书被借出的数量，并按借出数量的降序显示查询结果。
select Publisher,BorrowDate as br
from TBL_BookInfo as bo,TBL_BorrowInfo as br 
where br.BookID=bo.BookID and BorrowDate between '1985-01-01'and getdate()
order by BorrowDate desc

select Publisher,BorrowDate as br
from TBL_BookInfo as bo inner join TBL_BorrowInfo as br 
On br.BookID=bo.BookID and BorrowDate between '1985-01-01'and getdate()
order by BorrowDate desc

--	查询出2008年的所有借阅信息（包括：书名、借书时间、读者名）。
select bo.BookName,br.BorrowDate,bo.Author
from TBL_BookInfo as bo,TBL_BorrowInfo as br
where br.BookID=bo.BookID and BorrowDate between '2008-01-01'and'2008-12-31'

select bo.BookName,br.BorrowDate,bo.Author
from TBL_BookInfo as bo inner join TBL_BorrowInfo as br
On br.BookID=bo.BookID and BorrowDate between '2008-01-01'and'2008-12-31'