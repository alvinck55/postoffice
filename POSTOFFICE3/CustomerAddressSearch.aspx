<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerAddressSearch.aspx.cs" Inherits="POSTOFFICE3.CustomerAddressSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />

    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-dark" style="background-color: #471268">
              <a class="navbar-brand navbar-left" href="Dashboard.aspx">Dashboard</a>
            <asp:Label ID="loggedin" Text="" class="navbar-text navbar-center" runat="server" />

          
            <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-danger" OnClick="btnLogout_Click" />

        </nav>
            Address:
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Street" DataValueField="Address_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT ADDRESS.Street, ADDRESS.Address_ID FROM ADDRESS,CUSTOMER_ADDRESS WHERE ADDRESS.Address_ID = CUSTOMER_ADDRESS.Address_ID AND CUSTOMER_ADDRESS.Customer_ID = @customerid">
                <SelectParameters>
                    <asp:SessionParameter Name="customerid" SessionField="customerid" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <span class="auto-style1"><strong>Packages Sent:</strong></span></div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Package_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Package_ID" HeaderText="Package_ID" InsertVisible="False" ReadOnly="True" SortExpression="Package_ID" />
                <asp:BoundField DataField="Tracking_no" HeaderText="Tracking_no" SortExpression="Tracking_no" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                <asp:BoundField DataField="Types" HeaderText="Types" SortExpression="Types" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
                <asp:BoundField DataField="Receiver_Fname" HeaderText="Receiver_Fname" SortExpression="Receiver_Fname" />
                <asp:BoundField DataField="Receiver_Lname" HeaderText="Receiver_Lname" SortExpression="Receiver_Lname" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT PACKAGE.Package_ID, PACKAGE.Tracking_no,PACKAGE.Cost,PACKAGE.Types,PACKAGE.Weight,PACKAGE.Priority,PACKAGE.Receiver_Fname,PACKAGE.Receiver_Lname
FROM PACKAGE,ADDRESS
WHERE PACKAGE.Sender_Address_ID = ADDRESS.Address_ID AND ADDRESS.Address_ID = @addressid AND PACKAGE.Sender_ID = @customerid">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="addressid" PropertyName="SelectedValue" />
                <asp:SessionParameter Name="customerid" SessionField="customerid" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <span class="auto-style1"><strong>Packages Received:</strong></span><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Package_ID" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField DataField="Package_ID" HeaderText="Package_ID" InsertVisible="False" ReadOnly="True" SortExpression="Package_ID" />
                <asp:BoundField DataField="Tracking_no" HeaderText="Tracking_no" SortExpression="Tracking_no" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                <asp:BoundField DataField="Types" HeaderText="Types" SortExpression="Types" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
                <asp:BoundField DataField="Receiver_Fname" HeaderText="Receiver_Fname" SortExpression="Receiver_Fname" />
                <asp:BoundField DataField="Receiver_Lname" HeaderText="Receiver_Lname" SortExpression="Receiver_Lname" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT PACKAGE.Package_ID, PACKAGE.Tracking_no,PACKAGE.Cost,PACKAGE.Types,PACKAGE.Weight,PACKAGE.Priority,PACKAGE.Receiver_Fname,PACKAGE.Receiver_Lname
FROM PACKAGE,ADDRESS
WHERE PACKAGE.Receiver_Address_ID = ADDRESS.Address_ID AND ADDRESS.Address_ID = @addressid AND PACKAGE.Sender_ID = @customerid">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="addressid" PropertyName="SelectedValue" />
                <asp:SessionParameter Name="customerid" SessionField="customerid" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
