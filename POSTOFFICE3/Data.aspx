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
            <asp:Button ID="searchButton" runat="server" OnClick="searchButton_Click" Text="Search" />
        </div>
    </form>
</body>
</html>
