<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasicAuthenticationInJquery.aspx.cs" Inherits="EmployeeService.BasicAuthenticationInJquery" %>

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
                // Get the username & password from textboxes
                var username = $('#txtUsername').val();
                var password = $('#txtPassword').val();

                $.ajax({
                    type: 'GET',
                    // Make sure to change the port number to
                    // where you have the employee service
                    // running on your local machine
                    url: 'http://localhost:35171/api/Employees',
                    dataType: 'json',
                    // Specify the authentication header
                    // btoa() method encodes a string to Base64
                    headers: {
                        'Authorization': 'Basic ' + btoa(username + ':' + password)
                    },
                    success: function (data) {
                        ulEmployees.empty();
                        $.each(data, function (index, val) {
                            var fullName = val.FirstName + ' ' + val.LastName;
                            ulEmployees.append('<li>' + fullName + ' (' + val.Gender + ')</li>')
                        });
                    },
                    complete: function (jqXHR) {
                        if (jqXHR.status == '401') {
                            ulEmployees.empty();
                            ulEmployees.append('<li style="color:red">'
                                + jqXHR.status + ' : ' + jqXHR.statusText + '</li>')
                        }
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
            Username : <input type="text" id="txtUsername" />
            Password : <input type="password" id="txtPassword" />
            <br /><br />
            <input id="btn" type="button" value="Authenticate and Get Employees" />
            <input id="btnClear" type="button" value="Clear" />
            <ul id="ulEmployees"></ul>
        </div>
    </form>
</body>
</html>