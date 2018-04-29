<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchCustomer.aspx.cs" Inherits="POSTOFFICE3.SearchCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="css/bootstrap.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter Customer Info:<br />
            <br />
            First Name:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            Last Name:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            Address:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            State:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="State" DataValueField="State_ID" AppendDataBoundItems="true">
                <asp:ListItem>Select</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT [State], [State_ID] FROM [STATE]"></asp:SqlDataSource>
            <br />
            City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            Zip:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">

        </asp:GridView>
    &nbsp;Enter Customer ID:&nbsp;
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button2" runat="server" Text="Search" OnClick="Button2_Click" />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT         p.Tracking_no, p.Receiver_Fname,p.Receiver_Lname, a.Street, a.State, a.City, a.Zip, t.Type, p.Weight, r.Priority, p.Last_updated
            FROM PACKAGE p, CUSTOMER c, TYPE t, PRIORITY r, ADDRESS a
            WHERE
        p.Sender_ID=c.Customer_ID
AND a.Address_ID = p.Receiver_Address_ID
            AND c.Customer_ID=@customerid
            AND p.Types = t.Type_ID
            AND p.Priority = r.Priority_ID
">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox6" Name="customerid" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table><tr> <td>        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
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
            </Columns>
            </asp:GridView> </td><td><asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField DataField="Street" HeaderText="Sender Street" SortExpression="Street" />
                <asp:BoundField DataField="State" HeaderText="Sender State" SortExpression="State" />
                <asp:BoundField DataField="City" HeaderText="Sender City" SortExpression="City" />
                <asp:BoundField DataField="Zip" HeaderText="Sender Zip" SortExpression="Zip" />
            </Columns>
        </asp:GridView> </td></tr></table>

        <br />
        <a href="EmployeeDashboard.aspx">Dashboard</a>
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
