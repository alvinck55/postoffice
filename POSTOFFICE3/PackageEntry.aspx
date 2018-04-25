<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackageEntry.aspx.cs" Inherits="POSTOFFICE3.PackageEntry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create a Shipping Label</title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Post Office Create Shipping Label</h1>
        <div>
            <asp:Label ID="logText" runat="server" Text=""></asp:Label>
            <br />
            <br />
            Enter Package Info:</div>
        <br />
        Use Existing Address:<asp:DropDownList ID="DropDownList5" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="Customeraddress" DataTextField="Street" DataValueField="Address_ID" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
            <asp:ListItem>Select</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="Customeraddress" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT ADDRESS.Street, ADDRESS.Address_ID FROM ADDRESS,CUSTOMER_ADDRESS WHERE ADDRESS.Address_ID = CUSTOMER_ADDRESS.Address_ID AND CUSTOMER_ADDRESS.Customer_ID = @customerid">
            <SelectParameters>
                <asp:SessionParameter Name="customerid" SessionField="customerid" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
&nbsp;<br />
        <span class="auto-style1"><strong>OR</strong></span><br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Type of Package:
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="PostOffice" DataTextField="Type" DataValueField="Type_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" Width="80px" AutoPostBack="True">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:SqlDataSource ID="PostOffice" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT TYPE.Type, TYPE.Type_ID FROM TYPE"></asp:SqlDataSource>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Priority of Package:<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="PostOfficePriority" DataTextField="Priority" DataValueField="Priority_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="PostOfficePriority" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString3 %>" SelectCommand="SELECT PRIORITY.Priority,PRIORITY.Priority_ID FROM PRIORITY"></asp:SqlDataSource>
        <br />
        Sender Address:<asp:TextBox ID="S_Address_TextBox" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Weight of Package(Estimated):
        <asp:TextBox ID="Weight_TextBox" ReadOnly="false" runat="server"></asp:TextBox>
        LB<br />
        Sender Apt #(OPTIONAL):<asp:TextBox ID="S_Apt_TextBox" runat="server"></asp:TextBox>
        <br />
        Sender City:<asp:TextBox ID="S_City_TextBox" runat="server"></asp:TextBox>
        <br />
        Sender State:<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="states" DataTextField="State" DataValueField="State_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="states" runat="server" ConnectionString="<%$ ConnectionStrings:POSTOFFICE2ConnectionString %>" SelectCommand="SELECT STATE.State, STATE.State_ID FROM STATE"></asp:SqlDataSource>
        <br />
        Sender Zip:<asp:TextBox ID="S_Zip_TextBox" runat="server"></asp:TextBox>
        <br />
        Sender Postal Code(OPTIONAL):<asp:TextBox ID="S_PostalCode_TextBox" runat="server"></asp:TextBox>
        <br />
        <br />
        Receiver First Name:<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        <br />
        Receiver Last Name:<asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
        <br />
        Receiver Address:<asp:TextBox ID="R_Address_TextBox" runat="server"></asp:TextBox>
        <br />
        Receiver Apt#(OPTIONAL):<asp:TextBox ID="R_Apt_TextBox" runat="server"></asp:TextBox>
        <br />
        Receiver City:<asp:TextBox ID="R_City_TextBox" runat="server"></asp:TextBox>
        <br />
        Receiver State:<asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="states" DataTextField="State" DataValueField="State_ID">
        </asp:DropDownList>
        <br />
        Receiver Zip:<asp:TextBox ID="R_Zip_TextBox" runat="server"></asp:TextBox>
        <br />
        Receiver Postal Code(OPTIONAL):<asp:TextBox ID="R_PostalCode_TextBox" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <a href="Dashboard.aspx">Dashboard</a>
    </form>
</body>
</html>
