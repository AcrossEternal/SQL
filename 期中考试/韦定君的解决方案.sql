GO--ɾ������
create procedure dbo.DeleteRoom
@RoomID char(10)
as
delete Room
where @RoomID=RoomID


GO--��RoomID������Ƭ
create proc GetPhoto
@RoomID char(10)
as
select RoomPhoto
from Room
where RoomID=@RoomID


GO--�����������Ƭ
create procedure IsRoom
@RoomID char(10),@RoomName varchar(50),@NumofTable int,@RoomType varchar(100),@RoomStatus bit
as
insert Room
Values(@RoomID,@RoomName,@NumofTable,@RoomType,@RoomStatus,null)



GO--�����������Ƭ
create procedure ISRoomPhoto
@RoomID char(10),@RoomName varchar(50),@NumofTable int,@RoomType varchar(100),@RoomStatus bit,@RoomPhoto image
as
insert Room
Values(@RoomID,@RoomName,@NumofTable,@RoomType,@RoomStatus,@RoomPhoto)


GO--ģ������ 
create procedure selectRoomIDAndRoomType
@RoomID char (10),@RoomType Varchar (100)
as
select RoomID,RoomName,NumofTable,RoomType,RoomStatus
from Room
where RoomID like '%' +RoomID +'%' and
RoomID= case @RoomID when '' then RoomID else @RoomID end



GO--�޸İ�������Ƭ
create procedure UpdateRoom
@RoomID char(10),@RoomName varchar(50),@NumofTable int,@RoomType varchar(100),@RoomStatus bit
as
update Room
set RoomID=@RoomID
, RoomName=@RoomName 
, NumofTable =@NumofTable 
, RoomType= @RoomType 
, RoomStatus=@RoomStatus

where RoomID=@RoomID



GO--�޸İ�������Ƭ
create proc UpdateRoomPhoto
@RoomID char(10),@RoomName varchar(50),@NumofTable int,@RoomType varchar(100),@RoomStatus bit,@RoomPhoto image
as
update Room
set RoomID=@RoomID
, RoomName=@RoomName 
, NumofTable =@NumofTable 
, RoomType= @RoomType 
, RoomStatus=@RoomStatus
, RoomPhoto=@RoomPhoto

where RoomID=@RoomID