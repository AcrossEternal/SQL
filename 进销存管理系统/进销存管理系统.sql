--TBL_Customer
--插入
create proc InsertCustomer
@CustomerID nvarchar(6),@CustomerName nvarchar(80),@SpellingCode nvarchar(20),@Address nvarchar(80),
@ZipCode char(6),@Tel nvarchar(20),@Fax nvarchar(20),@BankName nvarchar(40),@BankAccount nvarchar(50),
@Contacter nvarchar(20),
@Email nvarchar(30)
as 
insert into dbo.TBL_Customer
values(@CustomerID,@CustomerName,@SpellingCode,@Address,@ZipCode,@Tel,@Fax,@BankName,@BankAccount,@Contacter,@Email )

--测试
exec InsertCustomer '111','45224','749+93337','5411','4456','adaw','dawfa','dafa56','a4s5','a4f5a','844@qq.com'

--修改
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

--测试
exec UpdateCustomer '111','444','555','666','777','888','999','000','111','222','333'

--删除
go
create proc DeleteCustomer
@CustomerID nvarchar(6)
as
delete dbo.TBL_Customer
where CustomerID=@CustomerID

--测试
exec DeleteCustomer '111'


--查询一条记录
go
create proc FindCustomerByID
@CustomerID nvarchar(6)
as
select * from dbo.TBL_Customer
where CustomerID=@CustomerID

--测试
exec FindCustomerByID '111'

--查询所有记录
go
create proc SelectAllCustomer
as
select * from dbo.TBL_Customer

--测试
exec SelectAllCustomer

--TBL_Supplier
--插入
go
alter proc InsertSupplier
@SupplierID nvarchar(6),@SupplierName nvarchar(80),@SpellingCode nvarchar(20),@Address nvarchar(80),
@ZipCode char(6),@Tel nvarchar(20),@Fax nvarchar(20),@BankName nvarchar(40),@BankAccount nvarchar(50),
@Contacter nvarchar(20),
@Email nvarchar(30)
as 
insert into dbo.TBL_Supplier
values(@SupplierID,@SupplierName,@SpellingCode,@Address,@ZipCode,@Tel,@Fax,@BankName,@BankAccount,@Contacter,@Email )

--测试
exec InsertSupplier '1111','4544','749+97','544','44566','adaw','dawfa','dafa56','a4s5','a4f5a','844@qq.com'

--修改
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

--测试
exec  UpdateSupplier  '1111','111','222','333','444','555','666','777','888','999','0000'

--删除

go
alter proc DeleteSupplier
@SupplierID nvarchar(6)
as
delete dbo.TBL_Supplier
where SupplierID=@SupplierID

--测试
exec DeleteSupplier '1111'

--查询一条记录
go
alter proc FindSupplierByID
@SupplierID nvarchar(6)
as
select * from dbo.TBL_Supplier
where SupplierID=@SupplierID

--测试
exec FindSupplierByID '1111'

--查询所有记录

go
create proc SelectAllSupplier
as
select * from dbo.TBL_Supplier

--测试
exec SelectAllSupplier



--TBL_Employee
--插入
go
create proc InsertEmployee
@EmployeeID nvarchar(6),@EmployeeName nvarchar(80),@sex bit,@Birthday datetime,
@Brief nvarchar(max)
as
insert into dbo.TBL_Employee
values(@EmployeeID,@EmployeeName,@sex,@Birthday,@Brief)

--测试
exec InsertEmployee 'abbaa','25',1,'2006-1-1','dad'


--修改
go
create proc UpdateEmployee
@EmployeeID nvarchar(6),@EmployeeName nvarchar(80),@sex bit,@Birthday datetime,
@Brief nvarchar(max)
as
update dbo.TBL_Employee
set EmployeeID=@EmployeeID,EmployeeName=@EmployeeName,sex=@sex
,Birthday=@Birthday,Brief=@Brief
where EmployeeID=@EmployeeID

--测试
exec UpdateEmployee 'abbaa','222',0,'2088-1-1','355'
--删除
go
create proc DeleteEmployee
@EmployeeID nvarchar(6)
as
delete dbo.TBL_Employee
where EmployeeID=@EmployeeID

--测试
exec DeleteEmployee 'abbaa'

--查询一条记录
go
create proc FindEmployeeByID
@EmployeeID nvarchar(6)
as
select * from dbo.TBL_Employee
where EmployeeID=@EmployeeID

--测试
exec FindEmployeeByID 'aaaaa'

--查询所有

go
create proc SelectAllEmployee
as
select * from dbo.TBL_Employee

--测试
exec SelectAllEmployee

--TBL_Category
--插入
create proc InsertCategory
@CategoryID nvarchar(6),@CategoryName nvarchar(80)
as
Insert TBL_Category
Values(@CategoryID,@CategoryName)

--测试
exec InsertCategory  '200000','觉醒方案'

--修改数据
go
create proc UpdateCategory
@CategoryID nvarchar(6),@CategoryName nvarchar(80)
as
Update TBL_Category
set CategoryID=@CategoryID,CategoryName=@CategoryName
where CategoryID=@CategoryID

--测试
exec UpdateCategory '200000','觉醒类'

--删除
go
create proc DeleteCategory
@CategoryID nvarchar(6)
as
Delete TBL_Category
where CategoryID=@CategoryID

--测试
exec DeleteCategory '200000'

--根据ID查询一条记录
go
create proc FindCategoryByID
@CategoryID nvarchar(6)
as
select *
from TBL_Category
where CategoryID=@CategoryID

--测试
exec FindCategoryByID '200000'

--查询所有记录
go
alter proc SelectAllCategory
as
select *
from TBL_Category

--测试
exec SelectAllCategory 


--TBL_Product
--插入
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

--测试
exec InsertProduct '2121','觉醒大法','juexingdafa','2333323223','觉醒类','米','桂林','0000',2385.55,68988.55,100

--修改
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

--测试
exec UpdateProduct '21112','觉醒大法好','juexingdafahao','3323223','觉醒类','米','桂林','0000',2385.55,68988.55,100

--删除
go
create proc DeleteProduct
@ProductID nvarchar(6)
as
Delete TBL_Product
where ProductID=@ProductID

--测试
exec DeleteProduct '2121'

--根据ID查询一条记录
go
create proc FindProductByID
@ProductID nvarchar(6)
as
select *
from TBL_Product
where ProductID=@ProductID

--测试
exec FindProductByID '2121'

--查询所有记录
go
create proc SleectAllProduct
as
select *
from TBL_Product

--测试
exec SleectAllProduct 