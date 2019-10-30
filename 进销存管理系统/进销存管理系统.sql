--TBL_Customer
--����
create proc InsertCustomer
@CustomerID nvarchar(6),@CustomerName nvarchar(80),@SpellingCode nvarchar(20),@Address nvarchar(80),
@ZipCode char(6),@Tel nvarchar(20),@Fax nvarchar(20),@BankName nvarchar(40),@BankAccount nvarchar(50),
@Contacter nvarchar(20),
@Email nvarchar(30)
as 
insert into dbo.TBL_Customer
values(@CustomerID,@CustomerName,@SpellingCode,@Address,@ZipCode,@Tel,@Fax,@BankName,@BankAccount,@Contacter,@Email )

--����
exec InsertCustomer '111','45224','749+93337','5411','4456','adaw','dawfa','dafa56','a4s5','a4f5a','844@qq.com'

--�޸�
go
create proc UpdateCustomer
@CustomerID nvarchar(6),@CustomerName nvarchar(80),@SpellingCode nvarchar(20),@Address nvarchar(80),
@ZipCode char(6),@Tel nvarchar(20),@Fax nvarchar(20),@BankName nvarchar(40),@BankAccount nvarchar(50),
@Contacter nvarchar(20),
@Email nvarchar(30)
as
update dbo.TBL_Customer
set CustomerID=@CustomerID,CustomerName=@CustomerName,SpellingCode=@SpellingCode,Address=@Address,ZipCode=@ZipCode,Tel =@Tel ,
Fax=@Fax,BankName=@BankName,BankAccount=@BankAccount,Contacter=@Contacter,Email=@Email
where CustomerID=@CustomerID

--����
exec UpdateCustomer '111','444','555','666','777','888','999','000','111','222','333'

--ɾ��
go
create proc DeleteCustomer
@CustomerID nvarchar(6)
as
delete dbo.TBL_Customer
where CustomerID=@CustomerID

--����
exec DeleteCustomer '111'


--��ѯһ����¼
go
create proc FindCustomerByID
@CustomerID nvarchar(6)
as
select * from dbo.TBL_Customer
where CustomerID=@CustomerID

--����
exec FindCustomerByID '111'

--��ѯ���м�¼
go
create proc SelectAllCustomer
as
select * from dbo.TBL_Customer

--����
exec SelectAllCustomer

--TBL_Supplier
--����
go
alter proc InsertSupplier
@SupplierID nvarchar(6),@SupplierName nvarchar(80),@SpellingCode nvarchar(20),@Address nvarchar(80),
@ZipCode char(6),@Tel nvarchar(20),@Fax nvarchar(20),@BankName nvarchar(40),@BankAccount nvarchar(50),
@Contacter nvarchar(20),
@Email nvarchar(30)
as 
insert into dbo.TBL_Supplier
values(@SupplierID,@SupplierName,@SpellingCode,@Address,@ZipCode,@Tel,@Fax,@BankName,@BankAccount,@Contacter,@Email )

--����
exec InsertSupplier '1111','4544','749+97','544','44566','adaw','dawfa','dafa56','a4s5','a4f5a','844@qq.com'

--�޸�
go
alter proc UpdateSupplier
@SupplierID nvarchar(6),@SupplierName nvarchar(80),@SpellingCode nvarchar(20),@Address nvarchar(80),
@ZipCode char(6),@Tel nvarchar(20),@Fax nvarchar(20),@BankName nvarchar(40),@BankAccount nvarchar(50),
@Contacter nvarchar(20),
@Email nvarchar(30)
as
update dbo.TBL_Supplier
set SupplierID= @SupplierID ,SupplierName = @SupplierName ,SpellingCode=@SpellingCode,Address=@Address,ZipCode=@ZipCode,Tel =@Tel ,
Fax=@Fax,BankName=@BankName,BankAccount=@BankAccount,Contacter=@Contacter,Email=@Email
where SupplierID=@SupplierID

--����
exec  UpdateSupplier  '1111','111','222','333','444','555','666','777','888','999','0000'

--ɾ��

go
alter proc DeleteSupplier
@SupplierID nvarchar(6)
as
delete dbo.TBL_Supplier
where SupplierID=@SupplierID

--����
exec DeleteSupplier '1111'

--��ѯһ����¼
go
alter proc FindSupplierByID
@SupplierID nvarchar(6)
as
select * from dbo.TBL_Supplier
where SupplierID=@SupplierID

--����
exec FindSupplierByID '1111'

--��ѯ���м�¼

go
create proc SelectAllSupplier
as
select * from dbo.TBL_Supplier

--����
exec SelectAllSupplier



--TBL_Employee
--����
go
create proc InsertEmployee
@EmployeeID nvarchar(6),@EmployeeName nvarchar(80),@sex bit,@Birthday datetime,
@Brief nvarchar(max)
as
insert into dbo.TBL_Employee
values(@EmployeeID,@EmployeeName,@sex,@Birthday,@Brief)

