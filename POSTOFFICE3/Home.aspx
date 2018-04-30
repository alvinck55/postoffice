<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="POSTOFFICE3.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to the Post Office Database</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <style>
        body {
            
            font-family:Helvetica;

        }

    </style>
</head>
<body>
    
    <form id="form1" runat="server">
        <div>
            <div class="container-fluid">
                <div class ="jumbotron" style="border:2px solid aquamarine; box-shadow:1px 2px 5px #ccc">
                    <h1>Welcome to the Post Office Database.</h1>
                </div>
            </div>
            <div class="col-md-4">
                <p>Username: </p>
                <asp:TextBox ID="usernameText" Text="" CssClass="form-control" runat="server"/>
                <p>Password: </p>
                <asp:TextBox ID="passwordText" Text="Enter password here" CssClass="form-control" TextMode ="Password" runat="server" />
                <p></p>
                <asp:Button ID="submitButton" Text="Sign in" runat="server" CssClass="btn btn-primary" OnClick="submitEventMethod"/>
                <p></p>
                <asp:Label ID="statusMessage" Text="Please enter username and password" runat="server" />
                <p></p>
                <a href="Registration.aspx">Registration</a> 
                <p></p>
                <a href="Tracking.aspx" class="btn btn-primary btn-lg active" role="button">Track a Package</a>

            </div>


        </div>
    </form>
     
</body>
</html>
