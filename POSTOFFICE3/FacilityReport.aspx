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
        <table><tr> <td><asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Width="350px" Visible ="false">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
            <TodayDayStyle BackColor="#CCCCCC" />
        </asp:Calendar> </td> <td> 
                <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" OnSelectionChanged="Calendar2_SelectionChanged" Visible ="false">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
            </td></tr></table>
            Start Date:
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <asp:LinkButton ID="lnkpickdate" runat="server" OnClick="lnkpickdate_Click">Get Date</asp:LinkButton>
&nbsp;End Date:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Get Date</asp:LinkButton>
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Number of Parcels" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT COUNT(PACKAGE.Package_ID) FROM PACKAGE WHERE PACKAGE.Package_ID in (SELECT PACKAGE.Package_ID FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated BETWEEN @start AND @end) AND PACKAGE.Types = 'EE')">
            <SelectParameters>
                <asp:SessionParameter Name="facilityID" SessionField="facility_id" />
                <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Number of Letters" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT COUNT(PACKAGE.Package_ID) FROM PACKAGE WHERE PACKAGE.Package_ID in (SELECT PACKAGE.Package_ID FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated BETWEEN @start AND @end) AND PACKAGE.Types = 'LE')">
            <SelectParameters>
                <asp:SessionParameter Name="facilityID" SessionField="facility_id" />
                <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
