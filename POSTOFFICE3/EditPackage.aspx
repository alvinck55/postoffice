<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditPackage.aspx.cs" Inherits="POSTOFFICE3.EditPackage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" style="font-size: xx-large" Text="Label"></asp:Label>
            <br />
            <br />
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Package_ID" DataSourceID="SqlDataSource1" >
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Package_ID" HeaderText="Package ID"  InsertVisible="False" ReadOnly="True" SortExpression="Package_ID" />
                <asp:BoundField DataField="Tracking_no" HeaderText="Tracking Number" InsertVisible="false" ReadOnly="True" SortExpression="Tracking_no" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" UpdateCommand="UPDATE [PACKAGE] SET [WEIGHT] = @Weight, [PRIORITY] = @Priority WHERE [Package_ID] = @Package_ID" SelectCommand="SELECT PACKAGE.Package_ID, PACKAGE.Tracking_no, PACKAGE.Weight, PACKAGE.Priority FROM PACKAGE INNER JOIN TRACKING ON TRACKING.Package_ID = PACKAGE.Package_ID AND TRACKING.Facility_ID = @facility_id">
            <SelectParameters>
                <asp:SessionParameter Name="facility_id" SessionField="facility_id" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Weight" Type="Decimal" />
                <asp:Parameter Name="Priority" Type="String" />
                <asp:Parameter Name="Package_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
