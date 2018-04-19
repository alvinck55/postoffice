<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tracking.aspx.cs" Inherits="POSTOFFICE3.Tracking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter Tracking Number:<br />
        </div>
        <asp:TextBox ID="TrackingNumberTextBox" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="TrackPackage_Click" Text="Track" />
        <p>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </p>
    </form>
</body>
</html>
