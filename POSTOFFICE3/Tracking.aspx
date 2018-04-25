<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tracking.aspx.cs" Inherits="POSTOFFICE3.Tracking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tracking</title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Post Office Tracking</h1>
        <asp:Label ID="logText" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <div>
            Enter Tracking Number:<br />
        </div>
        <asp:TextBox ID="TrackingNumberTextBox" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="TrackPackage_Click" Text="Track" />
        <br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <span class="auto-style1">Package &amp; Tracking Information</span><br />
        <br />
        <span class="auto-style2"><strong>Package Information:</strong></span><br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="PackageSource">
            <Columns>
                <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="PackageSource" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT PACKAGE.Weight, TYPE.Type, PRIORITY.Priority
FROM PACKAGE,TYPE,PRIORITY
WHERE PACKAGE.Tracking_no = @Tracking_no AND PACKAGE.Priority = PRIORITY.Priority_ID AND PACKAGE.Types = TYPE.Type_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="TrackingNumberTextBox" Name="Tracking_no" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            &nbsp;</p>
        <p class="auto-style2">
            <strong>Tracking Information:</strong></p>
        <p>
            <span class="auto-style2">DESTINATION ADDRESS:</span>&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style2">ESTIMATED DELIVERY DATE:</span>&nbsp;&nbsp;
            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
        </p>
        <p>
            <span class="auto-style2">CURRENT STATUS</span>:
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="PostOffice">
            <Columns>
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                <asp:BoundField DataField="Last_updated" HeaderText="Date &amp; Time" SortExpression="Last_updated" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="PostOffice" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT ADDRESS.City, ADDRESS.State,ADDRESS.Zip, SHIPPING_HISTORY.Last_updated, STATUS.Status
FROM ADDRESS, FACILITY, SHIPPING_HISTORY, STATUS
WHERE ADDRESS.Address_ID = FACILITY.Address_ID AND FACILITY.Facility_ID = SHIPPING_HISTORY.Facility_ID AND SHIPPING_HISTORY.Status = STATUS.Status_ID AND SHIPPING_HISTORY.Tracking_no = @Tracking_No ORDER BY SHIPPING_HISTORY.Last_updated DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="TrackingNumberTextBox" Name="Tracking_No" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    </form>

</body>
</html>
