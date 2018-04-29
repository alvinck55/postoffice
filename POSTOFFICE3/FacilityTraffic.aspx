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
        <table><tr> <td>        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Number of Parcels" ReadOnly="True" SortExpression="Column1" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT COUNT(PACKAGE.Package_ID) FROM PACKAGE WHERE PACKAGE.Package_ID in (SELECT PACKAGE.Package_ID FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated &gt;= DATEADD(day,@days, getdate())) AND PACKAGE.Types = 'EE')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" DefaultValue="" Name="facilityID" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DropDownList1" DefaultValue="-30" Name="days" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            </td> <td>        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Column1" HeaderText="Number of Letters" ReadOnly="True" SortExpression="Column1" />
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
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT COUNT(PACKAGE.Package_ID) FROM PACKAGE WHERE PACKAGE.Package_ID in (SELECT PACKAGE.Package_ID FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated &gt;= DATEADD(day,@days, getdate())) AND PACKAGE.Types = 'LE')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="-30" Name="days" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td> <td>        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Column1" HeaderText="Number of First Class Mail" ReadOnly="True" SortExpression="Column1" />
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
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT COUNT(PACKAGE.Package_ID) FROM PACKAGE WHERE PACKAGE.Package_ID in (SELECT PACKAGE.Package_ID FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated &gt;= DATEADD(day,@days, getdate())) AND PACKAGE.Priority = 'FC')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="-30" Name="days" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td> <td>        <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Column1" HeaderText="Number of Priority Mail Express" ReadOnly="True" SortExpression="Column1" />
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
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT COUNT(PACKAGE.Package_ID) FROM PACKAGE WHERE PACKAGE.Package_ID in (SELECT PACKAGE.Package_ID FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated &gt;= DATEADD(day,@days, getdate())) AND PACKAGE.Priority = 'PE')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="-30" Name="days" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td> <td>        <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource7" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Column1" HeaderText="Number of Priority Mail" ReadOnly="True" SortExpression="Column1" />
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
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT COUNT(PACKAGE.Package_ID) FROM PACKAGE WHERE PACKAGE.Package_ID in (SELECT PACKAGE.Package_ID FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated &gt;= DATEADD(day,@days, getdate())) AND PACKAGE.Priority = 'PM')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="-30" Name="days" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td> <td>        <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource8" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Column1" HeaderText="Number of Retail Ground Mail" ReadOnly="True" SortExpression="Column1" />
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
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT COUNT(PACKAGE.Package_ID) FROM PACKAGE WHERE PACKAGE.Package_ID in (SELECT PACKAGE.Package_ID FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated &gt;= DATEADD(day,@days, getdate())) AND PACKAGE.Priority = 'RG')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="-30" Name="days" PropertyName="SelectedValue" Type="Int32"/>
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>   </tr></table>




        <br />
        <br />
        <table><tr> <td>        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="Package_ID" HeaderText="Package ID" SortExpression="Package_ID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Tracking_no" HeaderText="Tracking Number" SortExpression="Tracking_no" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Fname" HeaderText="Sender First Name" SortExpression="Fname" />
                <asp:BoundField DataField="Lname" HeaderText="Sender Last Name" SortExpression="Lname" />
                <asp:BoundField DataField="State" HeaderText="Sender State" SortExpression="State" />
                <asp:BoundField DataField="City" HeaderText="Sender City" SortExpression="City" />
                <asp:BoundField DataField="Street" HeaderText="Sender Street" SortExpression="Street" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
                <asp:BoundField DataField="Receiver_Fname" HeaderText="Receiver First Name" SortExpression="Receiver_Fname" />
                <asp:BoundField DataField="Receiver_Lname" HeaderText="Receiver Last Name" SortExpression="Receiver_Lname" />
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
        </asp:GridView></td><td>        <asp:GridView ID="GridView2" runat="server" style="margin-bottom: 0px; margin-right: 0px;" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="State" HeaderText="Receiver Address State" SortExpression="State" />
                    <asp:BoundField DataField="City" HeaderText="Receiver Address City" SortExpression="City" />
                    <asp:BoundField DataField="Street" HeaderText="Receiver Address " SortExpression="Street" />
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT ADDRESS.State, ADDRESS.City, ADDRESS.Street FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Receiver_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated &gt;= DATEADD(day,@days, getdate()))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="-30" Name="days" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td> </tr></table>

        <br />

        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT PACKAGE.Package_ID,TRACKING.Tracking_no, CUSTOMER.Fname, CUSTOMER.Lname, ADDRESS.State, ADDRESS.City, ADDRESS.Street, PACKAGE.Cost, PACKAGE.Weight, PACKAGE.Priority, PACKAGE.Receiver_Fname, PACKAGE.Receiver_Lname FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated &gt;= DATEADD(day,@days, getdate()))">
            <SelectParameters>
<asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="facilityID"></asp:ControlParameter>
                <asp:ControlParameter ControlID="DropDownList1" Name="days" PropertyName="SelectedValue" DefaultValue="-30" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            <asp:TextBox ID="TextBox1" visible="false" runat="server" Text="1"></asp:TextBox>
        </p>
        <a href="EmployeeDashboard.aspx">Employee Dashboard</a>

    </form>
</body>
</html>
