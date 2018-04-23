<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDashboard.aspx.cs" Inherits="POSTOFFICE3.EmployeeDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <a href="UpdatePackage.aspx">Update a Package Location/Status</a><br />
            <a href="UpdateFacilityTraffic.aspx">View all package traffic at facility</a><br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Logout" OnClick="Button1_Click" style="height: 26px" />
            <br />
        </div>
    </form>
</body>
</html>
