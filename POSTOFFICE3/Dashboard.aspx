<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="POSTOFFICE3.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Post Office Dashboard</h1>
        <div>
            <asp:Label ID="lblUserDetails" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <a href="UpdateAddress.aspx">Update Address</a>
            <br />
            <a href="ShippingHistory.aspx">Shipping History</a>
            <br />
            <a href="Tracking.aspx">Track a Package</a>
            <br />
            <a href="PackageEntry.aspx">Create a Shipping Label</a>
            <br />
            <a href="SearchPackage.aspx">Search your packages</a><br />
&nbsp;<br />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
