<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacilityReport.aspx.cs" Inherits="POSTOFFICE3.FacilityReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="css/bootstrap.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" style="font-size: xx-large; font-weight: 700" Text="Label"></asp:Label>
            <br />
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="-30">Last 30 days</asp:ListItem>
            <asp:ListItem Value="-60">Last 60 days</asp:ListItem>
            <asp:ListItem Value="-90">Last 90 days</asp:ListItem>
            <asp:ListItem Value="-999">All Time</asp:ListItem>
        </asp:DropDownList>
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Number of Parcels" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT COUNT(PACKAGE.Package_ID) FROM PACKAGE WHERE PACKAGE.Package_ID in (SELECT PACKAGE.Package_ID FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated &gt;= DATEADD(day,@days, getdate())) AND PACKAGE.Types = 'EE')">
            <SelectParameters>
                <asp:SessionParameter Name="facilityID" SessionField="facility_id" />
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="-30" Name="days" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Number of Letters" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT COUNT(PACKAGE.Package_ID) FROM PACKAGE WHERE PACKAGE.Package_ID in (SELECT PACKAGE.Package_ID FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated &gt;= DATEADD(day,@days, getdate())) AND PACKAGE.Types = 'LE')">
            <SelectParameters>
                <asp:SessionParameter Name="facilityID" SessionField="facility_id" />
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="-30" Name="days" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
