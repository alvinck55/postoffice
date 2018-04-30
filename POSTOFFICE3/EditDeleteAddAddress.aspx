<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditDeleteAddAddress.aspx.cs" Inherits="POSTOFFICE3.AddAddress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="css/bootstrap.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-dark" style="background-color: #471268">
              <a class="navbar-brand navbar-left" href="Dashboard.aspx">Dashboard</a>
            <asp:Label ID="loggedin" Text="" class="navbar-text navbar-center" runat="server" />

          
            <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-danger" OnClick="btnLogout_Click" />

        </nav>
        <h1>Add,Edit,Or Delete Addresses</h1>
        <p>
            <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary btn-lg" style="font-size: x-large" PostBackUrl="AddAddress.aspx">Add a new address</asp:LinkButton>
        </p>
        <p>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="Address_ID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                     <asp:BoundField DataField="Address_ID" HeaderText="Address_ID"  InsertVisible="False" ReadOnly="True" SortExpression="Address_ID" Visible="False" />
                    <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                    <asp:BoundField DataField="aptn" HeaderText="aptn" SortExpression="aptn" />
                    <asp:CommandField ShowEditButton="True" />
                     <asp:CommandField ShowDeleteButton="True" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" DeleteCommand="DELETE FROM [CUSTOMER_ADDRESS] WHERE [Address_ID] = @Address_ID AND [Customer_ID] = @Customer_ID" SelectCommand="SELECT ADDRESS.Address_ID, ADDRESS.Street, ADDRESS.State, ADDRESS.City, ADDRESS.Zip, ADDRESS.aptn FROM ADDRESS WHERE ADDRESS.Address_ID in (SELECT CUSTOMER_ADDRESS.Address_ID FROM CUSTOMER_ADDRESS WHERE CUSTOMER_ADDRESS.Customer_ID = @customerid)" UpdateCommand= "UPDATE [ADDRESS] SET [Street] = @Street, [City] = @City, [State] = @State, [Zip] = @Zip, [aptn] = @aptn WHERE [Address_ID] = @Address_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Address_ID" Type="Int32" />
                    <asp:SessionParameter Name="Customer_ID" SessionField="customer_id" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="customerid" SessionField="customer_id" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Street" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zip" Type="Decimal" />
                    <asp:Parameter Name="aptn" Type="Int32" />
                    <asp:Parameter Name="Address_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <p>
          
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
