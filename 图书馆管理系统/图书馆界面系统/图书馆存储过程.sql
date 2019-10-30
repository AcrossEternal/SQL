
GO
CREATE procedure [dbo].[InsertNewUser]
@UserID char(1),@UserName nvarchar(20),@Sex bit,
@Password varchar(20),@Email varchar(50),@Class nvarchar(40),@photo image = null
as
insert TBL_User
values(@UserID,@UserName,@Sex,@Password,@Email,@Class,@photo)


GO
create procedure [dbo].[GetUserInfoByID]
@UserID char(11)
as
select * from TBL_User
where @UserID=UserID


GO
create proc [dbo].[InsertAdmin]
 @AdminID char (10), @adminName nvarchar(30) ,@PassWord binary (20) ,@Email nvarchar(40)
 as
insert TBL_AdminInfo
values(@AdminID,@adminName,@PassWord,@Email)



GO
create procedure [dbo].[ChangeAdminPassword]
 @AdminID char(10) ,@Password binary (20)
 as
 update dbo.TBL_AdminInfo
 set PassWord = @Password 
 where AdminID = @AdminID



GO
create procedure [dbo].[GetAllBookClass]
as
select ClassID,ClassName
from dbo.TBL_BookClass



GO
create procedure [dbo].[GetAdminInfoByID]
@AdminID char(10)
 as
 select AdminName
 from TBL_AdminInfo
 where AdminID =@AdminID



GO
create procedure [dbo].[AdminLogin]
 @AdminID char(10) ,@Password binary (20)
 as
 select 
COUNT(*)
from TBL_AdminInfo
where AdminID=@AdminID and PassWord=@Password



GO
create procedure [dbo].[UpdateBookInfo] 
@BookID char(15),@ISBN char(20),@BookName nvarchar(50),
@Author nvarchar(20),@PublishDate datetime,@BookVersion nvarchar(40),
@WordCount int,@PageCount smallint,@Publisher nvarchar(40),@ClassID char(1)
as
update TBL_BookInfo 
set BookID=@BookID,ISBN =@ISBN,BookName=@BookName,Author=@Author,PublishDate=@PublishDate,
BookVersion=@BookVersion,WordCount=@WordCount,PageCount=@PageCount,Publisher=@Publisher,ClassID=@ClassID
where BookID=@BookID



GO
CREATE procedure [dbo].[EXPhoto]
@Userid char(11) ,@PhotoFileName image
as
Insert dbo.EXUser
values(@Userid,@PhotoFileName)



GO
create procedure [dbo].[EXGetUserByUserID]
@Userid char(11) 
as
select *
from EXUser 
where @Userid=UserID



GO
create proc [dbo].[DeleteBook]
@BookID char(15)
as
delete TBL_BookInfo
where BookID=@BookID



GO
create procedure [dbo].[GetBookStatisticInfo]
as
select BookName,ISBN,Publisher,count(*) as 总数
from TBL_BookInfo
group by bookname,isbn,publisher



GO
CREATE procedure [dbo].[GetBookInfoByClassIDAndBookName]
@ClassID char(1),@BookName nvarchar(50)
as
select a.*,b.ClassName
from TBL_BookInfo a inner join TBL_BookClass b on a.ClassID=b.ClassID
where BookName like '%'+BookName+'%'
and a.ClassID= case @ClassID when ''then  a.ClassID else @ClassID end



GO
create procedure [dbo].[GetBookInfoByBookID]
@BookID char(15)
as
select *
from dbo.TBL_BookInfo
where BookID=@BookID



GO
CREATE procedure [dbo].[HasThisBook]
@BookID char(15)
as
select COUNT(*)
from TBL_BookInfo
where BookID=@BookID



GO
create procedure [dbo].[InsertNewBook]
@BookID char(15),@ISBN char(20),@BookName nvarchar(50),
@Author nvarchar(20),@PublishDate datetime,@BookVersion nvarchar(40),
@WordCount int,@PageCount smallint,@Publisher nvarchar(40),@ClassID char(1)
as
insert TBL_BookInfo
values(@BookID,@ISBN,@BookName,@Author,@PublishDate,@BookVersion,@WordCount,@PageCount,@Publisher,@ClassID)


GO
create procedure [dbo].[IsReturn]
as
select *
from TBL_User
where userid in(
select top 1 UserID
from TBL_BorrowInfo
group by UserID
Order by COUNT (*) desc)



GO
create procedure [dbo].[IsBorrowed]
@BookID char(15)
as
select top 1 IsReturned
from TBL_BorrowInfo
where BookID =@BookID
order by IsReturned asc



GO
CREATE procedure [dbo].[GetBorrowInfoByUserID]
@UserID char(11)
as
select u.UserName,BorrowDate,ReturnDate,IsReturned,
bi.BookID,ISBN,BookName,Author,PublishDate,BookVersion,WordCount,PageCount,Publisher,ClassID
from TBL_BookInfo bi inner join TBL_BorrowInfo br
on bi.BookID =br.BookID  inner join TBL_User u
on br.UserID =u.UserID and IsReturned=0

where @UserID=u.UserID
order by  IsReturned ,ReturnDate desc



GO
CREATE procedure [dbo].[GetBorrowInfoByBookID]
@BookID char(15)
as 
select u.*,br.BookID,BorrowDate,ReturnDate,IsReturned,
bi.BookID,ISBN,BookName,Author,PublishDate,BookVersion,WordCount,PageCount,Publisher,ClassID
from TBL_BookInfo bi inner join TBL_BorrowInfo br
on bi.BookID =br.BookID  inner join TBL_User u
on br.UserID =u.UserID 
where @BookID =br.BookID
order by  IsReturned



GO
CREATE procedure [dbo].[BorrowBook]
@BookID char(11),@UserID char(15)
as 
insert TBL_BorrowInfo
values(@BookID,@UserID,GETDATE(),null,0)



GO
create procedure [dbo].[ReturnBook]
@BookID char(15)
as
update TBL_BorrowInfo
set IsReturned=1,ReturnDate=GETDATE()
where BookID=@bookID



GO
CREATE procedure [dbo].[ReborrowBook]
@BookID char(15)
as
declare @userid char(11)
select @userid = userid from TBL_BorrowInfo where BookID = @BookID and IsReturned = 0
if @userid is not null
 begin
    
    
    exec ReturnBook @bookid
    exec BorrowBook @bookid,@userid
   end
GO
