<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="POSTOFFICE3.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register an Account</title>
      <link href="css/bootstrap.css" rel="stylesheet" />

</head>
<body>
    
    <form id="form1" runat="server">
        <div class="col-md-4">
            <p>This is the registration page</p>
            <a href="Home.aspx">Home</a>
            <p>First name: </p>
            <asp:TextBox ID="firstNameText" Text="" CssClass="form-control" runat="server" />
            <p>Middle name: </p>
            <asp:TextBox ID="middleNameText" Text="" CssClass="form-control" runat="server" />
            <p>Last name: </p>
            <asp:TextBox ID="lastNameText" Text="" CssClass="form-control" runat="server" />
            <p>Email: </p>
            <asp:TextBox ID="emailText" Text="" CssClass="form-control" runat="server" />
            <p>Phone number: </p>
            <asp:TextBox ID="phoneText" Text="" CssClass="form-control" runat="server" />
            <p>Alternate Phone number(optional): </p>
            <asp:TextBox ID="phone2Text" Text="" CssClass="form-control" runat="server" />
            <p>Password: </p>
            <asp:TextBox ID="passwordText" Text="" CssClass="form-control" TextMode ="Password" runat="server" />
            <p>Confirm Password: </p>
            <asp:TextBox ID="password2Text" Text="" CssClass="form-control" TextMode ="Password" runat="server" />
            <p></p>
            <asp:Label ID="statusMessage" Text="Please enter information in all fields" runat="server" />
            <asp:Button ID="registerButton" Text="Register Account" runat="server" CssClass="btn btn-dark" OnClick="registerEventMethod"/>



        </div>
        
    </form>
</body>
</html>
