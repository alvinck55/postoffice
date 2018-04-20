﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tracking.aspx.cs" Inherits="POSTOFFICE3.Tracking" %>

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
            <asp:Label ID="Label1" runat="server" Text="Track"></asp:Label>
        </p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="PostOffice">
            <Columns>
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="PostOffice" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT ADDRESS.City, ADDRESS.State
FROM ADDRESS, FACILITY, SHIPPING_HISTORY
WHERE ADDRESS.Address_ID = FACILITY.Address_ID AND FACILITY.Facility_ID = SHIPPING_HISTORY.Facility_ID AND SHIPPING_HISTORY.Tracking_no = @Tracking_No">
            <SelectParameters>
                <asp:ControlParameter ControlID="TrackingNumberTextBox" Name="Tracking_No" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>