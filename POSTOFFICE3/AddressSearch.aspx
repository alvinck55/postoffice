<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressSearch.aspx.cs" Inherits="POSTOFFICE3.AddressSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="css/bootstrap.css" rel="stylesheet" />

    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <nav class="navbar navbar-dark" style="background-color: #116845">
              <a class="navbar-brand navbar-left" href="EmployeeDashboard.aspx">Employee Dashboard</a>
            <asp:Label ID="loggedin" Text="" class="navbar-text navbar-center" runat="server" />

          
            <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-danger" OnClick="btnLogout_Click" />

        </nav>
        Enter Address Information:<br />
        <br />
        Street:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        City:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        State:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="State" DataValueField="State_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT [State], [State_ID] FROM [STATE]"></asp:SqlDataSource>
        <br />
        Zip:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
        <br />
        <br />
        <span class="auto-style1"><strong>Packages Sent:</strong></span><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Package_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Package_ID" HeaderText="Package ID" InsertVisible="False" ReadOnly="True" SortExpression="Package_ID" />
                <asp:BoundField DataField="Tracking_no" HeaderText="Tracking Number" SortExpression="Tracking_no" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                <asp:BoundField DataField="Types" HeaderText="Types" SortExpression="Types" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
                <asp:BoundField DataField="Receiver_Fname" HeaderText="Receiver First Name" SortExpression="Receiver_Fname" />
                <asp:BoundField DataField="Receiver_Lname" HeaderText="Receiver Last Name" SortExpression="Receiver_Lname" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT PACKAGE.Package_ID, PACKAGE.Tracking_no,PACKAGE.Cost,PACKAGE.Types,PACKAGE.Weight,PACKAGE.Priority,PACKAGE.Receiver_Fname,PACKAGE.Receiver_Lname
FROM PACKAGE,ADDRESS
WHERE PACKAGE.Sender_Address_ID = ADDRESS.Address_ID AND ADDRESS.Street = @street AND ADDRESS.City = @city AND ADDRESS.State = @state AND ADDRESS.Zip = @zip">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox2" Name="street" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox3" Name="city" PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList1" Name="state" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TextBox1" Name="zip" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <span class="auto-style1"><strong>Packages Received:</strong></span><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Package_ID" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Package_ID" HeaderText="Package ID" InsertVisible="False" ReadOnly="True" SortExpression="Package_ID" />
                <asp:BoundField DataField="Tracking_no" HeaderText="Tracking Number" SortExpression="Tracking_no" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                <asp:BoundField DataField="Types" HeaderText="Types" SortExpression="Types" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
                <asp:BoundField DataField="Receiver_Fname" HeaderText="Receiver First Name" SortExpression="Receiver_Fname" />
                <asp:BoundField DataField="Receiver_Lname" HeaderText="Receiver Last Name" SortExpression="Receiver_Lname" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT PACKAGE.Package_ID, PACKAGE.Tracking_no,PACKAGE.Cost,PACKAGE.Types,PACKAGE.Weight,PACKAGE.Priority,PACKAGE.Receiver_Fname,PACKAGE.Receiver_Lname
FROM PACKAGE,ADDRESS
WHERE PACKAGE.Receiver_Address_ID = ADDRESS.Address_ID AND ADDRESS.Street = @street AND ADDRESS.City = @city AND ADDRESS.State = @state AND ADDRESS.Zip = @zip">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox2" Name="street" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox3" Name="city" PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList1" Name="state" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TextBox1" Name="zip" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
