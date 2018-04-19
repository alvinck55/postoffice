<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="POSTOFFICE3.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Post Office Database</title>
</head>
<body>
    <p>Welcome to the Post Office Database Portal</p>
    <a href="#">Home</a>  |  <a href="Registration.aspx">Registration</a>

    <form id="form1" runat="server">
        <div>
            <p>Username: </p>
            <asp:TextBox ID="usernameText" Text="Enter username here" runat="server" />
            <p>Password: </p>
            <asp:TextBox ID="passwordText" Text="Enter password here" runat="server" />
            <asp:Button ID="submitButton" Text="Sign in" runat="server"  OnClick="submitEventMethod"/>

        </div>
    </form>
</body>
</html>
