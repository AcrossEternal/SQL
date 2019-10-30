select classid,COUNT(*) as bcount
into Bookcount
from TBL_BookInfo
group by ClassID

select * from dbo.Bookcount 



go--插入表触发器
create trigger book_insert on dbo.TBL_BookInfo
for insert 
as
declare @ClassID char(1)
select @ClassID=ClassID from inserted 
if exists(select* from dbo.BookCount where Classid=@ClassID)
    update dbo.BookCount set BCount=BCount+1
    where ClassID=@ClassID
else
   insert into dbo.BookCount
   Values(@ClassID,1)
   
   
insert dbo.TBL_BookInfo
Values ('233332sss','qqqq','qqww','aaa3','2010-1-1','1',2000,200,'aaaaa','T')


--以电子工业出版社为准的触发器 (INSERT触发器)
select publisher,COUNT(*) as bcount
into BookPublisherCount
from TBL_BookInfo
group by publisher


go
alter trigger book_Count on dbo.TBL_BookInfo
for insert
as
declare  @Publisher char(40)
select @Publisher = Publisher from inserted
if exists(select * from dbo.BookPublisherCount where Publisher=@publisher)
    upDate dbo.BookPublisherCount set BCount=BCount+1
    where Publisher=@publisher
else
   insert into dbo.BookPublisherCount
   Values(@Publisher,40)
   
insert dbo.TBL_BookInfo
Values ('223465822200','qqqq','qqww','aaa3','2010-1-1','1',2000,200,'电子工业出版社','T')

 select * from dbo.BookPublisherCount
   where publisher ='电子工业出版社'
   
   
   
   
go   
create trigger book_Delete on dbo.TBL_Bookinfo--删除信息触发器
for delete
as
   declare @classid char(1),@bcount int
   select @classid=classid from deleted
   select @bcount=bcount from dbo.Bookcount where classid=@classid
   if(@bcount>1)
   update dbo.bookcount set bcount=bcount-1 where classid =@classid
   else
   delete dbo.Bookcount where classid=@classid
   end
   
   select * from tbl_bookinfo
   select * from dbo.bookcount
    
   delete dbo.TBL_BookInfo where bookid='223465800'
   
   
go   
create trigger book_update on dbo.TBL_Bookinfo--前面几个触发器的结合
for update 
as
   if update (classid)
   begin
      declare @oldClassid char(1),@newClassid char(1)
      select  @oldClassid =classid from deleted
      select  @newClassid =classid from inserted
      select  @oldClassid as oldclassid,@newClassid as newclassid
   end
 
 update dbo.TBL_BookInfo set classid='A' where bookid='233332sss'

 select *from dbo.TBL_BookInfo
 
 
 
