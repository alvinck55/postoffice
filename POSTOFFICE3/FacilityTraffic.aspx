<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacilityTraffic.aspx.cs" Inherits="POSTOFFICE3.FacilityTraffic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
        </div>
        <asp:Label ID="Label1" runat="server" style="font-size: xx-large; font-weight: 700" Text="Label"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="-30">Last 30 days</asp:ListItem>
            <asp:ListItem Value="-60">Last 60 days</asp:ListItem>
            <asp:ListItem Value="-90">Last 90 days</asp:ListItem>
            <asp:ListItem Value="-999">All Time</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Tracking_no" HeaderText="Tracking_no" SortExpression="Tracking_no" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated &gt;= DATEADD(day,@days, getdate())">
            <SelectParameters>
<asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="facilityID"></asp:ControlParameter>
                <asp:ControlParameter ControlID="DropDownList1" Name="days" PropertyName="SelectedValue" DefaultValue="-30" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            <asp:TextBox ID="TextBox1" visible="false" runat="server" Text="1"></asp:TextBox>
        </p>
    </form>
</body>
</html>
