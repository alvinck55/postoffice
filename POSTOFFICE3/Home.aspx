<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="POSTOFFICE3.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to the Post Office Database</title>
    <style>
        body {
            
            font-family:Helvetica;

        }

    </style>
</head>
<body>
    
    <form id="form1" runat="server">
        <div>
           
            <p>Username: </p>
            <asp:TextBox ID="usernameText" Text="" runat="server" />
            <p>Password: </p>
            <asp:TextBox ID="passwordText" Text="Enter password here" TextMode ="Password" runat="server" />
            <asp:Button ID="submitButton" Text="Sign in" runat="server"  OnClick="submitEventMethod"/>
            <asp:Label ID="statusMessage" Text="Please enter username and password" runat="server" />
               


        </div>
    </form>
    <a href="Data.aspx">Data | </a><a href="Registration.aspx">Registration</a>  
</body>
</html>
