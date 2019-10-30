----��5��GetAllBookClass	
--�������:��
--���ܣ���TBL_BookClass���в�ѯ����ͼ������ż���������

create procedure GetAllBookClass
as
select ClassID,ClassName
from dbo.TBL_BookClass

Exec GetAllBookClass

--��6��GetBookInfoByBookID	
--�������: @BookID
--���ܣ���ѯָ��ͼ���ŵ�ͼ��������Ϣ������ͼ������ż��������ƣ�

create procedure GetBookInfoByBookID
@BookID char(15)
as
select *
from dbo.TBL_BookInfo
where BookID=@BookID

Exec GetBookInfoByBookID =''

--��7��GetBookInfoByClassIDAndBookName
--���������@ClassID,@BookName 
--���ܣ���ѯָ��������ָ�����͵�ͼ��������Ϣ������ͼ������ż��������ƣ�����������ģ����ѯ����@ClassID Ϊ��ʱ������Ը�������
go
create procedure GetBookInfoByClassIDAndBookName
@ClassID char(1),@BookName nvarchar(50)
as
select bi.BookID,bi.ISBN,bi.BookName,bi.Author,bi.PublishDate,bi.BookVersion,bi.WordCount,bi.PageCount,bi.Publisher,bi.ClassID,
bc.ClassID,bc.ClassName 
from TBL_BookInfo bi inner join TBL_BookClass bc
on bi.ClassID=bc.ClassID 
where bi.BookName like'�������' and bc.ClassID like 'T'

--��8��GetBookInfoByCondition
--���������@ISBN,@BookName,@Author,@ClassID
--���ܣ���ѯָ��ISBN��������ָ�����ߡ�ָ�����͵�ͼ��������Ϣ������ͼ������ż��������ƣ�����������ģ����ѯ����@ISBNΪ��ʱ������Ը���������@AuthorΪ��ʱ������Ը���������@ClassID Ϊ��ʱ������Ը�������

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

--��9��GetBookStatisticInfo
--�����������
--���ܣ���BookName,ISBN,Publisher����ͳ��ͼ��������������BookName,ISBN,Publisher����������Ϣ��

go
create procedure GetBookStatisticInfo
as
select BookName,ISBN,Publisher,count(*) as ����
from TBL_BookInfo
group by bookname,isbn,publisher


exec GetBookStatisticInfo
--��10��GetBorrowInfoByBookID
--���������@BookID 
--���ܣ�����ͼ���Ų�ѯ������Ϣ�������ö�����Ϣ��������Ϣ��ͼ����Ϣ��������ͼ��������ƣ��������Ƿ�黹��������

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
--��11��GetBorrowInfoByUserID
--���������@UserID 
--���ܣ����ݶ��߱�Ų�ѯ�ö��߽��ĵ�������Ϣ�������ö�����Ϣ��������Ϣ��ͼ����Ϣ��������ͼ��������ƣ��������Ƿ�黹���򡢹黹ʱ�併������
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
--��12��GetUserInfoByID
--���������@UserID 
--���ܣ����ݶ��߱�Ų�ѯ�ö��ߵ������Ϣ��
go
create procedure GetUserInfoByID
@UserID char(11)
as
select * from TBL_User
where @UserID=UserID

exec GetUserInfoByID ' '
--��13��HasThisBook	
--���������@BookID 
--���ܣ�����ͼ����ͳ�Ƹ����������
go
create procedure HasThisBook
@BookID char(15)
as
select BookID,count(*) as ����
from TBL_BookInfo
where BookID =@BookID
group by BookID  
 

exec HasThisBook ' '
--��14��InsertNewBook
--�������������ͼ�������Ϣ
--���ܣ����ͼ����Ϣ����ӣ����������Ϣͨ����������
go 
create procedure InsertNewBook
@BookID char(15),@ISBN char(20),@BookName nvarchar(50),
@Author nvarchar(20),@PublishDate datetime,@BookVersion nvarchar(40),
@WordCount int,@PageCount smallint,@Publisher nvarchar(40),@ClassID char(1)
as

insert TBL_BookInfo
values(@BookID,@ISBN,@BookName,@Author,@PublishDate,@BookVersion,@WordCount,@PageCount,@Publisher,@ClassID)

exec InsertNewBook' ',' ',' ',' ',' ',' ', ,' ',' '
--��15��InsertNewUser
--������������ж��������Ϣ
--���ܣ���ɶ�����Ϣ����ӣ����������Ϣͨ����������
go 
create procedure InsertNewUser
@UserID char(1),@UserName nvarchar(20),@Sex bit,
@Password varchar(20),@Email varchar(50),@Class nvarchar(40),@photo image
as
insert TBL_User
values(@UserID,@UserName,@Sex,@Password,@Email,@Class,@photo)

exec InsertNewUser ' ',' ', ,' ',' ',' ',null
--��16��IsBorrowed
--���������@BookID
--���ܣ���ѯָ��ͼ�鵱ǰ�Ƿ�����
create procedure IsBorrowed
@BookID char(15)*9
as
select  case IsReturned
when 0 then '�Ȿ�鵱ǰ�ѽ��'
when 1 then '�Ȿ�鵱ǰû�н��' end
from TBL_BorrowInfo
where BookID=@BookID 
if @@ROWCOUNT=0
print '�Ȿ�鵱ǰû�н��'

exec IsBorrowed ' '
--��17��ReborrowBook
--���������@BookID
--���ܣ����ָ��ͼ������裬�����ɻ�������������������
go
create procedure ReborrowBook
@BookID char(15)
as

--��18��ReturnBook
--���������@BookID
--���ܣ����ָ��ͼ��Ĺ黹�����޸�ָ��ͼ��Ľ�����Ϣ����IsReturned ��Ϊ1��ReturnDate ��Ϊϵͳʱ�䣩

create procedure ReturnBook
@BookID char(15)
as
update TBL_BorrowInfo
set IsReturned=1,ReturnDate=GETDATE()
where BookID=@bookID 

exec ReturnBook 'I286.7/2'
--��19��UpdateBookInfo 
--�������������ͼ�������Ϣ
--���ܣ��޸�ͼ����Ϣ�����������Ϣͨ����������
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
--��20��UserLogin	
--���������@UserID ,  @Password 
--���ܣ�ͳ��ָ�����߱�ź�����ļ�¼������
go
create procedure UserLogin
@UserID char(11),@Password varchar(20)
as
select UserID,Password,count(*) as ����
from dbo.TBL_User
where UserID=@UserID and Password=@Password
group by UserID


--(21) BorrowBook
--��������� @UserID��@BookID
--���ܣ����ݲ����ڽ��ı��в���һ�����ļ�¼������ʱ��Ϊϵͳ��ǰʱ�䣬�黹ʱ��Ϊnull,isReturned��ֵΪ0��
go
create procedure BorrowBook
@UserID char(11),@BookID char(15)
as 
insert TBL_BorrowInfo
values(@BookID,@UserID,GETDATE(),null,0)



exec BorrowBook' ',' '


