<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Facilities.aspx.cs" Inherits="POSTOFFICE3.ZipSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter ZIP code:<br />
        </div>
        <asp:TextBox ID="zipBox" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="zipSearch_Click" Text="Search" />
        <p>
            <asp:Label ID="Label1" runat="server" Text="Search"></asp:Label>
        </p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="PostOffice">
            <Columns>
                <asp:BoundField DataField="Facility_ID" HeaderText="Facility ID" SortExpression="Facility_ID" />
                <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="Zip" HeaderText="ZIP" SortExpression="Zip" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="PostOffice" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT FACILITY.Facility_ID, ADDRESS.Street, ADDRESS.City, ADDRESS.State, ADDRESS.Zip
FROM ADDRESS, FACILITY
WHERE ADDRESS.Address_ID = FACILITY.Address_ID AND ADDRESS.Zip = @Zip">
            <SelectParameters>
                <asp:ControlParameter ControlID="zipBox" Name="Zip" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
