<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShippingHistory.aspx.cs" Inherits="POSTOFFICE3.ShippingHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shipping History</title>
        <link href="css/bootstrap.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-dark" style="background-color: #471268">
              <a class="navbar-brand navbar-left" href="Dashboard.aspx">Dashboard</a>
            <asp:Label ID="loggedin" Text="" class="navbar-text navbar-center" runat="server" />

          
            <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-danger" OnClick="btnLogout_Click" />

        </nav>
        <h1>Post Office Shipping History</h1>
        <asp:Label ID="logText" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <div>
            Select Time Period:<br />
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="-30">Last 30 days</asp:ListItem>
            <asp:ListItem Value="-60">Last 60 days</asp:ListItem>
            <asp:ListItem Value="-90">Last 90 days</asp:ListItem>
            <asp:ListItem Value="-999">All</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT         p.Tracking_no, t.Type, p.Weight, r.Priority,a.Street,a.City,a.Zip,a.State, p.Last_updated
            FROM PACKAGE p, CUSTOMER c, TYPE t, PRIORITY r,ADDRESS a
            WHERE p.Last_updated &gt;= DATEADD(day,@days, getdate())
            AND p.Sender_ID=c.Customer_ID
            AND a.Address_ID = p.Sender_Address_ID
            AND c.Customer_ID=@customerid
            AND p.Types = t.Type_ID
            AND p.Priority = r.Priority_ID
ORDER BY p.Last_updated DESC
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="days" PropertyName="SelectedValue" Type="Int32" DefaultValue="-30"/>
                <asp:ControlParameter ControlID="TextBox1" Name="customerid" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <strong>Shipping Information:</strong></p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="Tracking_no" HeaderText="Tracking_no" SortExpression="Tracking_no" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
                <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="Last_updated" HeaderText="Last_updated" SortExpression="Last_updated" />
            </Columns>
        </asp:GridView>
        <br />
    </form>
  
</body>
</html>
