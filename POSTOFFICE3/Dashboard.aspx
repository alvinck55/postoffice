<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="POSTOFFICE3.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Post Office Dashboard&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
            </h1>
        <div>
            <asp:Label ID="lblUserDetails" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <a href="UpdateAddress.aspx">Update Primary Address</a>
            <br />
            <a href="EditDeleteAddAddress.aspx">View/Edit Addresses</a>
            
            <br />
            <a href="ShippingHistory.aspx">Shipping History</a>
            <br />
            <a href="Tracking.aspx">Track a Package</a>
            <br />
            <a href="PackageEntry.aspx">Create a Shipping Label</a>
            <br />
            <a href="SearchPackage.aspx">Search your packages</a><br />
            <a href="CustomerAddressSearch.aspx">Address Shipping History</a> <br />
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Tracking_no" HeaderText="Tracking Number" SortExpression="Tracking_no" />
                    <asp:BoundField DataField="Last_updated" HeaderText="Last Updated" SortExpression="Last_updated" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT  p.Tracking_no, p.Last_updated, t.Status
FROM PACKAGE p, TRACKING t, CUSTOMER c
WHERE p.Sender_ID = t.Sender_ID
AND p.Package_ID = t.Package_ID
AND t.Status &lt;&gt; 'D'
AND t.Status &lt;&gt; 'R'
AND p.Sender_ID=c.Customer_ID
AND c.Customer_ID=@customerid
ORDER by p.Last_updated DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="customerid" SessionField="customer_id" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
&nbsp;<br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
