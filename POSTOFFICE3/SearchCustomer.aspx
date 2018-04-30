<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchCustomer.aspx.cs" Inherits="POSTOFFICE3.SearchCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="css/bootstrap.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
         <nav class="navbar navbar-dark" style="background-color: #116845">
              <a class="navbar-brand navbar-left" href="EmployeeDashboard.aspx">Employee Dashboard</a>
            <asp:Label ID="loggedin" Text="" class="navbar-text navbar-center" runat="server" />

          
            <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-danger" OnClick="btnLogout_Click" />

        </nav>
        <div class="col-md-4">
            Enter Customer Info:<br />
            <br />
            First Name:<asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            Last Name:<asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            Address:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            State:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="State" DataValueField="State_ID" AppendDataBoundItems="true">
                <asp:ListItem>Select</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT [State], [State_ID] FROM [STATE]"></asp:SqlDataSource>
            <br />
            City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            Zip:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Search" OnClick="Button1_Click" />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
        <div class="col-md-4">
        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
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
    &nbsp;Enter Customer ID:&nbsp;
            <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button2" runat="server" class="btn btn-primary" Text="Search" OnClick="Button2_Click" />
        <br />
            </div>
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT         p.Tracking_no, p.Receiver_Fname,p.Receiver_Lname, a.Street, a.State, a.City, a.Zip, t.Type, p.Weight, r.Priority, p.Last_updated, b.Street,b.State,b.City,b.Zip
            FROM PACKAGE p, CUSTOMER c, TYPE t, PRIORITY r, ADDRESS a,ADDRESS b
            WHERE
        p.Sender_ID=c.Customer_ID
AND a.Address_ID = p.Receiver_Address_ID
AND b.Address_ID = p.Sender_Address_ID
            AND c.Customer_ID=@customerid
            AND p.Types = t.Type_ID
            AND p.Priority = r.Priority_ID
">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox6" Name="customerid" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table><tr> <td>        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="Tracking_no" HeaderText="Tracking Number" SortExpression="Tracking_no" />
                <asp:BoundField DataField="Receiver_Fname" HeaderText="Receiver First Name" SortExpression="Receiver_Fname" />
                <asp:BoundField DataField="Receiver_Lname" HeaderText="Receiver Last Name" SortExpression="Receiver_Lname" />
                <asp:BoundField DataField="Street" HeaderText="Receiver Street" SortExpression="Street" />
                <asp:BoundField DataField="State" HeaderText="Receiver State" SortExpression="State" />
                <asp:BoundField DataField="City" HeaderText="Receiver City" SortExpression="City" />
                <asp:BoundField DataField="Zip" HeaderText="Receiver Zip" SortExpression="Zip" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
                <asp:BoundField DataField="Last_updated" HeaderText="Last Updated" SortExpression="Last_updated" />
                <asp:BoundField DataField="Street1" HeaderText="Sender Street" SortExpression="Street1" />
                <asp:BoundField DataField="City1" HeaderText="Sender City" SortExpression="City1" />
                <asp:BoundField DataField="State1" HeaderText="Sender State" SortExpression="State1" />
                <asp:BoundField DataField="Zip1" HeaderText="Sender Zip" SortExpression="Zip1" />
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
            </asp:GridView> </td><td>&nbsp;</td></tr></table>

        <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT       a.Street, a.State, a.City, a.Zip
            FROM PACKAGE p, CUSTOMER c,ADDRESS a
            WHERE
        p.Sender_ID=c.Customer_ID
AND a.Address_ID = p.Sender_Address_ID
            AND c.Customer_ID=@customerid

">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox6" Name="customerid" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
