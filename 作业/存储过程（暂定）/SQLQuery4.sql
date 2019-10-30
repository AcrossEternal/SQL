----（5）GetAllBookClass	
--输入参数:无
--功能：从TBL_BookClass表中查询所有图书类别编号及类型名称

create procedure GetAllBookClass
as
select ClassID,ClassName
from dbo.TBL_BookClass

Exec GetAllBookClass

--（6）GetBookInfoByBookID	
--输入参数: @BookID
--功能：查询指定图书编号的图书所有信息（包括图书类别编号及类型名称）

create procedure GetBookInfoByBookID
@BookID char(15)
as
select *
from dbo.TBL_BookInfo
where BookID=@BookID

Exec GetBookInfoByBookID =''

--（7）GetBookInfoByClassIDAndBookName
--输入参数：@ClassID,@BookName 
--功能：查询指定书名、指定类型的图书所有信息（包括图书类别编号及类型名称）。书名采用模糊查询，当@ClassID 为空时，则忽略该条件。
go
create procedure GetBookInfoByClassIDAndBookName
@ClassID char(1),@BookName nvarchar(50)
as
select bi.BookID,bi.ISBN,bi.BookName,bi.Author,bi.PublishDate,bi.BookVersion,bi.WordCount,bi.PageCount,bi.Publisher,bi.ClassID,
bc.ClassID,bc.ClassName 
from TBL_BookInfo bi inner join TBL_BookClass bc
on bi.ClassID=bc.ClassID 
where bi.BookName like'程序设计' and bc.ClassID like 'T'

--（8）GetBookInfoByCondition
--输入参数：@ISBN,@BookName,@Author,@ClassID
--功能：查询指定ISBN、书名、指定作者、指定类型的图书所有信息（包括图书类别编号及类型名称）。书名采用模糊查询；当@ISBN为空时，则忽略该条件；当@Author为空时，则忽略该条件；当@ClassID 为空时，则忽略该条件。

go
create procedure GetBookInfoByCondition
@ISBN char(20),@BookName nvarchar(50),@Author nvarchar(20),@ClassID char(1)
as
select bi.BookID,bi.ISBN,bi.BookName,bi.Author,bi.PublishDate,bi.BookVersion,bi.WordCount,bi.PageCount,bi.Publisher,bi.ClassID,
bc.ClassID,bc.ClassName 
from TBL_BookInfo bi inner join TBL_BookClass bc
on bi.ClassID=bc.ClassID 
where 

exec GetBookInfoByCondition ''

--（9）GetBookStatisticInfo
--输入参数：无
--功能：按BookName,ISBN,Publisher分组统计图书总数，给出（BookName,ISBN,Publisher，总数）信息。

go
create procedure GetBookStatisticInfo
as
select BookName,ISBN,Publisher,count(*) as 总数
from TBL_BookInfo
group by bookname,isbn,publisher


exec GetBookStatisticInfo
--（10）GetBorrowInfoByBookID
--输入参数：@BookID 
--功能：根据图书编号查询借阅信息（包括该读者信息、借阅信息、图书信息，不包含图书类别名称），并按是否归还升序排序。

go
create procedure GetBorrowInfoByBookID
@BookID char(15)
as 
select u.*,br.BookID,BorrowDate,ReturnDate,IsReturned,
bi.BookID,ISBN,BookName,Author,PublishDate,BookVersion,WordCount,PageCount,Publisher,ClassID
from TBL_BookInfo bi inner join TBL_BorrowInfo br
on bi.BookID =br.BookID  inner join TBL_User u
on br.UserID =u.UserID 
where @BookID =br.BookID
order by  IsReturned


exec GetBorrowInfoByBookID ''
--（11）GetBorrowInfoByUserID
--输入参数：@UserID 
--功能：根据读者编号查询该读者借阅的所有信息（包括该读者信息、借阅信息、图书信息，不包含图书类别名称），并按是否归还升序、归还时间降序排序
go
create procedure GetBorrowInfoByUserID
@UserID char(11)
as
select u.*,br.BookID,BorrowDate,ReturnDate,IsReturned,
bi.BookID,ISBN,BookName,Author,PublishDate,BookVersion,WordCount,PageCount,Publisher,ClassID
from TBL_BookInfo bi inner join TBL_BorrowInfo br
on bi.BookID =br.BookID  inner join TBL_User u
on br.UserID =u.UserID 

where @UserID=u.UserID
order by  IsReturned ,ReturnDate desc

