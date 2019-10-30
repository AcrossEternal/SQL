--Select 练习五
--	查询与(《管理信息系统原理与实践》)同一出版社的所有图书的信息。
--第一种方法
(select BookName,Publisher from dbo.TBL_BookInfo
where BookName ='管理信息系统原理与实践')

select * from dbo.TBL_BookInfo
where Publisher in
(select Publisher from dbo.TBL_BookInfo
where Publisher ='电子工业出版社')
--第二种方法
select *from TBL_BookInfo
where Publisher in(select Publisher from TBL_BookInfo where BookName='管理信息系统原理与实践')

--	显示大于(平均页数)的图书的书名、作者、出版日期。
select BookName,Author,PublishDate
from TBL_BookInfo
where PageCount>(
select AVG(PageCount)from dbo.TBL_BookInfo)
--	查询出(最早被借的)书的信息.
select  *
from TBL_BookInfo
where BookID in (
select top 1 BookID
from TBL_BorrowInfo
order by BorrowDate)
 
select  Top 1 BorrowDate,*
from TBL_BorrowInfo br,TBL_BookInfo bo
where br.BookID=bo.BookID
order by br.BorrowDate desc
--	查询出(被借出)的最薄的书.
select top 1 *
from dbo.TBL_BookInfo
where BookID in(
select BookID from dbo.TBL_BorrowInfo)
order by WordCount asc


--	查询(出版书籍最多的出版社)所出版的所有图书的信息。
select *
from dbo.TBL_BookInfo 
where Publisher in
(select top 1 Publisher
from dbo.TBL_BookInfo
group by Publisher 
order by COUNT(*) desc)

