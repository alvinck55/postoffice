<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAddress.aspx.cs" Inherits="POSTOFFICE3.AddAddress1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="css/bootstrap.css" rel="stylesheet" />

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-dark" style="background-color: #471268">
              <a class="navbar-brand navbar-left" href="Dashboard.aspx">Dashboard</a>
            <asp:Label ID="loggedin" Text="" class="navbar-text navbar-center" runat="server" />

          
            <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-danger" OnClick="btnLogout_Click" />

        </nav>
        <div class="col-md-4">
            <br />
            <h1>New Address</h1><br />
            <br />
            Street:<asp:TextBox ID="Street_TextBox" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            APT#(Optional):
            <asp:TextBox ID="Apt_TextBox" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            City:<asp:TextBox ID="City_TextBox" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            State:<asp:DropDownList ID="DropDownList1" Class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="State" DataValueField="State_ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT [State], [State_ID] FROM [STATE]"></asp:SqlDataSource>
            <br />
            Zip:<asp:TextBox ID="Zip_TextBox" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            Postal Code(Optional):
            <asp:TextBox ID="PostalCode_TextBox" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
        </div>
        <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Submit" OnClick="Button1_Click" />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br />
        <br />
        </form>
</body>
</html>
