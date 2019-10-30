--	分别用语句和SSMS向导创建以下视图
--	建立一个名为V_CXTS1的视图 ，功能是从图书表中查询书名中包含有“工程数学”的所有记录的索取号，书名，作者，出版社，出版日期，类别编号。

create view V_CXTS1
as
select BookID,BookName,Author,Publisher,PublishDate,ClassID 
from TBL_BookInfo
where BookName like '%工程数学'


--	建立一个名为V_CXTS2的加密视图 ，功能是查询出图书的索取号，书名，出版社，类别。

create view V_CXTS2  with encryption
as
select bi.BookID,bi.BookName,bi.Publisher,bc.ClassName 
from TBL_BookInfo bi,TBL_BookClass bc
where bi.ClassID=bc.ClassID 

--	设计一个借书情况视图V_JSQK，用于从图书借阅表、图书信息表、读者信息表中查询所有读者的借书情况，
--其中包括的数据项有：读者姓名、性别、图书名称、出版社、出版日期、借书日期、还书日期。

create view V_JSQK
as 
select u.UserName,u.Sex ,bi.BookName,bi.Publisher,bi.PublishDate,br.BorrowDate,br.ReturnDate 
from TBL_BorrowInfo br inner join TBL_BookInfo bi on br.BookID =bi.BookID
inner join TBL_User u on u.UserID =br.UserID

select * from V_JSQK


--	修改视图
--	修改V_CXTS2视图，去掉原来的加密功能,并按出版社排序。

alter view V_CXTS2
as
select top 88* 
from TBL_BookInfo
order by Publisher



--	用语名为V_CXTS1视图插入一条数据
--	(‘TB11/6’,’高等工程数学方法’,‘胡映电’,’电子工业出版社‘,’1998-07-15‘,T’)

insert  V_CXTS1
values('TB11/6','高等工程数学方法','胡映电','电子工业出版社','1998-07-15','T')

select * from TBL_BookInfo
where BookID='TB11/6'