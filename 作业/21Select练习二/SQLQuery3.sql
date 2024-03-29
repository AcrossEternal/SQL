--	在TBL_Bookinfo表中检索所有的出版社。

select distinct Publisher  from dbo.TBL_BookInfo

--	 TBL_Bookinfo显示所有书的书名，出版社、出版日期，并按出版日期升序排列;

select BookName,Publisher,PublishDate from dbo.TBL_BookInfo
order by PublishDate asc

--	从TBL_Bookinfo表中检索1990至2000年出版的图书信息，并按出版日期降序排列。

select *from dbo.TBL_BookInfo
where PublishDate between '1990-1-1'and '2000-12-30'
order by PublishDate desc

--	按出版社的降序和出版日期的升序检索TBL_Bookinfo表的记录。

select *from dbo.TBL_BookInfo
order by Publisher desc , PublishDate asc