exec GetBorrowInfoByUserID ''
--（12）GetUserInfoByID
--输入参数：@UserID 
--功能：根据读者编号查询该读者的相关信息。
go
create procedure GetUserInfoByID
@UserID char(11)
as
select * from TBL_User
where @UserID=UserID

exec GetUserInfoByID ' '
--（13）HasThisBook	
--输入参数：@BookID 
--功能：根据图书编号统计该书的总数。
go
create procedure HasThisBook
@BookID char(15)
as
select BookID,count(*) as 总数
from TBL_BookInfo
where BookID =@BookID
group by BookID  
 

exec HasThisBook ' '
--（14）InsertNewBook
--输入参数：所有图书相关信息
--功能：完成图书信息的添加，所有相关信息通过参数传入
go 
create procedure InsertNewBook
@BookID char(15),@ISBN char(20),@BookName nvarchar(50),
@Author nvarchar(20),@PublishDate datetime,@BookVersion nvarchar(40),
@WordCount int,@PageCount smallint,@Publisher nvarchar(40),@ClassID char(1)
as

insert TBL_BookInfo
values(@BookID,@ISBN,@BookName,@Author,@PublishDate,@BookVersion,@WordCount,@PageCount,@Publisher,@ClassID)

exec InsertNewBook' ',' ',' ',' ',' ',' ', ,' ',' '
--（15）InsertNewUser
--输入参数：所有读者相关信息
--功能：完成读者信息的添加，所有相关信息通过参数传入
go 
create procedure InsertNewUser
@UserID char(1),@UserName nvarchar(20),@Sex bit,
@Password varchar(20),@Email varchar(50),@Class nvarchar(40),@photo image
as
insert TBL_User
values(@UserID,@UserName,@Sex,@Password,@Email,@Class,@photo)

exec InsertNewUser ' ',' ', ,' ',' ',' ',null
--（16）IsBorrowed
--输入参数：@BookID
--功能：查询指定图书当前是否借出。
create procedure IsBorrowed
@BookID char(15)*9
as
select  case IsReturned
when 0 then '这本书当前已借出'
when 1 then '这本书当前没有借出' end
from TBL_BorrowInfo
where BookID=@BookID 
if @@ROWCOUNT=0
print '这本书当前没有借出'

exec IsBorrowed ' '
--（17）ReborrowBook
--输入参数：@BookID
--功能：完成指定图书的续借，续借由还书与借书两个步骤完成
go
create procedure ReborrowBook
@BookID char(15)
as

--（18）ReturnBook
--输入参数：@BookID
--功能：完成指定图书的归还（即修改指定图书的借阅信息，将IsReturned 改为1、ReturnDate 改为系统时间）

create procedure ReturnBook
@BookID char(15)
as
update TBL_BorrowInfo
set IsReturned=1,ReturnDate=GETDATE()
where BookID=@bookID 

exec ReturnBook 'I286.7/2'
--（19）UpdateBookInfo 
--输入参数：所有图书相关信息
--功能：修改图书信息，所有相关信息通过参数传入
go 
create procedure UpdateBookInfo 
@BookID char(15),@ISBN char(20),@BookName nvarchar(50),
@Author nvarchar(20),@PublishDate datetime,@BookVersion nvarchar(40),
@WordCount int,@PageCount smallint,@Publisher nvarchar(40),@ClassID char(1)
as
update TBL_BookInfo 
set BookID=@BookID,ISBN =@ISBN,BookName=@BookName,Author=@Author,PublishDate=@PublishDate,
BookVersion=@BookVersion,WordCount=@WordCount,PageCount=@PageCount,Publisher=@Publisher,ClassID=@ClassID
where BookID=@BookID 

exec UpdateBookInfo ' ','','','','',null, , ,' ',' '
--（20）UserLogin	
--输入参数：@UserID ,  @Password 
--功能：统计指定读者编号和密码的记录总数。
go
create procedure UserLogin
@UserID char(11),@Password varchar(20)
as
select UserID,Password,count(*) as 总数
from dbo.TBL_User
where UserID=@UserID and Password=@Password
group by UserID


--(21) BorrowBook
--输入参数： @UserID，@BookID
--功能：根据参数在借阅表中插入一条借阅记录（借阅时间为系统当前时间，归还时间为null,isReturned的值为0）
go
create procedure BorrowBook
@UserID char(11),@BookID char(15)
as 
insert TBL_BorrowInfo
values(@BookID,@UserID,GETDATE(),null,0)



exec BorrowBook' ',' '


