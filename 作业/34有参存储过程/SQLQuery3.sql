--创建一个名为DeleteBook 的存储过程，输入参数为
--@BookID，根据输入参数删除指定编号的图书。
create procedure DeleteBook
@BookID char(15)
as
delete TBL_BookInfo
where BookID =@BookID 

EXEC DeleteBook 'F715-49/17'
--2.创建一个名为InsertNewBook 的存储过程，完成图书
--信息的添加，所有相关信息通过参数传入。
create procedure InsertNewBook
@BookID char(15),
@ISBN char(20),
@BookName nvarchar(50),
@Author nvarchar(20),
@PublishDate datetime,
@BookVersion nvarchar(40),
@WordCount int,
@PageCount smallint,
@Publisher nvarchar(40),
@ClassID char(1)
as 
insert into TBL_BookInfo
Values(@BookID,@ISBN ,@BookName ,@Author ,@PublishDate ,@BookVersion ,@WordCount ,@PageCount ,@Publisher,@ClassID)

EXEC InsertNewBook 'G999-45/85','a7-302-10453-Y','量子力学','韦定君','2018-04-18',null,241300,915,'电子工业出版社','G'
--3.创建一个名为GetBorrowInfoByUserID的存储过程，输
--入参数为@UserID,根据输入参数查询指定读者的所有借
--阅信息（包括UserName, BookName,BorrowDate,ReturnDate,IsReturned）

create procedure GetBorrowInfoByUserID
@UserID char(11)
