<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShippingHistory.aspx.cs" Inherits="POSTOFFICE3.ShippingHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shipping History</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            From Date<br />
        </div>
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        <br />
        <br />
        To Date<br />
        <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="30">Last 30 days</asp:ListItem>
            <asp:ListItem Value="60">Lasy 60 days</asp:ListItem>
            <asp:ListItem Value="90">Last 90 days</asp:ListItem>
            <asp:ListItem>Custom</asp:ListItem>
        </asp:DropDownList>
    </form>
</body>
</html>
