<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="POSTOFFICE3.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link href="css/bootstrap.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
      
        <nav class="navbar navbar-dark" style="background-color: #471268">
              <a class="navbar-brand navbar-left" href="Dashboard.aspx">Dashboard</a>
            <asp:Label ID="loggedin" Text="" class="navbar-text navbar-center" runat="server" />

          
            <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-danger" OnClick="btnLogout_Click" />

        </nav>
        <div class="container-fluid">
       
        
        <div class="col-md-4">
            
            <br />
            <br />
            <a href="UpdateAddress.aspx" class="btn btn-primary btn-sm btn-block" role="button">Update Primary Address</a>
            <br />
            <a href="EditDeleteAddAddress.aspx" class="btn btn-primary btn-sm btn-block" role="button">View/Edit Addresses</a>
            
            <br />
            <a href="ShippingHistory.aspx" class="btn btn-primary btn-sm btn-block" role="button">Shipping History</a>
            <br />
            <a href="Tracking.aspx" class="btn btn-primary btn-sm btn-block" role="button">Track a Package</a>
            <br />
            <a href="PackageEntry.aspx" class="btn btn-primary btn-sm btn-block" role="button">Create a Shipping Label</a>
            <br />
            <a href="SearchPackage.aspx" class="btn btn-primary btn-sm  btn-block" role="button">Search your packages</a><br />
            <a href="CustomerAddressSearch.aspx" class="btn btn-primary btn-sm btn-block" role="button">Address Shipping History</a><br />
            <a href="Cancel.aspx" class="btn btn-primary btn-sm btn-block" role="button">Cancel a Package</a><br />
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Tracking_no" HeaderText="Tracking Number" SortExpression="Tracking_no" />
                    <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                    <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                    <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
                    <asp:BoundField DataField="Receiver_Fname" HeaderText="Receiver First Name" SortExpression="Receiver_Fname" />
                    <asp:BoundField DataField="Receiver_Lname" HeaderText="Receiver Last Name" SortExpression="Receiver_Lname" />
                    <asp:BoundField DataField="Street" HeaderText="Receiver Address" SortExpression="Street" />
                    <asp:BoundField DataField="State" HeaderText="Receiver State" SortExpression="State" />
                    <asp:BoundField DataField="City" HeaderText="Receiver City" SortExpression="City" />
                    <asp:BoundField DataField="Zip" HeaderText="Receiver Zip" SortExpression="Zip" />
                    
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:BoundField DataField="Last_updated" HeaderText="Date Sent" SortExpression="Last_updated" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT  p.Tracking_no, p.Cost,p.Weight,p.Priority,p.Receiver_Fname,p.Receiver_Lname,a.Street,a.State,a.City,a.Zip,t.Status, p.Last_updated
FROM PACKAGE p, TRACKING t, CUSTOMER c,ADDRESS a
WHERE p.Sender_ID = t.Sender_ID
AND p.Package_ID = t.Package_ID
AND a.Address_ID = p.Receiver_Address_ID
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
            </div>
    </form>
</body>
</html>
