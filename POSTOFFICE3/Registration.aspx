<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="POSTOFFICE3.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register an Account</title>
</head>
<body>
    <p>This is the registration page</p>
    <a href="Home.aspx">Home</a>
    <form id="form1" runat="server">
        <div>
            
            <p>First name: </p>
            <asp:TextBox ID="firstNameText" Text="" runat="server" />
            <p>Middle name: </p>
            <asp:TextBox ID="middleNameText" Text="" runat="server" />
            <p>Last name: </p>
            <asp:TextBox ID="lastNameText" Text="" runat="server" />
            <p>Email: </p>
            <asp:TextBox ID="emailText" Text="" runat="server" />
            <p>Phone number: </p>
            <asp:TextBox ID="phoneText" Text="" runat="server" />
            <p>Alternate Phone number(optional): </p>
            <asp:TextBox ID="phone2Text" Text="" runat="server" />
            <p>Password: </p>
            <asp:TextBox ID="passwordText" Text="" runat="server" />
            <p>Confirm Password: </p>
            <asp:TextBox ID="password2Text" Text="" runat="server" />
            <p></p>
            <asp:Label ID="statusMessage" Text="Please enter information in all fields" runat="server" />
            <asp:Button ID="registerButton" Text="Register Account" runat="server"  OnClick="registerEventMethod"/>



        </div>
        
    </form>
</body>
</html>
