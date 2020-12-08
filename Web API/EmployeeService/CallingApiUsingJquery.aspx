<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CallingApiUsingJquery.aspx.cs" Inherits="EmployeeService.CallingApiUsingJquery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var ulEmployees = $('#ulEmployees');
            $('#btn').click(function () {
                $.ajax({
                    type: 'GET',
                    url: "api/employees/",
                    dataType: 'json',
                    success: function (data) {
                        ulEmployees.empty();
                        $.each(data, function (index, val) {
                            var fullName = val.FirstName + ' ' + val.LastName;
                            ulEmployees.append('<li>' + fullName + '</li>');
                        });
                    }
                });
            });
            $('#btnClear').click(function () {
                ulEmployees.empty();
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input id="btn" type="button" value="Get All Employees" />
        <input id="btnClear" type="button" value="Clear" />
        <ul id="ulEmployees" />
        </div>
    </form>
</body>
</html>



<%--SQL SERVER COMMAND

Create Database EmployeeDB
Go

Use EmployeeDB
Go

Create table Employees
(
ID int primary key identity,
FirstName nvarchar(50),
LastName nvarchar(50),
Gender nvarchar(50),
Salary int
)
Go

Insert into Employees values ('Mark', 'Hastings', 'Male', 60000)
Insert into Employees values ('Steve', 'Pound', 'Male', 45000)
Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000)
Insert into Employees values ('Philip', 'Hastings', 'Male', 45000)
Insert into Employees values ('Mary', 'Lambeth', 'Female', 30000)
Insert into Employees values ('Valarie', 'Vikings', 'Female', 35000)
Insert into Employees values ('John', 'Stanmore', 'Male', 80000)
Go



Use EmployeeDB
Go

Create Table Users
(
Id int identity primary key,
Username nvarchar(100),
Password nvarchar(100)
)

Insert into Users values ('male','male')
Insert into Users values ('female','female') --%>