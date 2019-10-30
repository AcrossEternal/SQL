--	INSERT触发器
--1.	在表TBL_BookInfo中创建触发器，当向表TBL_BookInfo插入一行时，更改bookcount表中对应记录的总数，如不存在对应记录，则插入一行新记录，总数为1。
--2.	查看表bookcount中“电子工业出版社”的图书总数
--3.	向表TBL_BookInfo插入一条“电子工业出版社”的图书。查看表bookcount中“电子工业出版社”的图书总数，测试触发器的作用。

select publisher,COUNT(*) as bcount
into BookPublisherCount
from TBL_BookInfo
group by publisher

go
alter trigger book_Count on dbo.TBL_BookInfo
for insert
as
declare  @Publisher nvarchar(40)
select @Publisher = Publisher from inserted
if exists(select * from dbo.BookPublisherCount where Publisher=@publisher)
    upDate dbo.BookPublisherCount set BCount=BCount+1
    where Publisher=@publisher
else
   insert into dbo.BookPublisherCount
   Values(@Publisher,40)
   
   end
   
--插入一条信息   
insert dbo.TBL_BookInfo
Values ('223465822200','qqqq','qqww','aaa3','2010-1-1','1',2000,200,'电子工业出版社','T')
--查看信息
 select * from dbo.BookPublisherCount
   where publisher ='电子工业出版社'
   
   
--	DELETE触发器
--1.	在表TBL_BookInfo中创建触发器，当表TBL_BookInfo删除一行时，更改bookcount表中对应记录的总数，如记录数为0，则删除该记录。
--2.	查看表bookcount中“清华大学出版社”的图书总数
--3.	在表TBL_BookInfo删除一条“清华大学出版社”的图书。查看表bookcount中“清华大学出版社”的图书总数，测试触发器的作用。
   
select publisher,COUNT(*) as bcount
into BookPublisherCount
from TBL_BookInfo
group by publisher
   
go   
alter trigger book_Delete on dbo.TBL_Bookinfo--删除信息触发器
for delete
as
   declare @publisher nvarchar(40),@bcount int
   select @publisher=publisher from deleted
   select @bcount=bcount from dbo.BookPublisherCount where publisher=@publisher
   if(@bcount>1)
   update dbo.BookPublisherCount set bcount=bcount-1 where publisher =@publisher
   else
   delete dbo.BookPublisherCount where publisher=@publisher
   
   
   
   select publisher,Count(*)
   from dbo.BookPublisherCount
   where publisher ='清华大学出版社'
   group by publisher
   
   select * from dbo.BookPublisherCount
    
   delete dbo.TBL_BookInfo where publisher='清华大学出版社' and bookid ='TP312BA/253'
   
--   	update触发器
--1.	在表TBL_BookInfo中创建触发器，当表TBL_BookInfo修改内容时，如果修改的是Publisher列，在更改bookcount表中对应记录的总数（处理方法与上两题相同）。
--2.	查看表bookcount中“电子工业出版社”、 “清华大学出版社”的图书总数。
--3.	将表TBL_BookInfo中一条“电子工业出版社”的图书改为“清华大学出版社” 。查看表bookcount中“电子工业出版社”的图书总数，测试触发器的作用。

   
go   
alter trigger book_update on dbo.TBL_Bookinfo
for update 
as
   if update (publisher)
   
      declare @oldPublisher nvarchar(40),@newPublisher char(40),@bcount int
      select  @oldPublisher =Publisher from deleted
      select  @newPublisher =Publisher from inserted
      select @bcount=bcount from dbo.BookPublisherCount where publisher=@oldPublisher

   
   if(@bcount>1)
   update dbo.BookPublisherCount set bcount=bcount-1 where publisher =@oldPublisher 
   else
   delete dbo.BookPublisherCount where publisher=@oldPublisher 
   
   if exists(select * from dbo.BookPublisherCount where Publisher=@newPublisher)
    upDate dbo.BookPublisherCount set BCount=BCount+1
    where Publisher=@newPublisher
else
   insert into dbo.BookPublisherCount
   Values(@newPublisher,40)
   
 
 update dbo.TBL_BookInfo set publisher='清华大学出版社' where bookid='223465822200   '

 
 select publisher,Count(*)--查看清华大学出版社的信息数量
 from tbl_bookinfo 
 where publisher ='电子工业出版社' --or publisher='清华大学出版社'
 group by publisher
 
 select *
 from TBL_BookInfo
 where publisher ='电子工业出版社'
 

