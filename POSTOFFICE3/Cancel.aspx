<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cancel.aspx.cs" Inherits="POSTOFFICE3.Cancel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="css/bootstrap.css" rel="stylesheet" />

    <title>Cancel a Package</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Cancel a Package</h1>
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        Packages in Transit:<br />
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Package_ID" DataSourceID="SqlDataSource1" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="Package_ID" HeaderText="Package_ID" InsertVisible="False" ReadOnly="True" SortExpression="Package_ID" />
                    <asp:BoundField DataField="Tracking_no" HeaderText="Tracking_no" SortExpression="Tracking_no" />
                    <asp:BoundField DataField="Last_updated" HeaderText="Last_updated" SortExpression="Last_updated" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT p.Package_ID, p.Tracking_no, p.Last_updated, t.Status
FROM PACKAGE p, TRACKING t, CUSTOMER c
WHERE p.Sender_ID = t.Sender_ID
AND p.Package_ID = t.Package_ID
AND t.Status &lt;&gt; 'D'
AND t.Status &lt;&gt; 'R'
AND p.Sender_ID=c.Customer_ID
AND c.Customer_ID=@customerid;

">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="customerid" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        </br>
        <a href="Dashboard.aspx">Dashboard</a>
    </form>
</body>
</html>
