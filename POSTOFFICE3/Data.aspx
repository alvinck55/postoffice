<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Data.aspx.cs" Inherits="POSTOFFICE3.Data" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter Customer ID:<br />
            <asp:TextBox ID="customeridTextBox" runat="server"></asp:TextBox>
            <asp:Button ID="searchButton" runat="server" OnClick="SearchButton_Click" Text="Search" />
        </div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Street" DataValueField="Address_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="83px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT * FROM ADDRESS WHERE ADDRESS.State = 'TX'"></asp:SqlDataSource>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