--����
exec InsertEmployee 'abbaa','25',1,'2006-1-1','dad'


--�޸�
go
create proc UpdateEmployee
@EmployeeID nvarchar(6),@EmployeeName nvarchar(80),@sex bit,@Birthday datetime,
@Brief nvarchar(max)
as
update dbo.TBL_Employee
set EmployeeID=@EmployeeID,EmployeeName=@EmployeeName,sex=@sex
,Birthday=@Birthday,Brief=@Brief
where EmployeeID=@EmployeeID

--����
exec UpdateEmployee 'abbaa','222',0,'2088-1-1','355'
--ɾ��
go
create proc DeleteEmployee
@EmployeeID nvarchar(6)
as
delete dbo.TBL_Employee
where EmployeeID=@EmployeeID

--����
exec DeleteEmployee 'abbaa'

--��ѯһ����¼
go
create proc FindEmployeeByID
@EmployeeID nvarchar(6)
as
select * from dbo.TBL_Employee
where EmployeeID=@EmployeeID

--����
exec FindEmployeeByID 'aaaaa'

--��ѯ����

go
create proc SelectAllEmployee
as
select * from dbo.TBL_Employee

--����
exec SelectAllEmployee

--TBL_Category
--����
create proc InsertCategory
@CategoryID nvarchar(6),@CategoryName nvarchar(80)
as
Insert TBL_Category
Values(@CategoryID,@CategoryName)

--����
exec InsertCategory  '200000','���ѷ���'

--�޸�����
go
create proc UpdateCategory
@CategoryID nvarchar(6),@CategoryName nvarchar(80)
as
Update TBL_Category
set CategoryID=@CategoryID,CategoryName=@CategoryName
where CategoryID=@CategoryID

--����
exec UpdateCategory '200000','������'

--ɾ��
go
create proc DeleteCategory
@CategoryID nvarchar(6)
as
Delete TBL_Category
where CategoryID=@CategoryID

--����
exec DeleteCategory '200000'

--����ID��ѯһ����¼
go
create proc FindCategoryByID
@CategoryID nvarchar(6)
as
select *
from TBL_Category
where CategoryID=@CategoryID

--����
exec FindCategoryByID '200000'

--��ѯ���м�¼
go
alter proc SelectAllCategory
as
select *
from TBL_Category

--����
exec SelectAllCategory 


--TBL_Product
--����
go
create proc InsertProduct
@ProductID nvarchar(6)
,@ProcductName nvarchar(80)
,@SpellingCode nvarchar(40)
,@Barcode nvarchar(14)
,@Special nvarchar(40)
,@Unit nvarchar (6)
,@Origin nvarchar(50)
,@CategoryID nvarchar(6)
,@PurchasePrice decimal (18,2)
,@SalePrice decimal (18,2)
,@Quantity int
as
Insert TBL_Product
Values(@ProductID,@ProcductName,@SpellingCode,
@Barcode,@Special,@Unit,
@Origin,@CategoryID,@PurchasePrice,
@SalePrice,@Quantity)

--����
exec InsertProduct '2121','���Ѵ�','juexingdafa','2333323223','������','��','����','0000',2385.55,68988.55,100

--�޸�
go
create proc UpdateProduct
@ProductID nvarchar(6)
,@ProductName nvarchar(80)
,@SpellingCode nvarchar(40)
,@Barcode nvarchar(14)
,@Special nvarchar(40)
,@Unit nvarchar (6)
,@Origin nvarchar(50)
,@CategoryID nvarchar(6)
,@PurchasePrice decimal (18,2)
,@SalePrice decimal (18,2)
,@Quantity int
as
Update TBL_Product
set ProductID=@ProductID,ProductName=@ProductName,
SpellingCode=@SpellingCode,Barcode=@Barcode,
Special=@Special,Unit=@Unit,Origin=@Origin,CategoryID=@CategoryID,
PurchasePrice=@PurchasePrice,SalePrice=@SalePrice,Quantity=@Quantity
where ProductID=@ProductID

--����
exec UpdateProduct '21112','���Ѵ󷨺�','juexingdafahao','3323223','������','��','����','0000',2385.55,68988.55,100

--ɾ��
go
create proc DeleteProduct
@ProductID nvarchar(6)
as
Delete TBL_Product
where ProductID=@ProductID

--����
exec DeleteProduct '2121'

--����ID��ѯһ����¼
go
create proc FindProductByID
@ProductID nvarchar(6)
as
select *
from TBL_Product
where ProductID=@ProductID

--����
exec FindProductByID '2121'

--��ѯ���м�¼
go
create proc SleectAllProduct
as
select *
from TBL_Product

--����
exec SleectAllProduct 