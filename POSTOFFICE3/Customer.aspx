<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="POSTOFFICE3.customerSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        First name: <asp:TextBox ID="fName" runat="server"></asp:TextBox><br />
        Middle initial: <asp:TextBox ID="mInit" runat="server"></asp:TextBox><br />
        Last name: <asp:TextBox ID="lName" runat="server"></asp:TextBox><br />
        Email address: <asp:TextBox ID="email" runat="server"></asp:TextBox><br />
        Phone number: <asp:TextBox ID="phone" runat="server"></asp:TextBox><br />
        Street address: <asp:TextBox ID="street" runat="server"></asp:TextBox><br />
        City: <asp:TextBox ID="city" runat="server"></asp:TextBox><br />
        State: <asp:TextBox ID="state" runat="server"></asp:TextBox><br />
        ZIP: <asp:TextBox ID="zip" runat="server"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" OnClick="customerSearch_Click" Text="Search" />
        <p>
            <asp:Label ID="Label1" runat="server" Text="Search"></asp:Label>
        </p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="PostOffice">
            <Columns>
                <asp:BoundField DataField="Fname" HeaderText="First name" SortExpression="Fname" />
                <asp:BoundField DataField="Minit" HeaderText="Middle initial" SortExpression="Minit" />
                <asp:BoundField DataField="Lname" HeaderText="Last name" SortExpression="Lname" />
                <asp:BoundField DataField="Email" HeaderText="Email address" SortExpression="Email" />
                <asp:BoundField DataField="Phone1" HeaderText="Phone" SortExpression="Phone1" />
                <asp:BoundField DataField="Phone2" HeaderText="Alternate phone" SortExpression="Phone2" />
                <asp:BoundField DataField="Street" HeaderText="Street address" SortExpression="Street" />
                <asp:BoundField DataField="aptn" HeaderText="Unit number" SortExpression="aptn" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="Zip" HeaderText="ZIP" SortExpression="Zip" />
                <asp:BoundField DataField="Postal_code" HeaderText="Postal code" SortExpression="Postal_code" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="PostOffice" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT CUSTOMER.Fname, CUSTOMER.Minit, CUSTOMER.Lname, CUSTOMER.Email, CUSTOMER.Phone1, CUSTOMER.Phone2, ADDRESS.Street, ADDRESS.City, ADDRESS.State, ADDRESS.Zip, ADDRESS.aptn, ADDRESS.Postal_code
FROM ADDRESS, CUSTOMER
WHERE ADDRESS.Address_ID = CUSTOMER.Address_ID AND CUSTOMER.Customer_ID = @CustId">
            <SelectParameters>
                <asp:ControlParameter ControlID="fName" Name="Fname" PropertyName="Text" />
                <asp:ControlParameter ControlID="mInit" Name="Minit" PropertyName="Text" />
                <asp:ControlParameter ControlID="lName" Name="Lname" PropertyName="Text" />
                <asp:ControlParameter ControlID="email" Name="Email" PropertyName="Text" />
                <asp:ControlParameter ControlID="phone" Name="Phone" PropertyName="Text" />
                <asp:ControlParameter ControlID="street" Name="Street" PropertyName="Text" />
                <asp:ControlParameter ControlID="city" Name="City" PropertyName="Text" />
                <asp:ControlParameter ControlID="state" Name="State" PropertyName="Text" />
                <asp:ControlParameter ControlID="zip" Name="Zip" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
