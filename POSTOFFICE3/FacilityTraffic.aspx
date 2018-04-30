<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacilityTraffic.aspx.cs" Inherits="POSTOFFICE3.FacilityTraffic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="css/bootstrap.css" rel="stylesheet" />

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <nav class="navbar navbar-dark" style="background-color: #116845">
              <a class="navbar-brand navbar-left" href="EmployeeDashboard.aspx">Employee Dashboard</a>
            <asp:Label ID="loggedin" Text="" class="navbar-text navbar-center" runat="server" />

          
            <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-danger" OnClick="btnLogout_Click" />

        </nav>
        <asp:Label ID="Label1" runat="server" style="font-size: xx-large; font-weight: 700" Text="Label"></asp:Label>
        <table><tr> <td> <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged1" Visible="false"></asp:Calendar></td> <td> 
            <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged" Visible="false"></asp:Calendar>
            </td></tr></table>
        
        <br />
        Start Date: <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;<asp:LinkButton ID="lnkpickdate" runat="server" OnClick="lnkpickdate_Click">Get Date</asp:LinkButton>
&nbsp;End Date:
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:LinkButton ID="lnkpickdate1" runat="server" OnClick="lnkpickdate1_Click">Get Date</asp:LinkButton>
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
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated BETWEEN @start AND @end) AND PACKAGE.Types = 'EE')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" DefaultValue="" Name="facilityID" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate" />
                    <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
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
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated BETWEEN @start AND @end) AND PACKAGE.Types = 'LE')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate" />
                        <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
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
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated BETWEEN @start AND @end) AND PACKAGE.Priority = 'FC')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate" />
                        <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
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
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated BETWEEN @start AND @end) AND PACKAGE.Priority = 'PE')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate" />
                        <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
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
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated BETWEEN @start AND @end) AND PACKAGE.Priority = 'PM')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate" />
                        <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
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
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated BETWEEN @start AND @end) AND PACKAGE.Priority = 'RG')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate"/>
                        <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>   </tr></table>




        <br />
        <table><tr> <td>        <asp:GridView ID="GridView9" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource9">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Packages Delivered" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView> </td> <td>        <asp:GridView ID="GridView10" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource10">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Packages Failed to Deliver" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView> </td> <td>        <asp:GridView ID="GridView11" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource11">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Packages Cancelled" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView> </td> <td>        <asp:GridView ID="GridView12" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource12" OnSelectedIndexChanged="GridView12_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Total Packages In Transit" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView> </td> <td>        <asp:GridView ID="GridView13" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource13">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Packages Returned" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView> </td></tr></table><br />
        <table><tr> <td>        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Package_ID" HeaderText="Package ID" SortExpression="Package_ID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Tracking_no" HeaderText="Tracking Number" SortExpression="Tracking_no" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Sender_ID" HeaderText="Customer ID" SortExpression="Sender_ID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Fname" HeaderText="Sender First Name" SortExpression="Fname" />
                <asp:BoundField DataField="Lname" HeaderText="Sender Last Name" SortExpression="Lname" />
                <asp:BoundField DataField="State" HeaderText="Sender State" SortExpression="State" />
                <asp:BoundField DataField="City" HeaderText="Sender City" SortExpression="City" />
                <asp:BoundField DataField="Street" HeaderText="Sender Street" SortExpression="Street" />
                <asp:BoundField DataField ="Zip" HeaderText ="Sender Zip" SortExpression="Zip" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
                <asp:BoundField DataField="Receiver_Fname" HeaderText="Receiver First Name" SortExpression="Receiver_Fname" />
                <asp:BoundField DataField="Receiver_Lname" HeaderText="Receiver Last Name" SortExpression="Receiver_Lname" />
                <asp:BoundField DataField="Street1" HeaderText="Destination Street" SortExpression="Street1" />
                <asp:BoundField DataField="City1" HeaderText="Destination City" SortExpression="City1" />
                <asp:BoundField DataField="State1" HeaderText="Destination State" SortExpression="State1" />
                <asp:BoundField DataField="Zip1" HeaderText="Destination Zip" SortExpression="Zip1" />
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
        </asp:GridView></td><td>        
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT ADDRESS.State, ADDRESS.City, ADDRESS.Street FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Receiver_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated BETWEEN @start AND @end)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate" />
                        <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td> </tr></table>





        <br />



        <br />

        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT PACKAGE.Package_ID,TRACKING.Tracking_no,Package.Sender_ID, CUSTOMER.Fname, CUSTOMER.Lname, ADDRESS.State, ADDRESS.City, ADDRESS.Street, ADDRESS.Zip,PACKAGE.Cost, PACKAGE.Weight, PACKAGE.Priority, PACKAGE.Receiver_Fname, PACKAGE.Receiver_Lname,b.State,b.City,b.Street,b.Zip FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING,ADDRESS b WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND b.Address_ID = PACKAGE.Receiver_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Last_updated BETWEEN @start AND @end)">
            <SelectParameters>
<asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="facilityID" DefaultValue=""></asp:ControlParameter>
                <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            <asp:TextBox ID="TextBox1" visible="false" runat="server" Text="1"></asp:TextBox>
 
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT COUNT(PACKAGE.Package_ID) FROM PACKAGE WHERE PACKAGE.Package_ID in (SELECT PACKAGE.Package_ID FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Status = 'D' AND SHIPPING_HISTORY.Last_updated BETWEEN @start AND @end))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate" />
                    <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT COUNT(PACKAGE.Package_ID) FROM PACKAGE WHERE PACKAGE.Package_ID in (SELECT PACKAGE.Package_ID FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Status = 'F' AND SHIPPING_HISTORY.Last_updated BETWEEN @start AND @end))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate" />
                    <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>

            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT COUNT(PACKAGE.Package_ID) FROM PACKAGE WHERE PACKAGE.Package_ID in (SELECT PACKAGE.Package_ID FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Status = 'C' AND SHIPPING_HISTORY.Last_updated BETWEEN @start AND @end))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate" />
                    <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <a href="EmployeeDashboard.aspx">Employee Dashboard</a>

        <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT COUNT(PACKAGE.Package_ID) FROM PACKAGE WHERE PACKAGE.Package_ID in (SELECT PACKAGE.Package_ID FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Status = 'T' AND SHIPPING_HISTORY.Last_updated BETWEEN @start AND @end))">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT COUNT(PACKAGE.Package_ID) FROM PACKAGE WHERE PACKAGE.Package_ID in (SELECT PACKAGE.Package_ID FROM CUSTOMER,ADDRESS,PACKAGE,TRACKING WHERE CUSTOMER.Customer_ID = PACKAGE.Sender_ID AND ADDRESS.Address_ID = PACKAGE.Sender_Address_ID AND PACKAGE.Package_ID = TRACKING.Package_ID AND TRACKING.Tracking_no in (
SELECT DISTINCT SHIPPING_HISTORY.Tracking_no FROM SHIPPING_HISTORY WHERE SHIPPING_HISTORY.Facility_ID=@facilityID AND SHIPPING_HISTORY.Status = 'R' AND SHIPPING_HISTORY.Last_updated BETWEEN @start AND @end))">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="facilityID" PropertyName="Text" />
                <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
