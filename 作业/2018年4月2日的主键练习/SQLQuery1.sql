
--��ת����

--��ϰ1
insert into dbo.TBL_User
Values('111','zhang',1,'130577988@126.com','2017���������',null)--��ȷ

insert into dbo.TBL_User
Values('111','zhan',1,'30577988@126.com','2017���������',null)--�������������ظ�

insert into dbo.TBL_User
Values(null,'zhang',1,'130577988@126.com','2017���������',null)--������������Ϊnull


--��ϰ2
insert into dbo.TBL_BorrowInfo
Values('A563/10','20170310040','2017.04.01',null,null)--��ȷ

insert into dbo.TBL_BorrowInfo
Values('A563/10','20170310040','2017.04.01','2017.04.05',null)--��������������ȫ��ͬ

insert into dbo.TBL_BorrowInfo
Values('A563/10','20170310040','null',null,null)--�����κ�һ������������Ϊnull




--ɾ��    
delete dbo.TBL_User
where UserID in (select UserID from TBL_User
group by UserID
having COUNT(*)>=2)

delete dbo.TBL_User  --Email ����Լ��Unique
where Email in (select Email from TBL_User
group by Email
having COUNT(*)>=2)

delete dbo.TBL_User  --ɾ�����е���Email��null
where Email is null

--Ψһ��
insert into dbo.TBL_BorrowInfo
Values('A563/15','20170310040','2017.04.01',null,null)--��ȷ

insert into dbo.TBL_BorrowInfo
Values('A563/15','20170310040','2017.04.01',null,null)--���󣬴�����Ψһ��

 --����
select Email,COUNT(*) from dbo.TBL_User
group by Email
having COUNT(*)>=2
