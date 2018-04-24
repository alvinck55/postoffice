<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAddress.aspx.cs" Inherits="POSTOFFICE3.AddAddress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                    <asp:BoundField DataField="aptn" HeaderText="aptn" SortExpression="aptn" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT ADDRESS.Street, ADDRESS.State, ADDRESS.City, ADDRESS.Zip, ADDRESS.aptn FROM ADDRESS WHERE ADDRESS.Address_ID in (SELECT CUSTOMER_ADDRESS.Address_ID FROM CUSTOMER_ADDRESS WHERE CUSTOMER_ADDRESS.Customer_ID = @customerid)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="customerid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
