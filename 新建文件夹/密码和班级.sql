--ÃÜÂë
go
create function fn_users
(@type varchar(7))
returns @users table
(   userid char(11) primary key not null,
    username nvarchar(20) not null,
    password varchar(20)
)
as
   begin
      if @type='showpwd'
         insert  @users  select UserID,username,password from TBL_User
      else if @type='nopwd'
         insert @users   select userid,username,'Òş²ØÃÜÂë'from TBL_User
      return   
   end

   select * from fn_users('showpwd')
   select * from fn_users('nopwd')
   
--°à¼¶
go
create function fn_userClass
(@class nvarchar(40))
returns table
as 
   return (select userid ,username,sex,password,email,class from tbl_user where class=@class   
   ) 