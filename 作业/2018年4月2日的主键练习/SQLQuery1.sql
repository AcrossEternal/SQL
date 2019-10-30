
--玩转主键

--练习1
insert into dbo.TBL_User
Values('111','zhang',1,'130577988@126.com','2017级软件技术',null)--正确

insert into dbo.TBL_User
Values('111','zhan',1,'30577988@126.com','2017级软件技术',null)--错误，主键不得重复

insert into dbo.TBL_User
Values(null,'zhang',1,'130577988@126.com','2017级软件技术',null)--错误，主键不得为null


--练习2
insert into dbo.TBL_BorrowInfo
Values('A563/10','20170310040','2017.04.01',null,null)--正确

insert into dbo.TBL_BorrowInfo
Values('A563/10','20170310040','2017.04.01','2017.04.05',null)--错误，主键不得完全相同

insert into dbo.TBL_BorrowInfo
Values('A563/10','20170310040','null',null,null)--错误，任何一个主键都不得为null




--删除    
delete dbo.TBL_User
where UserID in (select UserID from TBL_User
group by UserID
having COUNT(*)>=2)

delete dbo.TBL_User  --Email 索引约束Unique
where Email in (select Email from TBL_User
group by Email
having COUNT(*)>=2)

delete dbo.TBL_User  --删除所有的在Email的null
where Email is null

--唯一性
insert into dbo.TBL_BorrowInfo
Values('A563/15','20170310040','2017.04.01',null,null)--正确

insert into dbo.TBL_BorrowInfo
Values('A563/15','20170310040','2017.04.01',null,null)--错误，触发的唯一性

 --查找
select Email,COUNT(*) from dbo.TBL_User
group by Email
having COUNT(*)>=2
